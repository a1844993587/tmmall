package cn.tmmall.web.back.controller;

import cn.tmmall.pojo.Category;
import cn.tmmall.pojo.MsgPage;
import cn.tmmall.pojo.PageListRes;
import cn.tmmall.service.back.category.CategoryService;
import cn.tmmall.utils.ImgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * @author zs
 */
@Controller
public class CategoryController {
    /**
     *注入service层
     */
    @Autowired
    private CategoryService categoryservice;

    /**
     * 分页显示分类全部数据
     */
    @RequestMapping("/categorylist")
    public String categorylsit(Integer page, Model model){
        if (page==null) {
            page=1;
        }
        PageListRes pageListRes = categoryservice.GetAllList(page);
        System.out.println(pageListRes+"---------");
        model.addAttribute("rest",pageListRes);
        return "back-category";
    }

    /**
     * 添加分类
     */
    @RequestMapping("/addcategory")
    public String addcategory(Category category, MultipartFile file, HttpServletRequest req){
        /*springmvc的图片上传*/
        try {
            if (ImgUtil.TypeofImg(file) && !"".equals(category.getName())) {
                /*这个Id为分类插入返回的主键*/
                //这个是service层方法的调用
                Integer Id = categoryservice.AddCategory(category);
                /*获取绝对路径*/
                String path = req.getSession().getServletContext().getRealPath("img/category/");
                /*获取文件名*/
                String originalFileName = file.getOriginalFilename();
                /*获得图片后缀*/
                String lastName =".jpg";
                //originalFileName.substring(originalFileName.lastIndexOf("."))
                /*新的图片名称*/
                String newFileName = Id + lastName;
                /*新的图片文件*/
                File newFile = new File(path+ "\\" + newFileName);
                /*写入*/
                file.transferTo(newFile);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/categorylist";
    }
    /**
     * 删除分类
     */
    @ResponseBody
    @RequestMapping("/deletcategory")
    public MsgPage deletcategory(Integer id,HttpServletRequest req){
        MsgPage msgpage = new MsgPage();
        try {
            categoryservice.DeletCategory(id,req);
            msgpage.setMsg("删除成功");
        }catch (Exception e){
            msgpage.setMsg("操作失败");
            e.printStackTrace();
        }
        return msgpage;
    }

    /**
     * 分类的Ajax异步获取修改的数据
     */
    @ResponseBody
    @RequestMapping("/getcategorybyid")
    public Category getcategorybyid(Integer id){
        MsgPage msgpage = new MsgPage();
        Category category = categoryservice.GetCategoryByid(id);
        return category;
    }
    /**
     * 编辑分类
     */
    @RequestMapping("/updatecategory")
    public String updatecategory(Integer id,String name,Integer page, MultipartFile file, HttpServletRequest req) {
        if (page == null)
            page=1;
        try {
            categoryservice.updatecategory(id, name,file,req);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/categorylist?page="+page;
    }
    /**
     * 批量删除
     */
    /*deletcategorybyids*/
    @ResponseBody
    @RequestMapping("/deletcategorybyids")
    public void deletcategorybyids(String checkid){
        categoryservice.deletCategoryByids(checkid);
    }

    @RequestMapping("/back-img")
    public String backimg(){
        return "/back-img";
    }

    @RequestMapping("/back-order")
    public String backorder(){
        return "/back-order";
    }

    @RequestMapping("/back-product")
    public String backproduct(){
        return "/back-product";
    }

    @RequestMapping("/back-property")
    public String backproperty(){
        return "/back-property";
    }

    @RequestMapping("/back-user")
    public String backuser(){
        return "/back-user";
    }

    @RequestMapping("test")
    public String test() {
        return "back-head";
    }

}
