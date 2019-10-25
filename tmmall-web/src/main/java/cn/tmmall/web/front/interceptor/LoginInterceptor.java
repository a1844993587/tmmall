package cn.tmmall.web.front.interceptor;

import cn.tmmall.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 拦截器:对所有进入(未登录)订单和购物车的请求进行拦截
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
        //获取请求的uri
        String uri = request.getRequestURI();
        System.out.println("-----------------------------------------" + uri);
        System.out.println(uri.indexOf("/orders/**"));
        System.out.println(uri.indexOf("/car/**"));
        System.out.println("/login".equals(uri));
        //获取session 不符合条件的给出提示信息
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("u");
        System.out.println(user);
        if (user == null && "/login".equals(uri)) {
            System.out.println("22222222");
            return true;
        }
        if (user != null && "/login".equals(uri)) {
            System.out.println("333333333333");
            session.setAttribute("err", "小老弟,你已经登录了啊");
            response.sendRedirect("/");
            return false;
        }
        if (user == null && uri.indexOf("/car") == 0) {
            System.out.println("1111111111111111111111");
            // 如果是 ajax 请求，则设置 session 状态 、CONTEXTPATH 的路径值
            // 如果是ajax请求响应头会有，x-requested-with
            if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
                response.setHeader("SESSIONSTATUS", "TIMEOUT");
                response.setHeader("CONTEXTPATH", "/login");
                // FORBIDDEN，forbidden。也就是禁止、403
                session.setAttribute("err", "小老弟,还没登录就想加入购物车!");
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            } else {
                session.setAttribute("err", "小老弟,还没登录就想进入购物车!");
                response.sendRedirect("/login");
                return false;
            }
            return false;
        }
        if (user != null) {
            System.out.println("55555555555555555");
            return true;
        }
        if (user == null && uri.indexOf("/order") == 0){
            session.setAttribute("err","小老弟,还没登录就想下单!");
            response.sendRedirect("/login");
            return false;
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

}
