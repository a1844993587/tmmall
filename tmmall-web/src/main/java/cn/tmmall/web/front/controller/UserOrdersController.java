package cn.tmmall.web.front.controller;

import cn.tmmall.pojo.Msg;
import cn.tmmall.pojo.OrderItem;
import cn.tmmall.pojo.Orders;
import cn.tmmall.pojo.User;
import cn.tmmall.service.front.order.UserOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 订单controller层
 *
 * @Author: Alex Yj
 * @Date: 2019/5/17 8:48
 */
@RequestMapping("/order")
@Controller
public class UserOrdersController {

    @Autowired
    private UserOrdersService userOrdersService;

    private static final String MYORDER = "my-order";
    private static final String PAYMENT = "payment-page";
    private static final String PAYSUCCESS = "payment-successful";
    private static final String COMFIRMRECEIPT = "comfirm-receipt";
    private static final String SUCCESSFULRECEIPT = "successful-receipt";
    private static final String COMMENT = "comment";

    /**
     * 提交订单
     * 到付款界面
     *
     * @param orders
     */
    @RequestMapping(value = "/submitOrdetItem", method = RequestMethod.POST)
    public String submitOrdetItem(Orders orders, HttpServletRequest request) {
        /**
         * 从session中获取要购买的商品 和用户信息
         */
        List<OrderItem> orderItems = (List<OrderItem>) request.getSession().getAttribute("orderItems");
        User user = (User) request.getSession().getAttribute("u");
        orders.setUid(user.getId());
        orders.setOrderItems(orderItems);
        /**
         * 将商品添加至一个订单中 返回出订单的Id
         */
        Orders ordetItem = userOrdersService.submitOrdetItem(orders);
        /**
         * 将返回的订单价格和订单id放入request域中
         */
        Orders item = userOrdersService.findByOrderItem(ordetItem.getId());
        /**
         * 将 id 和 总价格放入request域中
         */
        request.setAttribute("id", item.getId());
        /**
         * 转发到payment-page去
         */
        return PAYMENT;
    }

    /**
     * 跳转到评论页面
     *
     * @param id
     * @return
     */
    @RequestMapping("/reviewOrder/{id}")
    public String reviewOrder(@PathVariable("id") Integer id, HttpServletRequest request) {
        /**
         * 查询该订单的信息 未开发
         */
        Orders orders = userOrdersService.findByOrderItem(id);
        /**
         * 将查询出来信息放入request域中
         */
        request.setAttribute("orders", orders);
        return COMMENT;
    }

    /**
     * 删除对应订单
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteOrder/{id}", method = RequestMethod.GET)
    public Msg deleteOrder(@PathVariable("id") Integer id) {
        /**
         * 删除订单
         */
        userOrdersService.deleteOrder(id);
        /**
         * 返回成功信息
         */
        return Msg.success();
    }

    /**
     * 确认收货并跳转到交易成功页面
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/confirmGoods/{id}", method = RequestMethod.GET)
    public String confirmGoods(@PathVariable("id") Integer id) {
        userOrdersService.confirmGoods(id);
        return SUCCESSFULRECEIPT;
    }

    /**
     * 发货
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/eliverGoods/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg eliverGoods(@PathVariable("id") Integer id) {
        userOrdersService.eliverGoods(id);
        return Msg.success();
    }

    /**
     * 跳转确认收货界面
     *
     * @param id
     * @param request
     * @return
     */
    @RequestMapping(value = "/confirmDeal/{id}", method = RequestMethod.GET)
    public String confirmDeal(@PathVariable("id") Integer id, HttpServletRequest request) {
        /**
         * 根据订单id查询出商品和订单信息
         */
        Orders orderItem = userOrdersService.findByOrderItem(id);
        /**
         * 将查询出来的信息放入request域中
         */
        request.setAttribute("orderItem", orderItem);
        /**
         * 跳转到确认收货页面
         */
        return COMFIRMRECEIPT;
    }

    /**
     * 付款并跳转到付款成功页面
     *
     * @return
     */
    @RequestMapping(value = "/submitPayMent/{id}", method = RequestMethod.GET)
    public String submitPayMent(@PathVariable("id") Integer id, HttpServletRequest request) {
        /**
         * 根据商品订单Id查询订单并更新付款状态
         */
        userOrdersService.updateOrderItemsStatus(id);
        /**
         * 查询出该订单的信息存放至request域中
         */
        Orders orderItem = userOrdersService.findByOrderItem(id);
        request.setAttribute("orderItem", orderItem);
        /**
         * 跳转到付款成功界面
         */
        return PAYSUCCESS;
    }

    /**
     * 跳转到我的订单页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/findAllUserOrderItem")
    public String findAllUserOrderItem(HttpServletRequest request) {
        /**
         * 跳转到my-order页面
         */
        return MYORDER;
    }

    /**
     * 跳转付款页面
     *
     * @param id
     * @param request
     * @return
     */
    @RequestMapping(value = "/toPayMent/{id}/{totalPrice}", method = RequestMethod.GET)
    public String toPayMent(@PathVariable("id") Integer id, @PathVariable("totalPrice") Float totalPrice, HttpServletRequest request) {
        /**
         * 将 id 和 总价格放入request域中
         */
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("id", id);
        /**
         * 转发到payment-page去
         */
        return PAYMENT;
    }

    /**
     * 查询该用户不同状态订单
     *
     * @param status
     * @param request
     * @return
     */
    @RequestMapping(value = "/findCurrentOrderItem/{status}", method = RequestMethod.GET)
    @ResponseBody
    public Msg findCurrentOrderItem(@PathVariable("status") String status, HttpServletRequest request) {
        /**
         * 处理前端传过来的参数
         */
        String orderStatus;
        switch (status) {
            case "waitPay":
                orderStatus = "1";
                break;
            case "waitDelivery":
                orderStatus = "2";
                break;
            case "waitConfirm":
                orderStatus = "3";
                break;
            case "waitReview":
                orderStatus = "4";
                break;
            default:
                orderStatus = null;
        }
        /**
         * 从session取出用户信息
         */
        User user = (User) request.getSession().getAttribute("u");
        Integer id = user.getId();
        /**
         * 返回查询结果
         */
        List<Orders> orderItems = userOrdersService.findAllUserOrderItem(id, orderStatus);
        return Msg.success().add("orderItem", orderItems);
    }

}
