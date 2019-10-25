package cn.tmmall.service.front.user.Impl;


import cn.tmmall.dao.front.user.UserDao;
import cn.tmmall.pojo.User;
import cn.tmmall.service.front.user.UserService;
import cn.tmmall.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 用户service实现类
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    /**
     * 登录实现方法
     * @param user
     * @return 返回一个数字,数字有相对应的提示信息(1表示用户名不存在,-1表示密码错误,0表示成功)
     */
    public Integer login(User user) {
        //根据传入的name与数据库中的匹配
        String name = userDao.queryName(user);
        //如果不存在则向页面抛出异常
        if (name == null) {
            return 1;
        }
        //name验证通过后匹配对应密码
        String passwordMD5 = MD5Util.MD5(user.getPassword());
        String password = userDao.queryPassword(user);
        if (password.equals(passwordMD5)) {
            return 0;
        }else {
            return -1;
        }
    }

    /**
     * 注册实现方法
     * @param user
     * @return 返回一个数字,数字有相对应的提示信息(1表示账号已存在,0表示成功)
     */
    @Override
    public Integer regist(User user){
        //验证账号
        String name = userDao.queryName(user);
        if (name != null) {
            return 1;
        }
        user.setPassword(MD5Util.MD5(user.getPassword()));
        //将所有数据插入数据库
        userDao.insertUserData(user);
        return 0;
    }

    /**
     * 查询用户接口
     * @param user
     * @return 返回一个用户对象
     */
    @Override
    public User queryUser(User user) {
        return userDao.queryUser(user);
    }
}
