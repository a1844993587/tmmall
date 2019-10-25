package cn.tmmall.service.back.user;

import cn.tmmall.pojo.User;

import java.util.List;

public interface UserService {
    /**
     * 查询所有用户的方法
     */
    public abstract List<User> getAll();

    /**
     * 保存用户的方法
     */
    public abstract void saveUser(User user);

    /**
     * 检验用户是否可用的方法
     */
    public abstract boolean checkuser(String name);

    /**
     * id查询用户的方法
     */
    public abstract User getUser(Integer id);

    /**
     * 用户更新的方法
     */
    public abstract void upDateUser(User user);

    /**
     * 用户删除的方法
     */
    public abstract void deleteUser(Integer id);

    /**
     * 用户批量删除
     */

    public abstract void deleteUserAll(List<Integer> ids);
}
