package cn.tmmall.service.back.property;

import cn.tmmall.pojo.PageListRes;
import cn.tmmall.pojo.ProductValue;
import cn.tmmall.pojo.Property;

import java.util.List;

public interface PropertyService {

    PageListRes getAllProperty(Integer page,Integer cid);

    void addProperty(Integer cid,String name);

    Property getPropertybyid(Integer id);

    void updateProperty(Integer id, String name);

    void deletProperty(Integer id);

    List<Property> getAllPropertyNoPage(Integer pid , Integer cid);

    void updateProperyValue(List data, Integer pid);

    List<Property> getcategoryproperty(Integer cid);

    void insertProductValue(ProductValue value);
}
