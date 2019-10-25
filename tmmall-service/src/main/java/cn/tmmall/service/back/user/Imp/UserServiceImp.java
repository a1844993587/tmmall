package cn.tmmall.service.back.user.Imp;

import cn.tmmall.dao.back.user.BUserDao;
import cn.tmmall.pojo.User;
import cn.tmmall.pojo.UserExample;
import cn.tmmall.service.back.user.UserService;
import cn.tmmall.pojo.UserExample.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    BUserDao bUserDao;

    @Override
    /**
     * 查询所有用户
     * @return
     */
    public List<User> getAll(){
        return bUserDao.selectByExample(null);
    }

    /**
     * 用户保存的方法
     * @param user
     */
    @Override
    public void saveUser(User user) {
        bUserDao.insertSelective(user);
    }

    /**
     * 校验用户是否可用
     * @param name
     * @return true 可用  false 不可用
     */
    @Override
    public boolean checkuser(String name) {
        // TODO Auto-generated method stub

        UserExample userExample = new UserExample();
        Criteria criteria = userExample.createCriteria();
        criteria.andNameEqualTo(name);
        long count = bUserDao.countByExample(userExample);
        System.out.println("查询条数:" + count);
        return count == 0;
    }

    /**
     * 根据用户id查信息
     * @param id
     * @return user
     */
    @Override
    public User getUser(Integer id) {
        User user = bUserDao.selectByPrimaryKey(id);
        return user;
    }

    /**
     * 用户更新的方法
     * @param user
     */
    @Override
    public void upDateUser(User user) {
        bUserDao.updateByPrimaryKeySelective(user);
    }

    /**
     * 用户删除的方法
     * @param id
     */
    @Override
    public void deleteUser(Integer id) {
        bUserDao.deleteByPrimaryKey(id);
    }

    /**
     * 用户批量删除
     * @param ids
     */
    @Override
    public void deleteUserAll(List<Integer> ids) {
        UserExample userExample = new UserExample();
        Criteria criteria = userExample.createCriteria();
        criteria.andIdIn(ids);
        bUserDao.deleteByExample(userExample);
    }


}
