package cn.tmmall.service.front.review.impl;

import cn.tmmall.dao.front.order.UserOrdersDao;
import cn.tmmall.dao.front.review.ReviewDao;
import cn.tmmall.pojo.Orders;
import cn.tmmall.pojo.Review;
import cn.tmmall.service.front.review.ReviewService;
import cn.tmmall.utils.StatusUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 用户评价
 */
@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewDao reviewDao;
    @Autowired
    private UserOrdersDao userOrdersDao;


    /**
     * 用户评价实现方法
     * @param review
     * @param orders
     */
    @Override
    public void reviewInsert(Review review, Orders orders) {
        //调用dao将数据添加到数据库
        review.setCreateDate(new Date());
        reviewDao.reviewInsert(review);

        System.out.println(orders);
        //修改订单状态
        orders.setStatus(StatusUtils.FINISH);
        userOrdersDao.updateOrderStatus(orders);
    }

    /**
     * 用户评价查询方法
     * @param review
     * @return List<Review>
     */
    @Override
    public List<Review> reviewSelect(Review review) {
        List<Review> list = reviewDao.reviewSelect(review);
        return list;
    }

    /**
     * 用户评价数量
     * @param pid
     * @return Integer
     */
    @Override
    public Integer reviewCount(Integer pid) {
        Integer count = reviewDao.reviewCount(pid);
        return count;
    }
}
