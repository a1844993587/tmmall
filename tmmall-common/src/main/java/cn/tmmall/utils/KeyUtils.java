package cn.tmmall.utils;

import java.util.UUID;

/**
 * 生成UUID和11位不重复的数字工具类
 *
 * @Author: Alex Yj
 * @Date: 2019/5/15 9:36
 */
public class KeyUtils {

    /**
     * 获得一个不重复id
     *
     * @return
     */
    static public int getRandomNumbers() {
        return (int) System.currentTimeMillis() * -1;
    }

    /**
     * 获取UUID
     *
     * @return
     */
    static public String getUUID() {
        return UUID.randomUUID().toString().toUpperCase().replace("-", "");
    }

}
