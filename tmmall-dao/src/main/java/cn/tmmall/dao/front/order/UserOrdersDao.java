package cn.tmmall.dao.front.order;

import cn.tmmall.pojo.OrderItem;
import cn.tmmall.pojo.Orders;
import cn.tmmall.pojo.ProductImage;
import org.apache.ibatis.annotations.*;
import org.springframework.core.annotation.Order;

import java.util.List;

/**
 * 用户的订单接口
 *
 * @Author: Alex Yj
 * @Date: 2019/5/16 8:42
 */
public interface UserOrdersDao {

    /**
     * 更据用户信息和订单id更新订单状态
     *
     * @param orders
     */
    void updateOrderStatus(Orders orders);

    /**
     * 根据订单项Id 查询商品信息
     *
     * @param id
     * @return
     */
    Orders findByOrderItem(Integer id);

    /**
     * 查询用户所有订单
     *
     * @param id
     * @param status
     * @return
     */
    List<Orders> findAllOrders(@Param("id") Integer id, @Param("status") String status);

    /**
     * 插入一条订单
     *
     */
    @Insert("INSERT INTO orders (orderCode, address, post, receiver, mobile, userMessage, createDate, uid, status)" +
            " VALUES(#{orderCode}, #{address}, #{post}, #{receiver}, #{mobile}, #{userMessage}, #{createDate}, #{uid}, #{status}) ")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    void inserOrder(Orders orders);

    /**
     * 将购物车中要购买的商品 添加订单号
     *
     * @param orderItem
     */
    @Update(" UPDATE orderitem SET oid = #{oid} WHERE uid = #{uid} AND id = #{id} ")
    void inserOrderItem(OrderItem orderItem);
}
