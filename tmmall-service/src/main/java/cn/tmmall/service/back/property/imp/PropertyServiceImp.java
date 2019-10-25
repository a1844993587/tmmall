package cn.tmmall.service.back.property.imp;

import cn.tmmall.dao.back.category.PropertyDao;
import cn.tmmall.pojo.PageListRes;
import cn.tmmall.pojo.ProductValue;
import cn.tmmall.pojo.Property;
import cn.tmmall.service.back.property.PropertyService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PropertyServiceImp implements PropertyService {
    @Autowired
    private PropertyDao propertydao;

    public PageListRes getAllProperty(Integer cid,Integer pageNum) {
        if (pageNum==null)
            pageNum=1;
        Page<Object> page = PageHelper.startPage(pageNum, 5);
        List<Property> list = propertydao.getAllProperty(cid);
        PageListRes listRes = new PageListRes();
        listRes.setRows(page.getResult());
        listRes.setTotal(page.getTotal());
        listRes.setTotalPage(page.getPages());
        listRes.setPageNo(page.getPageNum());
        return listRes;
    }

    @Override
    public void addProperty(Integer cid, String name) {
        propertydao.addProperty(cid,name);
    }

    @Override
    public Property getPropertybyid(Integer id) {
        return propertydao.getPropertybyid(id);
    }

    @Override
    public void updateProperty(Integer id, String name) {
        propertydao.updateProperty(id,name);
    }

    @Override
    public void deletProperty(Integer id) {
        propertydao.deletProperty(id);
    }

    @Override
    public List<Property> getAllPropertyNoPage(Integer pid ,Integer cid) {
        List<Property> list = propertydao.getAllPropertyNoPage(pid,cid);
        return list;
    }
/*修改propertyvalue*/
    @Override
    public void updateProperyValue(List data, Integer pid) {
        /*serlize()的数据转map集合*/
        Map<String, Object> map = new HashMap<String, Object>();
        String s = data.get(0).toString();
        String[] split = s.split("&");
        for(String s1 : split){
            String[] split1 = s1.split("=");
            map.put(split1[0],split1[1]);
        }
        System.out.println(map);
        propertydao.updateProperyValue(map,pid);
    }

    @Override
    public List<Property> getcategoryproperty(Integer cid) {
        List<Property> list = propertydao.getPropertyBycid(cid);
        return list;
    }

    @Override
    public void insertProductValue(ProductValue value) {
        propertydao.insertproductvalue(value);
    }
}
