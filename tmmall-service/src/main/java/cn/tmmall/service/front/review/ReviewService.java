package cn.tmmall.service.front.review;

import cn.tmmall.pojo.Orders;
import cn.tmmall.pojo.Review;

import java.util.List;

/**
 * 用户评价service
 */
public interface ReviewService {

    /**
     * 用户评价添加方法
     * @param review
     * @param orders
     */
    void reviewInsert(Review review, Orders orders);

    /**
     * 用户评价查询方法
     * @param review
     * @return List<Review>
     */
    List<Review> reviewSelect(Review review);

    /**
     * 用户评价数量
     * @param pid
     * @return Integer
     */
    Integer reviewCount(Integer pid);
}
