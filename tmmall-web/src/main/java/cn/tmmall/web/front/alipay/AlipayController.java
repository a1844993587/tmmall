/*
package cn.tmmall.web.front.alipay;

import cn.tmmall.pojo.Orders;
import cn.tmmall.service.front.order.UserOrdersService;
import cn.tmmall.web.front.alipay.config.AlipayConfig;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.DecimalFormat;

*/
/**
 * 跳转支付界面
 *
 * @Author: Alex Yu
 * @Date: 2019/5/20 22:40
 *//*

@Controller
public class AlipayController {

    @Autowired
    UserOrdersService userOrdersService;

    */
/**
     * 去支付宝支付
     *
     * @return
     * @throws Exception
     *//*

    @RequestMapping(value = "/goAlipay/{id}",  produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String goAlipay(@PathVariable("id") Integer id) throws Exception {

        Orders order = userOrdersService.findByOrderItem(id);
        DecimalFormat fnum = new DecimalFormat("##0.00");
        userOrdersService.updateOrderItemsStatus(id);

        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = order.getOrderCode();
        //付款金额，必填
        String total_amount = fnum.format(order.getTotalPrice());
        //订单名称，必填
        String subject = order.getOrderItems().get(0).getProduct().getName();
        //商品描述，可空
        String body = "用户订购商品个数：" + order.getCountNumber();

        // 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。 该参数数值不接受小数点， 如 1.5h，可转换为 90m。
        String timeout_express = "10m";

        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"timeout_express\":\"" + timeout_express + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        return result;
    }

}
*/
