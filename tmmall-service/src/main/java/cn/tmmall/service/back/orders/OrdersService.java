package cn.tmmall.service.back.orders;

import cn.tmmall.pojo.PageListRes;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;


/**
 * @author BenCoper.Yu
 * Data: 2019-5-17  8:43
 * crud,订单状态信息
 */
@Service
public interface OrdersService {

    /**
     * 根据id删除订单
     */

    void deleteOrders(Integer id, HttpServletRequest req);


    /**
     * 获取所有订单
     */

    PageListRes FindAllList(Integer page);

    /**
     * 批量删除订单
     */

    void deleteOrdersByids(String checkid);
}
