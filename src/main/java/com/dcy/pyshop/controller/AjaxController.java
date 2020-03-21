package com.dcy.pyshop.controller;

import com.google.gson.Gson;
import com.dcy.pyshop.dao.CategoryMapper;
import com.dcy.pyshop.dao.OrderMapper;
import com.dcy.pyshop.dao.ProductMapper;
import com.dcy.pyshop.dao.UserMapper;
import com.dcy.pyshop.entity.Category;
import com.dcy.pyshop.entity.User;
import com.dcy.pyshop.entity.UserExample;
import com.dcy.pyshop.utils.MailUtils;
import com.dcy.pyshop.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AjaxController {
    @Autowired
    CategoryMapper categoryMapper;
    @Autowired
    ProductMapper productMapper;
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    UserMapper userMapper;
    @RequestMapping(value = "/getLevel",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getLevel(long level){
        List<Category> parent = categoryMapper.getParent(level);
        String s = new Gson().toJson(parent);
        System.out.println(s);
        return s;
    }
    @RequestMapping(value = "/getChild",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getChild(long cparentId){
        List<Category> categoryList = categoryMapper.selectByParentId(cparentId);
        return new Gson().toJson(categoryList);
    }

    @RequestMapping(value = "/getNumInCategory",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getNumInCategory(long cid){
        ResponseResult msg=null;
        int count = categoryMapper.getNumInCategory(cid);
        if(count==0){
            msg=new ResponseResult("0","当前分类没有子分类,可以删除");
        }else{
            msg=new ResponseResult("1","当前分类包含"+count+"个子分类,拒绝删除");
        }
        return new Gson().toJson(msg);
    }
    @RequestMapping(value = "/getSiblingsChild",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getSiblinsChild(Long cid){
        List<Category> categoryList = categoryMapper.getSiblingsChild(cid);
        return new Gson().toJson(categoryList);
    }

    @RequestMapping(value = "/getParSiblingsChild",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getParSiblingsChild(Long cid){
        List<Category> categoryList = categoryMapper.getParSiblingsChild(cid);
        return new Gson().toJson(categoryList);
    }

    @RequestMapping(value = "/getFirstLevel",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getFirstLevel(Long cid){
        Category category = categoryMapper.selectByPrimaryKey(cid);
        List<Category> categoryList = categoryMapper.getParSiblingsChild(category.getCparentId());
        return new Gson().toJson(categoryList);
    }

    @RequestMapping(value = "/getBefore",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getBefore(Long cid){
        String before = categoryMapper.getBefore(cid);
        String[] split = before.split(",");
        return new Gson().toJson(split);
    }

    @RequestMapping("/user/isLogin")
    @ResponseBody
    public String isLogin(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user=(User)session.getAttribute("user");
        ResponseResult result=null;
        if(user==null){
            result=new ResponseResult("0","请登陆");
        }else {
            result=new ResponseResult("1","已登陆");
        }
        return new Gson().toJson(result);
    }

    @RequestMapping("/user/test")
    @ResponseBody
    public String test(){
        return "{\"name\":\"peanut\"}";
    }

    @RequestMapping(value = "/findOrderInfoByOid",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String findOrderInfoByOid(HttpServletRequest request){
        String oid = request.getParameter("oid");
        List<Map<String,Object>> mapList=null;
        mapList=orderMapper.findOrderInfoByOid(oid);
        return new Gson().toJson(mapList);
    }

    @RequestMapping(value = "/getReport1",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getReport1(HttpServletRequest request){
        List<HashMap<String,Object>> mapList=null;
        mapList=categoryMapper.getReport1();
        return new Gson().toJson(mapList);
    }

    @RequestMapping("/user/checkUsername")
    @ResponseBody
    public String checkUsername(HttpServletRequest request,String username){
        UserExample userExample=new UserExample();
        userExample.createCriteria().andUsernameEqualTo(username);
        List<User> userList = userMapper.selectByExample(userExample);
        if(userList==null||userList.size()==0){
            return "{\"valid\":true}";
        }else{
            return "{\"valid\":false}";
        }
    }

    @RequestMapping("/user/checkTelephone")
    @ResponseBody
    public String checkTelephone(HttpServletRequest request,String telephone){
        UserExample userExample=new UserExample();
        userExample.createCriteria().andTelephoneEqualTo(telephone);
        List<User> userList = userMapper.selectByExample(userExample);
        if(userList==null||userList.size()==0){
            return "{\"valid\":true}";
        }else{
            return "{\"valid\":false}";
        }
    }
    @RequestMapping("/user/checkCode")
    @ResponseBody
    public String checkCode(HttpServletRequest request,String email) throws MessagingException{
        Integer x =(int)((Math.random()*9+1)*100000);
        String text = x.toString();
        MailUtils.sendMail(email,text);
        return new Gson().toJson(text);
    }

    @RequestMapping(value="/getReport2",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getReport2(HttpServletRequest request){
        List<HashMap<String,Object>> mapList=null;
        mapList=categoryMapper.getReport2();
        return new Gson().toJson(mapList);
    }

    @RequestMapping(value="/getReport3",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getReport3(HttpServletRequest request){
        List<HashMap<String,Object>> mapList=null;
        mapList=categoryMapper.getReport3();
        return new Gson().toJson(mapList);
    }
    @RequestMapping(value = "/getAge",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAge(){
        List<HashMap<String,Object>> mapList=null;
        mapList=userMapper.getAge();
        return new Gson().toJson(mapList);
    }
    @RequestMapping(value = "/getOrderNum",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getOrderNum(){
        List<HashMap<String,Object>> mapList=null;
        mapList=productMapper.getOrderNum();
        return new Gson().toJson(mapList);
    }


}
