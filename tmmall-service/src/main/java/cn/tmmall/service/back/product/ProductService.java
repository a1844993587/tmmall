package cn.tmmall.service.back.product;

import cn.tmmall.pojo.PageListRes;
import cn.tmmall.pojo.Product;

public interface ProductService {

    PageListRes getAllproduct(Integer cid, Integer page);

    void addProduct(Product product);

    Product getProductName(Integer id);

    void updateProduct(Product product);

    void deletProduct(Integer id);
}
