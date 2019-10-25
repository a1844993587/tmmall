package cn.tmmall.web.front.controller;


import cn.tmmall.pojo.User;
import cn.tmmall.service.front.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 用户登录注册
 */
@Controller
@RequestMapping(value = "/denglu")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 登录
     * @param user
     * @return 提示信息,并返回相应要转发的页面的url
     */
    @RequestMapping(value = "/loginWeb")
    public String login(User user, HttpSession session, Model model, HttpServletRequest request){
        //调用service处理登录逻辑
        Integer msg = userService.login(user);
        if (msg==1){
            model.addAttribute("msg","账号不存在");
//          model.addAttribute("forward","login");
            return "login";
        }
        if (msg==-1){
            model.addAttribute("msg","密码不正确");
//          model.addAttribute("forward","login");
            return "login";
        }
//        model.addAttribute("forward","index");
        //删除某个提示信息
        if (!"".equals(request.getSession().getAttribute("err"))){
            request.getSession().removeAttribute("err");
        }
        //查询相应用户
        User userdata = userService.queryUser(user);
        //将查询到的user保存到session
        session.setAttribute("u",userdata);
        return "redirect:/";
    }

    /**
     * 注册
     * @param user
     * @param model
     * @return 提示信息,并返回相应要转发的页面的url
     */
    @RequestMapping(value = "/registWeb")
    public String regist(User user, Model model){
        //调用service处理注册逻辑
        Integer msg = userService.regist(user);
        if (msg==1){
            model.addAttribute("msg","账号已存在");
//          model.addAttribute("forward","regist");
            return "regist";
        }
        //注册成功返回登录页面
//        model.addAttribute("error","注册成功");
//        model.addAttribute("forward","login");
        return "redirect:/login";
    }

    /**
     * 退出
     * @param session
     */
    @RequestMapping(value = "/exit")
    public String exit(HttpServletRequest request, HttpSession session){
        //获取session进行注销
        request.getSession().removeAttribute("u");
        return "redirect:/";
    }
}
