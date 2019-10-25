package cn.tmmall.service.front.car;

import cn.tmmall.pojo.OrderItem;

import java.util.List;

/**
 * 购物车服务
 *
 * @Author: Alex Yu
 * @Date: 2019/5/19 23:57
 */
public interface UserShopCarService {

    /**
     * 添加进购物车
     *
     * @param orderItem
     */
    void userAddCat(OrderItem orderItem);

    /**
     * 查询对应用户购物车商品数量
     *
     * @param uid
     * @return
     */
    Integer countSumUserShopCar(Integer uid);

    /**
     *  查询用户购物车所有商品
     *
     * @param uid
     * @return
     */
    List<OrderItem> findAllUserShopCar(Integer uid);

    /**
     * 修改数量
     *
     * @param orderItem
     */
    void numberOperation(OrderItem orderItem);

    /**
     * 删除购物车中的一项订单
     *
     * @param pid
     * @param uid
     */
    void deleteUserShopCar(Integer pid, Integer uid);

    /**
     * 查询商品信息
     *
     * @param pids
     */
    List<OrderItem> findProductMsg(Integer[] pids, Integer uid, Integer number);
}
