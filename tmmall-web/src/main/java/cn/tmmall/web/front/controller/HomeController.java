package cn.tmmall.web.front.controller;

import cn.tmmall.pojo.Category;
import cn.tmmall.pojo.Product;
import cn.tmmall.service.front.home.HomeService;
import cn.tmmall.utils.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 主页加载数据Controller
 *
 * @author XYQ
 */
@RestController
public class HomeController {
    private final HomeService homeService;

    /**
     * 采用构造器的方式注入bean
     */
    @Autowired
    public HomeController(HomeService homeService) {
        this.homeService = homeService;
    }

    /**
     * 获取分类列表
     *
     * @return 返回查询出来的分类列表
     */
    @RequestMapping("/getParentCategoryList")
    public CommonResult getCatList() {
        List<Category> cats = homeService.getCategories();
        return CommonResult.ok(cats);
    }

    /**
     * 查询指定分类下的所有商品
     * @param cid 分类id
     * @return 指定分类下的所有商品
     */
    @RequestMapping("/getProducts")
    public CommonResult getProductsByCategory(Integer cid) {
        if (cid != null) {
            return CommonResult.ok(homeService.getProductsByCategory(cid));
        }
        return CommonResult.error();
    }

    /**
     * 根据商品id查询商品
     *
     * @param pid 需要查询的商品id
     * @return 查询出来的商品
     */
    @RequestMapping("/getProduct")
    public CommonResult getProduct(String pid) {
        return CommonResult.ok(homeService.getProduct(pid));
    }
}
