package com.dcy.pyshop.controller;

import com.dcy.pyshop.entity.Admin;
import com.dcy.pyshop.entity.User;
import com.dcy.pyshop.service.AdminService;
import com.dcy.pyshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private AdminService adminService;
    @RequestMapping("/login")
    public String login(){
        return "admin/index";
    }
    @RequestMapping("/admin/dologin")
    public String adminlogin(HttpServletRequest request,Admin currentAdmin){
        Admin admin= adminService.adminIsExist(currentAdmin);
        if(admin==null){
            request.setAttribute("error","用户名或密码错误");
            return "admin/adminLogin";
        }else {
            HttpSession session = request.getSession();
            session.setAttribute("admin",admin);
            return "admin/index";
        }
    }

    @RequestMapping("/dologin")
    public String dologin(){
        return "user/index";
    }

    @RequestMapping("/dologin2")
    public String dologin2(HttpServletRequest request, User currentUser){
        User user = userService.userIsExist(currentUser);
        if(user==null){
            request.setAttribute("error","手机号或密码错误");
            return "user/login";
        }else {
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
//            String goURL=(String)session.getAttribute("goURL");
//            if(session.getAttribute("goURL")==null){
//                return "redirect:/user/index";
//            }else {
//                System.out.println("hhhhhhhhhhhhhhhhhh"+session.getAttribute("goURL"));
//                return "redirect:"+goURL;
//            }
            return "redirect:/user/index";
        }
    }
}
