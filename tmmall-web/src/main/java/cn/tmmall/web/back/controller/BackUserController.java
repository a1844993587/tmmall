package cn.tmmall.web.back.controller;


import cn.tmmall.pojo.Msg;
import cn.tmmall.pojo.User;
import cn.tmmall.service.back.user.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BackUserController {
    @Autowired
    UserService userService;

    /**
     * 分页显示用户
     * @param pn
     * @return
     */
    @RequestMapping("/BackUser")
    @ResponseBody
    public Msg getUserWhitJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){

        //引入分页插件
        PageHelper.startPage(pn,10);
        //拿到用户的信息
        List<User> backuser = userService.getAll();
        //用 PageInfo 包装查询后的结果   封装了详细的分页信息   传入显示分页的页码
        PageInfo page = new PageInfo(backuser,5);

        return Msg.success().add("pageInfo",page);
    }


    /**
     * 保存用户的方法
     * @param user
     * @return
     */
    @RequestMapping(value = "/BackUser",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveUser(User user){
        userService.saveUser(user);
        return Msg.success();
    }

    /**
     * 检验用户是否可用的方法
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/checkuser/{name}", method = RequestMethod.GET)
    public Msg checkuser(@PathVariable("name")String user){
        System.out.println("用户名:" + user);
        //先判断用户名是否是合法的表达式;
        String reg = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if(!user.matches(reg)){
            return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
        }

        //数据库用户名重复校验
        boolean b = userService.checkuser(user);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg", "用户名不可用");
        }

    }

    /**
     * 按照id查询用户
     * @param id
     * @return
     */
    @RequestMapping(value = "/BackUser/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getUser(@PathVariable("id") Integer id){
        User user = userService.getUser(id);
        return Msg.success().add("userDate",user);
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */

    @ResponseBody
    @RequestMapping(value = "/updateUser/{id}",method = RequestMethod.PUT)
    public Msg upDateUser(User user){
        userService.upDateUser(user);
        return Msg.success();
    }

    /**
     * 删除用户
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/BackUser/{ids}",method = RequestMethod.DELETE)
    public Msg deleteUser(@PathVariable("ids") String ids){
        //批量删除
        if (ids.contains("-")){
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            //组装id
            for (String id :str_ids){
                del_ids.add(Integer.parseInt(id));
            }
            userService.deleteUserAll(del_ids);
        }else {
            //单个删除
            Integer id = Integer.parseInt(ids);
            userService.deleteUser(id);
        }

        return Msg.success();
    }
}
