package cn.tmmall.web.front.controller;

import cn.tmmall.pojo.Msg;
import cn.tmmall.pojo.OrderItem;
import cn.tmmall.pojo.User;
import cn.tmmall.service.front.car.UserShopCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 购物车Controller
 *
 * @Author: Alex Yu
 * @Date: 2019/5/19 23:31
 */
@Controller
@RequestMapping("/car")
public class UserShopCarController {

    @Autowired
    UserShopCarService userShopCarService;

    private static final String SHOPPINGCART = "shopping-cart";
    private static final String BILLINGPAGE = "billing-page";


    /**
     * 查询购买订单的商品详情
     *
     * @param pids
     * @param request
     * @return
     */
    @RequestMapping("/settlementShopCar")
    public String settlementShopCar(@RequestParam("pid") Integer[] pids, @RequestParam(value = "number", required = false) Integer number, HttpServletRequest request) {
        User u = (User) request.getSession().getAttribute("u");
        List<OrderItem> orderItems = userShopCarService.findProductMsg(pids, u.getId(), number);
        request.getSession().setAttribute("orderItems", orderItems);
        return BILLINGPAGE;
    }

    /**
     * 删除一个订单
     *
     * @param uid
     * @param pid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteUserShopCar/{uid}/{pid}", method = RequestMethod.GET)
    public Msg deleteUserShopCar(@PathVariable("uid") Integer uid, @PathVariable("pid") Integer pid) {
        userShopCarService.deleteUserShopCar(pid, uid);
        return Msg.success();
    }

    /**
     * 修改商品数量
     *
     * @param number
     * @param pid
     * @param uid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/numberOperation/{number}/{pid}/{uid}", method = RequestMethod.GET)
    public Msg numberOperation(@PathVariable("number") Integer number, @PathVariable("pid") Integer pid, @PathVariable("uid") Integer uid) {
        OrderItem orderItem = new OrderItem();
        orderItem.setUid(uid);
        orderItem.setNumber(number);
        orderItem.setPid(pid);
        userShopCarService.numberOperation(orderItem);
        return Msg.success();
    }

    /**
     * 查询购物车中所有商品
     *
     * @param uid
     * @return
     */
    @ResponseBody
    @RequestMapping("/findAllUserShopCar/{uid}")
    public Msg findAllUserShopCar(@PathVariable("uid") Integer uid) {
        return Msg.success().add("car", userShopCarService.findAllUserShopCar(uid));
    }

    /**
     * 跳转购物车页面
     *
     * @return
     */
    @RequestMapping("/myShopCar")
    public String myShopCar() {
        return SHOPPINGCART;
    }

    /**
     * 将商品加入购物车
     *
     * @param pid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/userAddCar/{pid}/{number}", method = RequestMethod.GET)
    public Msg userAddCat(@PathVariable("pid") Integer pid, @PathVariable("number") Integer number, HttpServletRequest request) {
        /**
         * 从session中取出user
         */
        User u = (User) request.getSession().getAttribute("u");
        /**
         * 将
         */
        OrderItem orderItem = new OrderItem();
        orderItem.setUid(u.getId());
        orderItem.setNumber(Math.round(number));
        orderItem.setPid(pid);
        userShopCarService.userAddCat(orderItem);
        return Msg.success();
    }

    /**
     * 计算购物车商品数量
     *
     * @param uid
     * @return
     */
    @ResponseBody
    @RequestMapping("/countSumUserShopCar/{uid}")
    public Integer countSumUserShopCar(@PathVariable("uid") Integer uid) {
        return userShopCarService.countSumUserShopCar(uid);
    }
}
