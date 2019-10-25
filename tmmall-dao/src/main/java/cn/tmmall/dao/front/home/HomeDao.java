package cn.tmmall.dao.front.home;

import cn.tmmall.pojo.Category;
import cn.tmmall.pojo.Product;
import cn.tmmall.pojo.ProductImage;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author XYQ
 */
public interface HomeDao {

    /**
     * 查询所有分类
     * @return 所有的分类
     */
    @Select("SELECT * FROM category")
    List<Category> queryAllCategories();

    /**
     * 查询指定分类下的所有产品
     * @param category 分类
     * @return 查询出来的产品
     */
    List<Product> queryProductsByCategory(Category category);

    /**
     * 查询指定product下的单个产品图片集合
     * @param product 产品
     * @return 查询出来的产品图片
     */
    List<ProductImage> queryProductSingleImagesByProduct(Product product);

    /**
     * 通过id查询产品
     * @param pid 商品id
     * @return 查询到的商品
     */
    Product queryProductById(String pid);
}
