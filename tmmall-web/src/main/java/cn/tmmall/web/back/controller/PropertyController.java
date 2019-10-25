package cn.tmmall.web.back.controller;

import cn.tmmall.pojo.PageListRes;
import cn.tmmall.pojo.ProductValue;
import cn.tmmall.pojo.Property;
import cn.tmmall.service.back.property.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PropertyController {
    @Autowired
    private PropertyService propertyservice;
    @RequestMapping("/propertylist")
    public String propertylist(Integer page, Integer cid, Model model){
        PageListRes pagelistRes = propertyservice.getAllProperty(cid,page);
        model.addAttribute("rest",pagelistRes);
        model.addAttribute("cid",cid);
        return "back-property";
    }
     /*获得所有属性不带分页*/
     @RequestMapping("/getallpropertynopage")
     public String getallproperty(Integer pid, Integer cid, Model model){
         List<Property> list = propertyservice.getAllPropertyNoPage(pid,cid);
         model.addAttribute("list",list);
         model.addAttribute("pid",pid);
         return "back-propertyvalue";
     }
     /*修改所查属性updateproperyvalue*/
     @ResponseBody
     @RequestMapping("/updateproperyvalue")
     public void updateproperyvalue(@RequestParam(value = "data") List data,Integer pid){
         try {
             propertyservice.updateProperyValue(data,pid);
         }catch (Exception e){
             e.printStackTrace();
         }
     }
     /*第一次属性插入的新增insertproductvalue*/
     @ResponseBody
     @RequestMapping("/insertproductvalue")
     public void insertproductvalue(ProductValue value){
        propertyservice.insertProductValue(value);
     }
    @ResponseBody
    @RequestMapping("/addproperty")
    public String addproperty(Integer cid,String name){
        propertyservice.addProperty(cid,name);
        return null;
    }

    @ResponseBody
    @RequestMapping("/getpropertyname")
    public Property getpropertyname(Integer id){
        return propertyservice.getPropertybyid(id);
    }

    @ResponseBody
    @RequestMapping("/updateproperty")
    public void updateproperty(Integer id,String name){
        propertyservice.updateProperty(id,name);
    }

    @ResponseBody
    @RequestMapping("/deletproperty")
    public void deletproperty(Integer id){
        propertyservice.deletProperty(id);
    }
    /*getcategorypropertt没用的*/

    @RequestMapping("/getcategoryproperty")
    public String getcategorypropertt(Integer cid , Integer pid, Model mode){
        List<Property> list = propertyservice.getcategoryproperty(cid);
        mode.addAttribute("list",list);
        mode.addAttribute("pid",pid);
        return "back-propertyvalue";
    }
}
