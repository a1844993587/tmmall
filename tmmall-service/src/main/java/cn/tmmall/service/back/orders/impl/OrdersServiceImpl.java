package cn.tmmall.service.back.orders.impl;

import cn.tmmall.dao.back.order.OrdersDao;
import cn.tmmall.pojo.OrderItem;
import cn.tmmall.pojo.Orders;
import cn.tmmall.pojo.PageListRes;
import cn.tmmall.service.back.orders.OrdersService;
import cn.tmmall.utils.MathUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @author BenCoper.Yu
 */
@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersDao ordersDao;

        @Override
        public void deleteOrders (Integer id, HttpServletRequest req){
            ordersDao.deleteOrders(id);
        }


    @Override
    public PageListRes FindAllList(Integer pageNum) {
        Page<Object> page = PageHelper.startPage(pageNum, 5);
        List<Orders> allOrders = ordersDao.findAllOrders();
        for (Orders allOrder : allOrders) {
            Integer countNumber = 0;
            Float totalPrice = 0f;
            for (OrderItem orderItem : allOrder.getOrderItems()) {
                // 获取一条订单项的数量
                Integer number = orderItem.getNumber();
                // 获取价格
                Float promotePrice = orderItem.getProduct().getPromotePrice();
                Float price = MathUtils.getTotalPrice(promotePrice, number);
                totalPrice += price;
                countNumber += number;
            }
            allOrder.setCountNumber(countNumber);
            allOrder.setTotalPrice(totalPrice);
        }

        PageListRes listRes = new PageListRes();
        listRes.setRows(page.getResult());
        listRes.setTotal(page.getTotal());
        listRes.setTotalPage(page.getPages());
        listRes.setPageNo(page.getPageNum());
        return listRes;
    }

    @Override
    public void deleteOrdersByids(String checkid) {
        ArrayList<Integer> list = new ArrayList<Integer>();
        String substring = checkid.substring(0, checkid.length() - 1);
        String[] split = substring.split("-");
        for (String str : split){
            Integer integer = Integer.valueOf(str);
            list.add(integer);
        }
        ordersDao.deleteOrdersByids(list);
    }
}
