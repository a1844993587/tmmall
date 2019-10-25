package cn.tmmall.service.front.order;

import cn.tmmall.pojo.OrderItem;
import cn.tmmall.pojo.Orders;
import org.springframework.core.annotation.Order;

import java.util.List;

/**
 * order订单业务层接口
 *
 * @Author: Alex Yj
 * @Date: 2019/5/16 11:49
 */
public interface UserOrdersService {

    /**
     * 查询对应用户的所有订单
     *
     * @param id
     * @return
     */
    List<Orders> findAllUserOrderItem(Integer id, String status);

    /**
     * 更新用户订单状态
     *
     * @param id
     */
    void updateOrderItemsStatus(Integer id);

    /**
     * 根据订单项Id 查询商品信息和订单信息
     *
     * @param id
     * @return
     */
    Orders findByOrderItem(Integer id);

    /**
     * 确认收货
     *
     * @param id
     */
    void confirmGoods(Integer id);

    /**
     * 发货
     *
     * @param id
     */
    void eliverGoods(Integer id);

    /**
     * 删除订单
     *
     * @param id
     */
    void deleteOrder(Integer id);

    /**
     * 添加订单
     *  返回添加订单的所有信息
     *
     * @param orders
     */
    Orders submitOrdetItem(Orders orders);
}