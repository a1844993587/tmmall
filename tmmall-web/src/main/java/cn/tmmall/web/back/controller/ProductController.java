package cn.tmmall.web.back.controller;

import cn.tmmall.pojo.PageListRes;
import cn.tmmall.pojo.Product;
import cn.tmmall.service.back.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProductController {
    @Autowired
    private ProductService productservice;
    @RequestMapping("/productlist")
    public String productlist(Integer page, Integer cid, Model model){
        PageListRes pagelistRes = productservice.getAllproduct(cid,page);
        model.addAttribute("rest",pagelistRes);
        model.addAttribute("cid",cid);
        return "back-product";
    }

    @ResponseBody
    @RequestMapping("/addproduct")
    public void addproduct(Product product){
        System.out.println(product);
        try {
            productservice.addProduct(product);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @ResponseBody
    @RequestMapping("/getproductname")
    public Product getproductname(Integer id){
        Product product = productservice.getProductName(id);
        return product;
    }

    @ResponseBody
    @RequestMapping("/updateproduct")
    public void updateproduct(Product product){
            productservice.updateProduct(product);
    }

    /*deletproduct*/
    @ResponseBody
    @RequestMapping("/deletproduct")
    public void deletproduct(Integer id){
            productservice.deletProduct(id);

    }

}
