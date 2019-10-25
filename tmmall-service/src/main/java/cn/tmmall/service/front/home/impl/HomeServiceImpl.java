package cn.tmmall.service.front.home.impl;

import cn.tmmall.dao.front.home.HomeDao;
import cn.tmmall.pojo.Category;
import cn.tmmall.pojo.Product;
import cn.tmmall.pojo.ProductImage;
import cn.tmmall.service.front.home.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author XYQ
 */
@Service
public class HomeServiceImpl implements HomeService {
    private final HomeDao homeDao;

    @Autowired
    public HomeServiceImpl(HomeDao homeDao) {
        this.homeDao = homeDao;
    }

    @Override
    public List<Category> getCategories() {
        List<Category> cats = homeDao.queryAllCategories();
        for (Category category : cats) {
            //给分类装载products集合
            loadProducts(category);
        }
        return cats;
    }

    @Override
    public Product getProduct(String pid) {
        Product product = homeDao.queryProductById(pid);
        loadProductSingleImages(product);
        product.setSubTitles(product.getSubTitle().split(" "));
        return product;
    }

    @Override
    public List<Product> getProductsByCategory(Integer cid) {
        Category c = new Category();
        c.setId(cid);
        return homeDao.queryProductsByCategory(c);
    }

    @Override
    public void loadProducts(Category category) {
        List<Product> products = homeDao.queryProductsByCategory(category);
        for (Product product : products) {
            String[] subTitles = product.getSubTitle().split(" ");
            product.setSubTitles(subTitles);
            //给产品装载图片集合
            loadProductSingleImages(product);
        }
        category.setProducts(products);
    }

    @Override
    public void loadProductSingleImages(Product product) {
        List<ProductImage> productSingleImages = homeDao.queryProductSingleImagesByProduct(product);
        product.setFirstProductImage(productSingleImages.get(0));
        product.setProductSingleImages(productSingleImages);
    }

}
