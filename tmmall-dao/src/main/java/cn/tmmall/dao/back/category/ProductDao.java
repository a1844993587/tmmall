package cn.tmmall.dao.back.category;

import cn.tmmall.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductDao {

    List<Product> getAllProduct(Integer cid);

    void addProduct(@Param("p") Product p);

    Product getProductName(Integer id);

    void updateProduct(@Param("p1") Product product);

    void deletProduct(Integer id);
}
