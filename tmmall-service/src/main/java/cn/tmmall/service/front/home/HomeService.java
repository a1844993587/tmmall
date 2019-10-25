package cn.tmmall.service.front.home;

import cn.tmmall.pojo.Category;
import cn.tmmall.pojo.Product;

import java.util.List;

/**
 * @author XYQ
 */
public interface HomeService {
    
    /**
     * 通过id查询产品
     * @param pid 商品id
     * @return 查询到的商品
     */
    Product getProduct(String pid);

    /**
     * 查询指定分类下的所有产品
     * @param cid 分类id
     * @return 指定分类下的所有产品
     */
    List<Product> getProductsByCategory(Integer cid);

    /**
     * 得到所有的分类
     * @return 所有的分类
     */
    List<Category> getCategories();

    /**
     * 给指定的product装载图片
     * @param product 要装载的product
     */
    void loadProductSingleImages(Product product);

    /**
     * 给category装载product集合
     * @param category 需要装载的category
     */
    void loadProducts(Category category);
}
