package cn.tmmall.test.userorder;

import cn.tmmall.dao.back.order.OrdersDao;
import cn.tmmall.dao.front.car.UserShopCarDao;
import cn.tmmall.dao.front.order.UserOrdersDao;
import cn.tmmall.pojo.OrderItem;
import cn.tmmall.pojo.Orders;
import cn.tmmall.pojo.ProductImage;
import cn.tmmall.service.front.car.UserShopCarService;
import cn.tmmall.service.front.order.UserOrdersService;
import cn.tmmall.utils.StatusUtils;
import cn.tmmall.web.front.controller.UserOrdersController;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

/**
 * 订单测试
 *
 * @Author: Alex Yj
 * @Date: 2019/5/16 9:58
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-*.xml")
public class OrderItemTest {

    @Autowired
    UserOrdersDao userOrdersDao;

    @Autowired
    UserOrdersService userOrdersService;

    @Autowired
    UserShopCarDao userShopCarDao;

    @Autowired
    UserShopCarService userShopCarService;


    @Autowired
    OrdersDao ordersDao;
    @Test
    public void test01() {
        List<Orders> allOrders = ordersDao.getAllOrders();
        for (Orders allOrder : allOrders) {

            System.out.println(allOrder.toString()  );
        }
    }

}
