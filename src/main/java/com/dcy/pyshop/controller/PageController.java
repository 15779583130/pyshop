package com.dcy.pyshop.controller;

import com.dcy.pyshop.service.AdminService;
import com.dcy.pyshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class PageController {
    @Autowired
    private UserService userService;
    @Autowired
    private AdminService adminService;
    @RequestMapping("/test")
    public String test(){
        return "user/test";
    }
    @RequestMapping("/admin/index")
    public String adminindex(){
        return "admin/index";
    }
    @RequestMapping("/admin/login")
    public String adminlogin(){
        return "admin/adminLogin";
    }
    @RequestMapping("/admin/addCategory")
    public String adminaddcategory(){
        return "admin/addCategory";
    }
    @RequestMapping("/admin/addProduct")
    public String adminaddProduct(HttpServletRequest request){
        request.setAttribute("mainPage","addProduct.jsp");
        return "admin/index";
    }

    @RequestMapping("/admin/editCategory")
    public String admineditcategory(HttpServletRequest request){
        request.setAttribute("mainPage","editProduct.jsp");
        return "admin/index";
    }
    @RequestMapping("/admin/orderinfo")
    public String orderinfo(HttpServletRequest request,String oid){
        List<Map<String,Object>> mapList=null;
        mapList=adminService.findOrderInfoByOid(oid);
        request.setAttribute("mapList",mapList);
        return "admin/orderInfo";
    }








    @RequestMapping("/user/login")
    public String userLogin(){
        return "user/login";
    }

    @RequestMapping("/user/testpage")
    public String testpage(){
        return null;
    }

    @RequestMapping("/user/register")
    public String userregister(){
        return "user/register";
    }

    @RequestMapping("/user/userInfo")
    public String userInfo(){
        return "user/userInfo";
    }


}
