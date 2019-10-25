package cn.tmmall.dao.back.category;

import cn.tmmall.pojo.Category;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface CategoryDao {
    public List<Category> getAllCategory();

    Integer addCategory(Category category);

    void deletCategory(Integer id);

    Category getcategorybyid(Integer id);

    void updatecategory(@Param("id")Integer id,@Param("name")String name);

    void deletCategoryByids(@Param("listid") ArrayList<Integer> list);

}
