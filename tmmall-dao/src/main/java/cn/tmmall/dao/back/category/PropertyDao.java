package cn.tmmall.dao.back.category;

import cn.tmmall.pojo.ProductValue;
import cn.tmmall.pojo.Property;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PropertyDao {

    List<Property> getAllProperty(Integer cid);

    void addProperty(@Param("cid") Integer cid, @Param("name") String name);

    Property getPropertybyid(Integer id);

    void updateProperty(@Param("id") Integer id, @Param("name") String name);

    void deletProperty(Integer id);

    List<Property> getAllPropertyNoPage(@Param("pid") Integer pid,@Param("cid") Integer cid);

    void updateProperyValue(@Param("map") Map<String,Object> map,@Param("pid") Integer pid);

    List<Property> getPropertyBycid(Integer cid);

    void insertproductvalue(@Param("value") ProductValue value);
}
