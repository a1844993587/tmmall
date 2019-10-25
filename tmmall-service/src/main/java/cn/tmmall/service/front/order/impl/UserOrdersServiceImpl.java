package cn.tmmall.service.front.order.impl;

import cn.tmmall.dao.front.order.UserOrdersDao;
import cn.tmmall.pojo.OrderItem;
import cn.tmmall.pojo.Orders;
import cn.tmmall.service.front.order.UserOrdersService;
import cn.tmmall.utils.KeyUtils;
import cn.tmmall.utils.MathUtils;
import cn.tmmall.utils.StatusUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * order订单业务层
 *
 * @Author: Alex Yj
 * @Date: 2019/5/16 11:44
 */
@Service
public class UserOrdersServiceImpl implements UserOrdersService {

    @Autowired
    private UserOrdersDao userOrdersDao;

    /**
     * 查询所有订单
     *
     * @param id
     * @param status
     * @return
     */
    public List<Orders> findAllUserOrderItem(Integer id, String status) {
        /**
         * 从数据库查出该用户所拥有的订单
         */
        List<Orders> orderItems = userOrdersDao.findAllOrders(id, status);
        for (Orders orderItem : orderItems) {
            List<OrderItem> items = orderItem.getOrderItems();
            Float totalPrice = 0f;
            Integer count = 0;
            for (OrderItem item : items) {
                /**
                 * 获取数量
                 */
                Integer number = item.getNumber();
                /**
                 * 获取价格
                 */
                Float promotePrice = item.getProduct().getPromotePrice();
                /**
                 * 计算价格
                 */
                Float price = MathUtils.getTotalPrice(promotePrice, number);
                totalPrice += price;
                count += number;
            }
            orderItem.setTotalPrice(totalPrice);
            orderItem.setCountNumber(count);
        }
        return orderItems;
    }

    /**
     * 更新用户订单状态
     *
     * @param id
     */
    @Override
    public void updateOrderItemsStatus(Integer id) {
        Orders orders = new Orders();
        /**
         * 设置状态为未发货
         */
        orders.setStatus(StatusUtils.WAIT_DELIVERY);
        orders.setPayDate(new Date());
        orders.setId(id);
        userOrdersDao.updateOrderStatus(orders);
    }

    /**
     * 查询订单和商品信息
     *
     * @param id
     * @return
     */
    @Override
    public Orders findByOrderItem(Integer id) {
        Orders orders = userOrdersDao.findByOrderItem(id);
        Float totalPrice = 0f;
        Integer count = 0;
        for (OrderItem orderItem : orders.getOrderItems()) {
            /**
             * 获取数量
             */
            Integer number = orderItem.getNumber();
            /**
             * 获取价格
             */
            Float promotePrice = orderItem.getProduct().getPromotePrice();
            /**
             * 计算价格
             */
            Float price = MathUtils.getTotalPrice(promotePrice, number);
            orderItem.setSingleTotal(price);
            totalPrice += price;
            count += number;
        }
        orders.setTotalPrice(totalPrice);
        orders.setCountNumber(count);
        return orders;
    }

    /**
     * 确认收货
     *
     * @param id
     */
    @Override
    public void confirmGoods(Integer id) {
        Orders orders = new Orders();
        orders.setId(id);
        /**
         * 设置状态为待评价
         */
        orders.setStatus(StatusUtils.WAIT_REVIEW);
        orders.setConfirmDate(new Date());
        userOrdersDao.updateOrderStatus(orders);
    }

    /**
     * 发货
     *
     * @param id
     */
    @Override
    public void eliverGoods(Integer id) {
        Orders orders = new Orders();
        /**
         * 设置状态为等待收货
         */
        orders.setId(id);
        orders.setStatus(StatusUtils.WAIT_CONFIRM);
        orders.setDeliveryDate(new Date());
        userOrdersDao.updateOrderStatus(orders);
    }

    /**
     * 删除订单
     *
     * @param id
     */
    @Override
    public void deleteOrder(Integer id) {
        Orders orders = new Orders();
        /**
         * 设置状态为等待收货
         */
        orders.setId(id);
        orders.setStatus(StatusUtils.DELETE);
        userOrdersDao.updateOrderStatus(orders);
    }

    /**
     * 添加订单
     *
     * @param orders
     */
    @Override
    public Orders submitOrdetItem(Orders orders) {
        /**
         * 设置下单时间和生成订单号 设置状态为未支付
         */
        orders.setCreateDate(new Date());
        orders.setOrderCode(KeyUtils.getUUID());
        orders.setStatus(StatusUtils.WAIT_PAY);
        /**
         * 插入订单 返回插入订单的id
         */
        userOrdersDao.inserOrder(orders);
        for (OrderItem orderItem : orders.getOrderItems()) {
            orderItem.setOid(orders.getId());
            orderItem.setUid(orders.getUid());
            userOrdersDao.inserOrderItem(orderItem);
        }
        return orders;
    }

}
