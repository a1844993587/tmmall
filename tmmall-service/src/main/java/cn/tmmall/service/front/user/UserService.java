package cn.tmmall.service.front.user;

import cn.tmmall.pojo.User;

/**
 * 用户service接口
 */
public interface UserService {
    /**
     * 登录接口
     * @param user
     * @return 返回一个数字，根据数字发送相应提示信息
     */
    Integer login(User user);

    /**
     * 注册接口
     * @param user
     * @return 返回一个数字，根据数字发送相应提示信息
     */
    Integer regist(User user);

    /**
     * 查询用户接口
     * @param user
     * @return 返回一个用户对象
     */
    User queryUser(User user);
}
