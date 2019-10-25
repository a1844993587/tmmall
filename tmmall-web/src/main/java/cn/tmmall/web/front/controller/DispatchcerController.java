package cn.tmmall.web.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 所有页面转发的controller
 */
@Controller
public class DispatchcerController {
    /**
     *
     * @return 转发到主页
     */
    @RequestMapping("/")
    public String toIndex() {
        return "index";
    }

    /**
     *
     * @return 转发到登录页面
     */
    @RequestMapping("/login")
    public String loginjsp(){
        return "login";
    }

    /**
     *
     * @return 转发到注册页面
     */
    @RequestMapping("/regist")
    public String registjsp(){
        return "regist";
    }

    /**
     *
     * @return 转发到产品页面
     */
    @RequestMapping("/foreproduct")
    public String toProductPage(String pid, Model model) {
        model.addAttribute("pid", pid);
        return "product-page";
    }

    /**
     *
     * @return 转发到分类页面
     */
    @RequestMapping("/forecategory")
    public String toCategory(String cid,Model model) {
        model.addAttribute("cid", cid);
        return "category";
    }

    /**
     * @param pid 商品id
     * @param productNumber 购买数量
     * @return 跳转到购物车页面
     */
    @RequestMapping("/toShoppingCart")
    public String toShoppingCart(String pid,String productNumber,Model model) {
        model.addAttribute("pid", pid);
        model.addAttribute("productNumber", productNumber);
        return "shopping-cart";
    }
}
