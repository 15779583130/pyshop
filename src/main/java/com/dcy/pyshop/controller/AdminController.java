package com.dcy.pyshop.controller;

import com.dcy.pyshop.utils.ResponseResult;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.dcy.pyshop.entity.Category;
import com.dcy.pyshop.entity.Product;
import com.dcy.pyshop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.time.LocalDate;
import java.util.*;


@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/category/list")
    public String CategoryList(HttpServletRequest request,@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum){
        Map<String, String[]> condition = request.getParameterMap();
        PageInfo pageInfo= adminService.categoryList(pageNum, condition);
        request.setAttribute("condition",condition);
        request.setAttribute("pageInfo",pageInfo);
        request.setAttribute("mainPage","categoryManage.jsp");
        return "admin/index";
    }
    @RequestMapping(value = "/product/list")
    public String ProductList(HttpServletRequest request,@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum){
        Map<String, String[]> condition = request.getParameterMap();
        PageInfo pageInfo= adminService.productList(pageNum, condition);
        request.setAttribute("condition",condition);
        request.setAttribute("pageInfo",pageInfo);
        request.setAttribute("mainPage","productManage.jsp");
        return "admin/index";
    }

    @RequestMapping(value = "/product/add")
    public String ProductAdd(HttpServletRequest request,@RequestParam("myfiles") MultipartFile[] files, Product product, RedirectAttributes attr){
        String result=null;
        List<String> list = new ArrayList<String>();
        if (files != null && files.length > 0) {
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                // 保存文件
                // 判断文件是否为空
                if (!file.isEmpty()) {
                    try {
                        // 保存的文件路径(如果用的是Tomcat服务器，文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
                        // )
                        String filePath = request.getSession().getServletContext()
                                .getRealPath("/")
                                + "static/images/uploads/"+ file.getOriginalFilename();
                        list.add(file.getOriginalFilename());
                        File saveDir = new File(filePath);
                        if (!saveDir.getParentFile().exists())
                            saveDir.getParentFile().mkdirs();
                        // 转存文件
                        file.transferTo(saveDir);
                        String pimage="uploads/"+file.getOriginalFilename();
                        product.setPimage(pimage);
                        product.setPflag(0);
                        product.setPdate(new Date());

                        //int j= adminService.addProduct(product);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        int j=adminService.addProduct(product);
        if(j>0){
            result="添加成功";
        }else {
            result="添加失败";
        }
        attr.addFlashAttribute("result",result);
        return "redirect:/admin/product/list";
    }



    @RequestMapping("/category/add")
    @ResponseBody
    public String CategoryAdd(Category category){
        ResponseResult result;
        int i=adminService.addCategory(category);
        if(i>0){
            result=new ResponseResult("1","success");
        }else {
            result=new ResponseResult("0","fail");
        }
        return new Gson().toJson(result);
    }
    @RequestMapping("/category/edit")
    public String CategoryEdit(HttpServletRequest request,Long cid){
        Category category=adminService.editCategory(cid);
        request.setAttribute("category",category);
        return "admin/editCategory";
    }
    @RequestMapping("/product/edit")
    public String ProductEdit(HttpServletRequest request,Long pid){
        Product product=adminService.editProduct(pid);
        request.setAttribute("product",product);
        return "admin/editProduct";
    }
    @RequestMapping("/category/update")
    @ResponseBody
    public String CategoryUpdate(Category category){
        int i=adminService.updateCategory(category);
        ResponseResult result=null;
        if(i>0){
            result=new ResponseResult("1","修改成功");
        }else {
            result=new ResponseResult("0","修改失败");
        }
        return new Gson().toJson(result);
    }
    @RequestMapping("/product/update")
    public String ProductUpdate(HttpServletRequest request,@RequestParam("myfiles") MultipartFile[] files, Product product, RedirectAttributes attr){
        String result=null;
        List<String> list = new ArrayList<String>();
        if (files != null && files.length > 0) {
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                // 保存文件
                // 判断文件是否为空
                if (!file.isEmpty()) {
                    try {
                        // 保存的文件路径(如果用的是Tomcat服务器，文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
                        // )
                        String filePath = request.getSession().getServletContext()
                                .getRealPath("/")
                                + "static/images/uploads/"+ file.getOriginalFilename();
                        list.add(file.getOriginalFilename());
                        File saveDir = new File(filePath);
                        if (!saveDir.getParentFile().exists())
                            saveDir.getParentFile().mkdirs();
                        // 转存文件
                        file.transferTo(saveDir);
                        String pimage="uploads/"+file.getOriginalFilename();
                        product.setPimage(pimage);
                        product.setPflag(0);
                        product.setPdate(new Date());

                        //int j= adminService.addProduct(product);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        int j=adminService.updateProduct(product);

        return "redirect:/admin/product/list";
    }
    @RequestMapping("/category/delete")
    public String CategoryDelete(Long cid){
        int i=adminService.deleteCategoryByCid(cid);
        return "redirect:/admin/category/list";
    }
    @RequestMapping("/order/list")
    public String OrderList(HttpServletRequest request,@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum){
        Map<String, String[]> map = request.getParameterMap();
        Map<String,String[]> condition = new HashMap();
        condition.putAll(map);
        if(condition.get("w_starttime")==null){
            condition.put("w_starttime",new String[]{""});
        }
        if(condition.get("w_endtime")==null||condition.get("w_endtime")[0]==""){
            condition.put("w_endtime",new String[]{LocalDate.now().toString()});
        }
        PageInfo pageInfo= adminService.orderList(pageNum, condition);
        request.setAttribute("condition",condition);
        request.setAttribute("pageInfo",pageInfo);
        request.setAttribute("mainPage","orderManage.jsp");
        return "admin/index";
    }

    @RequestMapping("/user/list")
    public String UserList(HttpServletRequest request,@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum){
        Map<String, String[]> condition = request.getParameterMap();
        PageInfo pageInfo= adminService.userList(pageNum, condition);
        request.setAttribute("condition",condition);
        request.setAttribute("pageInfo",pageInfo);
        request.setAttribute("mainPage","userManage.jsp");
        return "admin/index";
    }

    @RequestMapping("/user/delete")
    public String userdelete(HttpServletRequest request,Long uid){
        int i=adminService.deleteUserByUid(uid);
        return "redirect:/admin/user/list";
    }

    @RequestMapping("/report")
    public String report(HttpServletRequest request){
        request.setAttribute("mainPage","report.jsp");
        return "admin/index";
    }

    @RequestMapping("/product/delete")
    public String ProductDelete(Long pid){
        int i=adminService.deleteProductByPid(pid);
        return "redirect:/admin/product/list";
    }

    @RequestMapping("/editProduct")
    public String admineditProduct(HttpServletRequest request,Long pid){
        Product product = adminService.editProduct(pid);
        request.setAttribute("product",product);
        request.setAttribute("mainPage","editProduct.jsp");
        return "admin/index";
    }

    @RequestMapping("/exit")
    public String adminExit(HttpSession session){
        session.removeAttribute("admin");
        session.invalidate();
        return "redirect:/admin/login";
    }


}
