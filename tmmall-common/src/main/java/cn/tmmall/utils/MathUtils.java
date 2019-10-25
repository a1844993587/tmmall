package cn.tmmall.utils;

/**
 * 计算价格工具类
 *
 * @Author: Alex Yj
 * @Date: 2019/5/18 18:34
 */
public class MathUtils {

    /**
     * 计算总金额
     *
     * @param price
     * @param number
     * @return
     */
    static public Float getTotalPrice(Float price, Integer number) {
        Float totalPrice = price * number;
        return totalPrice;
    }

}
