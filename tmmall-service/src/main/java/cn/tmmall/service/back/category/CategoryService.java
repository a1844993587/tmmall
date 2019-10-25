package cn.tmmall.service.back.category;

import cn.tmmall.pojo.Category;
import cn.tmmall.pojo.PageListRes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface CategoryService {
    /*获取Caategory*/
    PageListRes GetAllList(Integer page);
    /*添加Category*/
    Integer AddCategory(Category category);

    void DeletCategory(Integer id,HttpServletRequest req);

    Category GetCategoryByid(Integer id);

    /*修改*/
    void updatecategory(Integer id, String name, MultipartFile file, HttpServletRequest req);

    void deletCategoryByids(String checkid);
}
