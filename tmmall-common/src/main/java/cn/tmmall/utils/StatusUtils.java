package cn.tmmall.utils;

/**
 * 订单状态
 * @author BenCoper.Yu
 */
public interface StatusUtils {
    /**
     * 待付款
     */
    String WAIT_PAY = "1";
    /**
     * 待发货
     */
    String WAIT_DELIVERY = "2";
    /**
     * 待收货
     */
    String WAIT_CONFIRM = "3";
    /**
     *待评价
     */
    String WAIT_REVIEW = "4";
    /**
     *完成
     */
    String FINISH = "5";
    /**
     * 删除
     */
    String DELETE = "0";

}