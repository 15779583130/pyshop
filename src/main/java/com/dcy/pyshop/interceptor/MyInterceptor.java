package com.dcy.pyshop.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("MyInterceptor:preHandle");
        HttpSession session = request.getSession();
        if(session.getAttribute("user")!=null||session.getAttribute("admin")!=null){
            return true;
        }else{
            String goURL=request.getHeader("Referer");
            String param= request.getQueryString();
           /* if(param!=null){
                goURL=goURL+"?"+param;
            }*/
            request.getSession().setAttribute("goURL",goURL);
            String url = request.getContextPath() + "/user/login" ;
            response.sendRedirect(request.getContextPath() + "/user/login");
//            request.getRequestDispatcher(url).forward(request,response);
            return false;
        }


//        if(session.getAttribute("user")==null){
//            String goURL=request.getHeader("Referer");
//            String param= request.getQueryString();
//           /* if(param!=null){
//                goURL=goURL+"?"+param;
//            }*/
//            request.getSession().setAttribute("goURL",goURL);
//            response.sendRedirect(request.getContextPath() + "/user/login");
//            return false;
//        }else {
//            return true;
//        }



    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("MyInterceptor:postHandle");
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("MyInterceptor:afterCompletion");
        super.afterCompletion(request, response, handler, ex);
    }
}
