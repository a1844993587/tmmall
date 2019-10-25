package cn.tmmall.service.back.product.imp;

import cn.tmmall.dao.back.category.ProductDao;
import cn.tmmall.pojo.PageListRes;
import cn.tmmall.pojo.Product;
import cn.tmmall.service.back.product.ProductService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImp implements ProductService {
    @Autowired
    private ProductDao productdao;
    @Override
    public PageListRes getAllproduct(Integer cid, Integer pageNum) {
        if (pageNum==null)
            pageNum=1;
        Page<Object> page = PageHelper.startPage(pageNum, 5);
        List<Product> list = productdao.getAllProduct(cid);
        PageListRes listRes = new PageListRes();
        listRes.setRows(page.getResult());
        listRes.setTotal(page.getTotal());
        listRes.setTotalPage(page.getPages());
        listRes.setPageNo(page.getPageNum());
        return listRes;
    }

    @Override
    public void addProduct(Product product) {
        productdao.addProduct(product);
    }

    @Override
    public Product getProductName(Integer id) {
        Product product = productdao.getProductName(id);
        return product;
    }

    @Override
    public void updateProduct(Product product) {
        /*转下类型（获得的id为object）*/
        int id = product.getId();
        product.setId(id);
        productdao.updateProduct(product);
    }

    @Override
    public void deletProduct(Integer id) {
        productdao.deletProduct(id);
    }
}
