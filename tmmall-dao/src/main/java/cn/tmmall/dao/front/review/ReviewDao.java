package cn.tmmall.dao.front.review;

import cn.tmmall.pojo.Review;

import java.util.List;

/**
 * 用户评价dao
 */
public interface ReviewDao {
    /**
     * 用户评价
     * @param review
     */
    void reviewInsert(Review review);

    /**
     * 用户评价查询
     * @param review
     * @return List<Review>
     */
    List<Review> reviewSelect(Review review);

    /**
     * 用户评价数量
     * @param pid
     * @return
     */
    Integer reviewCount(Integer pid);
}
