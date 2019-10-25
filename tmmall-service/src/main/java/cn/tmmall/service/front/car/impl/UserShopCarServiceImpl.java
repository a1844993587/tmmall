package cn.tmmall.service.front.car.impl;

import cn.tmmall.dao.front.car.UserShopCarDao;
import cn.tmmall.service.front.car.UserShopCarService;
import cn.tmmall.pojo.OrderItem;
import cn.tmmall.utils.MathUtils;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 购物车服务实现
 *
 * @Author: Alex Yu
 * @Date: 2019/5/19 23:57
 */
@Service
public class UserShopCarServiceImpl implements UserShopCarService {

    @Autowired
    UserShopCarDao userShopCarDao;

    /**
     * 将商品添加进购物车
     *
     * @param orderItem
     */
    @Override
    public void userAddCat(OrderItem orderItem) {
        List<OrderItem> orderItems = userShopCarDao.findAllUserShopCar(orderItem);
        /**
         * 判断购物车中是否有该商品存在
         */
        if (orderItems.size() == 0) {
            /**
             * 不存在
             */
            userShopCarDao.userAddShopCar(orderItem);
        } else {
            /**
             * 存在 更新数量
             */
            Integer dbNumbe = orderItems.get(0).getNumber();
            Integer beanNumber = orderItem.getNumber();
            Integer count = dbNumbe + beanNumber;
            orderItem.setNumber(count);
            userShopCarDao.updateUserShopCar(orderItem);
        }
    }

    /**
     * 查询用户购物车商品数量
     *
     * @param uid
     * @return
     */
    @Override
    public Integer countSumUserShopCar(Integer uid) {
        return userShopCarDao.countSumUserShopCar(uid);
    }

    /**
     * 查询用户所有购物车中的商品
     *
     * @param uid
     * @return
     */
    @Override
    public List<OrderItem> findAllUserShopCar(Integer uid) {
        OrderItem orderItem = new OrderItem();
        orderItem.setUid(uid);
        return userShopCarDao.findAllUserShopCar(orderItem);
    }

    /**
     * 修改商品数量
     *
     * @param orderItem
     */
    @Override
    public void numberOperation(OrderItem orderItem) {
        userShopCarDao.updateUserShopCar(orderItem);
    }

    /**
     * 删除购物车中的一项订单
     *
     * @param pid
     * @param uid
     */
    @Override
    public void deleteUserShopCar(Integer pid, Integer uid) {
        OrderItem orderItem = new OrderItem();
        orderItem.setPid(pid);
        orderItem.setUid(uid);
        userShopCarDao.deleteUserShopCar(orderItem);
    }

    /**
     * 查询商品信息
     *
     * @param pids
     * @return
     */
    @Override
    public List<OrderItem> findProductMsg(Integer[] pids, Integer uid, Integer number) {
        OrderItem orderItem = new OrderItem();
        List<OrderItem> orderItems = new ArrayList<OrderItem>();
        orderItem.setUid(uid);
        /**
         * 判断是否有数量
         */
        if (number != null) orderItem.setNumber(number);
        Float count = 0f;
        for (Integer pid : pids) {
            orderItem.setPid(pid);
            if (number != null) userAddCat(orderItem);
            /**
             * 再次查询计算价格
             */
            List<OrderItem> items = userShopCarDao.findAllUserShopCar(orderItem);
            Integer numbers = items.get(0).getNumber();
            Float price = items.get(0).getProduct().getPromotePrice();
            Float totalPrice = MathUtils.getTotalPrice(price, numbers);
            /**
             * 设置单个商品价格之和
             */
            items.get(0).setSingleTotal(totalPrice);
            count += totalPrice;
            orderItems.add(items.get(0));

        }
        /**
         * 设置总价
         */
        orderItems.get(0).setCountPrice(count);
        return orderItems;
    }


}
