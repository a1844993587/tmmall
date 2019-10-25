package cn.tmmall.dao.front.user;

import cn.tmmall.pojo.User;

/**
 * 用户dao
 */
public interface UserDao {
    /**
     * 用前端获取到的account来匹配数据库中是否存在该账号
     * @param user
     * @return String(用户名)
     */
    String queryName(User user);

    /**
     * 用获取到的password来匹配
     * @param user
     * @return String(密码)
     */
    String queryPassword(User user);

    /**
     * 用已通过验证的账号来匹配对应用户名
     * @param user
     * @return User对象
     */
    User queryUser(User user);

    /**
     * 将数据插入数据库
     * @param user
     */
    void insertUserData(User user);
}
