package cn.tmmall.web.back.controller;

import cn.tmmall.pojo.MsgPage;
import cn.tmmall.pojo.PageListRes;
import cn.tmmall.service.back.orders.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author BenCoper.Yu
 */
@Controller
public class OrdersController {

    @Autowired(required = true)
    private OrdersService ordersService;

    @RequestMapping("/orderlist")
    public String orderlist(Integer page, Model model) {
        if (page==null) {
            page=1;
        }
        PageListRes pageListRes = ordersService.FindAllList(page);
        System.out.println(pageListRes + "---------");

        model.addAttribute("rest",pageListRes);
        return "back-order";

    }

    /**
     * deleteOrders
     */
    @ResponseBody
    @RequestMapping("/deleteOrders")
   
    public MsgPage deleteOrders(Integer id, HttpServletRequest req){
        MsgPage msgPage = new MsgPage();
        try {
            ordersService.deleteOrders(id,req);
            msgPage.setMsg("删除成功");
        }catch (Exception e){
            msgPage.setMsg("操作失败");
            e.printStackTrace();
        }
        return msgPage;
    }

    @ResponseBody
    @RequestMapping("deleteOrdersByids")

    public void deleteOrdersByids(String checkid){
        ordersService.deleteOrdersByids(checkid);
    }
    

}