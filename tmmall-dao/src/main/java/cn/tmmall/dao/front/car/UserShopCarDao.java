package cn.tmmall.dao.front.car;

import cn.tmmall.pojo.OrderItem;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * 购物车Dao
 *
 * @Author: Alex Yu
 * @Date: 2019/5/20 0:09
 */
public interface UserShopCarDao {

    /**
     * 查询该用户的购车所有商品或者单个商品
     *
     * @param orderItem
     * @return
     */
    List<OrderItem> findAllUserShopCar(OrderItem orderItem);

    /**
     * 加入购物车
     *
     * @param orderItem
     */
    @Insert("INSERT INTO orderitem(pid, uid, number) VALUES(#{pid}, #{uid}, #{number})")
    void userAddShopCar(OrderItem orderItem);

    /**
     * 更新购物车信息
     *
     * @param orderItem
     */
    @Update("UPDATE orderitem SET number = #{number} WHERE uid = #{uid} AND pid = #{pid} AND ISNULL(oid)")
    void updateUserShopCar(OrderItem orderItem);

    /**
     *计算用户购物车总数量
     *
     * @return
     */
    @Select("SELECT sum(number) FROM orderitem WHERE uid = #{uid} and ISNULL(oid)")
    Integer countSumUserShopCar(Integer uid);

    /**
     * 删除购物车中一项订单
     *
     * @param orderItem
     */
    @Delete(" DELETE FROM orderitem WHERE pid = #{pid} AND uid = #{uid} AND ISNULL(oid) ")
    void deleteUserShopCar(OrderItem orderItem);
}
