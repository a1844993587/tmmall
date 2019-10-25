package cn.tmmall.service.back.category.imp;

import cn.tmmall.dao.back.category.CategoryDao;
import cn.tmmall.pojo.Category;
import cn.tmmall.pojo.PageListRes;
import cn.tmmall.service.back.category.CategoryService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryServieImp implements CategoryService {
    @Autowired
    private CategoryDao categorydao;

    public PageListRes GetAllList(Integer pageNum) {
        Page<Object> page = PageHelper.startPage(pageNum, 5);
        List<Category> allCategory = categorydao.getAllCategory();
        PageListRes listRes = new PageListRes();
        listRes.setRows(page.getResult());
        listRes.setTotal(page.getTotal());
        listRes.setTotalPage(page.getPages());
        listRes.setPageNo(page.getPageNum());
        return listRes;
    }

    public Integer AddCategory(Category category) {
        categorydao.addCategory(category);
        return category.getId();
    }

    public void DeletCategory(Integer id,HttpServletRequest req) {
        categorydao.deletCategory(id);
        /*获取绝对路径*/
        String path = req.getSession().getServletContext().getRealPath("img/category/");
        /*获取文件名*/
        String lastName =".jpg";
        /*新的图片名称*/
        String newFileName = id + lastName;
        /*新的图片文件*/
        File newFile = new File(path+ "\\" + newFileName);
        newFile.delete();
    }


    public Category GetCategoryByid(Integer id) {
        Category category = categorydao.getcategorybyid(id);
        return category;
    }


    public void updatecategory(Integer id, String name, MultipartFile file, HttpServletRequest req){
        if (!file.isEmpty()){
            /*获取绝对路径*/
            String path = req.getSession().getServletContext().getRealPath("img/category/");
            /*获取文件名*/
            String lastName =".jpg";
            /*新的图片名称*/
            String newFileName = id + lastName;
            /*新的图片文件*/
            File newFile = new File(path+ "\\" + newFileName);
            try {
                file.transferTo(newFile);
            } catch (IOException e) {
                e.fillInStackTrace();
            }
        }
        categorydao.updatecategory(id,name);
    }

    @Override
    public void deletCategoryByids(String checkid) {
        /*String转list<integer>集合*/
        ArrayList<Integer> list = new ArrayList<Integer>();
        String substring = checkid.substring(0, checkid.length() - 1);
        String[] split = substring.split("-");
        for (String str : split){
            Integer integer = Integer.valueOf(str);
            list.add(integer);
        }
        categorydao.deletCategoryByids(list);
    }
}
