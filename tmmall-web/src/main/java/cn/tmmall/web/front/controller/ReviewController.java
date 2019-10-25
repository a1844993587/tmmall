package cn.tmmall.web.front.controller;

import cn.tmmall.pojo.Orders;
import cn.tmmall.pojo.Review;
import cn.tmmall.pojo.User;
import cn.tmmall.service.front.review.ReviewService;
import cn.tmmall.utils.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户评价controller
 */
@Controller
@RequestMapping(value = "/review")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    /**
     * 用户评价添加
     * @param review
     * @return 返回前一个页面
     */
    @RequestMapping(value = "/insert")
    public String reviewInsert(Review review,Integer oid, Orders orders, HttpServletRequest request, HttpSession session){
        //调用service
        User user = (User) request.getSession().getAttribute("u");
        review.setUid(user.getId());
        orders.setId(oid);
        reviewService.reviewInsert(review,orders);

        return "redirect:/order/findAllUserOrderItem";
    }

    /**
     * 用户评价查询
     * @param review
     * @return List<Review>
     */
    @RequestMapping(value = "/select")
    public @ResponseBody
    CommonResult reviewSelect(Review review){
        //调用service获取数据
        List<Review> list = reviewService.reviewSelect(review);
        return CommonResult.ok(list);
    }

    /**
     * 用户评价数量
     * @param pid
     * @return Integer
     */
    @RequestMapping(value = "/count")
    public @ResponseBody
    CommonResult reviewCount(Integer pid){
        //调用service获取数据
        Integer count = reviewService.reviewCount(pid);
        return CommonResult.ok(count);
    }
}
