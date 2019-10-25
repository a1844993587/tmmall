package cn.tmmall.dao.back.order;

import cn.tmmall.pojo.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface OrdersDao {
    /**
     * 查询用户所有订单
     *
     * @return
     */
    List<Orders> findAllOrders();


    /**
     * 根据id删除订单
     */

    void deleteOrders(Integer id);

    /**
     * 批量删除
     */

    void deleteOrdersByids(@Param("listid") ArrayList<Integer> list);

}