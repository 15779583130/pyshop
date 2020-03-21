package com.dcy.pyshop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.dcy.pyshop.entity.*;
import com.dcy.pyshop.service.UserService;
import com.dcy.pyshop.utils.IdUtils;
import com.dcy.pyshop.utils.ResponseResult;
import org.apache.commons.beanutils.BeanUtils;
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
import java.lang.reflect.InvocationTargetException;
import java.util.*;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    List<Product> historyList=new ArrayList<>();

    @RequestMapping("/user/search")
    public String usersearch(HttpServletRequest request,@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum){
        Map<String, String[]> condition  = request.getParameterMap();
        String keywords = request.getParameter("keywords");
//        HighlightQuery query=new SimpleHighlightQuery();
//        HighlightOptions highlightOptions=new HighlightOptions().addField("pdesc");
//        highlightOptions.setSimplePrefix("<b style='color:#D43F3A'>");
//        highlightOptions.setSimplePostfix("</b>");
//        query.setHighlightOptions(highlightOptions);
//        Criteria criteria=new Criteria("item_keywords").is(keywords);
//        query.addCriteria(criteria);
//        Integer papgeSize=8;
//        query.setRows(papgeSize);
//        query.setOffset((pageNum-1)*papgeSize);
//        HighlightPage<Product> page = solrTemplate.queryForHighlightPage(query, Product.class);
//        List<HighlightEntry<Product>> entryList = page.getHighlighted();
//        for (HighlightEntry<Product> entry : entryList) {
//            List<HighlightEntry.Highlight> highlightList = entry.getHighlights();
//            if(highlightList.size()>0&&highlightList.get(0).getSnipplets().size()>0){
//                Product product= entry.getEntity();
//                product.setPdesc(highlightList.get(0).getSnipplets().get(0));
//            }
//        }
//        request.setAttribute("page",page);
        request.setAttribute("condition",condition);
        return "user/product_solrlist";
    }

    @RequestMapping(value = {"/user/index","/"})
    public String userindex(HttpServletRequest request){
        List<Category> firstCategories=null;
        List<Category> secondCategories=null;
        List<Category> thirdCategories=null;
        firstCategories = userService.getCurrentLevel(1);
        secondCategories = userService.getCurrentLevel(2);
        thirdCategories = userService.getCurrentLevel(3);
        List<Product> hotProductList = userService.findHotProductList();
        List<Product> newProductList = userService.findNewProductList();
        request.setAttribute("firstCategories",firstCategories);
        request.setAttribute("secondCategories",secondCategories);
        request.setAttribute("thirdCategories",thirdCategories);
        request.setAttribute("hotProductList",hotProductList);
        request.setAttribute("newProductList",newProductList);
        return "user/index";
    }

    @RequestMapping(value = "/user/addProductToCart",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addProdductToCard(HttpServletRequest request,Long pid,Long uid,Integer buyNum){
        Product product = userService.getProductByPid(pid);
        CartItem cartItem = userService.cartItemisExist(uid, pid);
        //如果已存在
        if(cartItem!=null){
            int newBuyNum=cartItem.getBuynum()+buyNum;
            cartItem.setBuynum(newBuyNum);
            cartItem.setSubtotal(product.getShopPrice()*newBuyNum);
            userService.updateCardItem(cartItem);
            return new Gson().toJson(new ResponseResult("1","添加成功"));
        }else {
            CartItem newCartItem=new CartItem(null,uid,pid,buyNum,product.getShopPrice()*buyNum);
            userService.addProductToCart(newCartItem);
            return new Gson().toJson(new ResponseResult("1","添加成功"));
        }
    }

    @RequestMapping(value = "/user/addProductToFavourite",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addProductToFavourite(HttpServletRequest request,Long pid,Long uid){
        ResponseResult result=null;
        Product product=userService.favouriteIsExist(uid,pid);
        if(product!=null){
            result=new ResponseResult("0","已存在");
        }else{
            Favourite favourite=new Favourite();
            favourite.setFid(null);
            favourite.setPid(pid);
            favourite.setUid(uid);
            favourite.setFtime(new Date());
            int i=userService.addFavourite(favourite);
            result=new ResponseResult("1","添加收藏成功");
        }
        return new Gson().toJson(result);
    }

    @RequestMapping(value = "/user/cancelFavourite",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String cancelFavourite(HttpServletRequest request,Long pid,Long uid){
        int i=userService.cancelFavourite(pid,uid);
        return new Gson().toJson(new ResponseResult("1","移除收藏成功"));
    }

    @RequestMapping(value = "/user/updateCart",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String updateCart(HttpServletRequest request,Long pid,Long uid,Integer buyNum){
        HttpSession session = request.getSession();
        Cart cart=(Cart)session.getAttribute("cart");
        Product product=userService.getProductByPid(pid);
        CartItem cartItem = userService.cartItemisExist(uid, pid);
        cartItem.setBuynum(buyNum);
        cartItem.setSubtotal(buyNum*product.getShopPrice());
        int i = userService.updateCardItem(cartItem);
        List<CartItem> cartItems = userService.allCartItem(uid);
        double num=0;
        for (CartItem item : cartItems) {
            num+=item.getSubtotal();
        }
        cart.setTotal(num);
        return new Gson().toJson(new ResponseResult("1","更新成功"));
    }

    @RequestMapping("/user/shoppingCart")
    public String shoppingCart(HttpServletRequest request,Long uid){
        HttpSession session = request.getSession();
        Cart cart=new Cart();
        List<CartItem> cartItems = userService.allCartItem(uid);
        double num=0;
        for (CartItem cartItem : cartItems) {
            num+=cartItem.getSubtotal();
            cart.getCartItems().put(cartItem.getPid(), cartItem);
        }
        cart.setTotal(num);
        session.setAttribute("cart",cart);
        return "user/shoppingCart";
    }

    @RequestMapping("/user/CartItemDelete")
    public String cartItemDelete(HttpServletRequest request,Long uid,Long pid){
        userService.deleteCartItem(uid,pid);
        return "redirect:/user/shoppingCart?uid="+uid;
    }

    @RequestMapping("/user/CartItemDeleteAll")
    public String cartItemDeleteAll(HttpServletRequest request,Long uid){
        userService.deleteAllCartItem(uid);
        return "redirect:/user/shoppingCart?uid="+uid;
    }

    @RequestMapping("/user/product_list")
    public String product_list(HttpServletRequest request,Long cid,@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum){
        Map<String, String[]> map = request.getParameterMap();
        Map<String,String[]> condition = new HashMap();
        condition.putAll(map);
        if(condition.get("pricefrom")==null||condition.get("pricefrom")[0]==""){
            condition.put("pricefrom",new String[]{"0"});
        }
        if(condition.get("priceto")==null||condition.get("priceto")[0]==""){
            condition.put("priceto",new String[]{"999999"});
        }
        int pageSize=8;
        PageHelper.startPage(pageNum,pageSize,true);
        List<Product> productList = userService.getChildList(cid,condition);
        PageInfo<Product> pageInfo=new PageInfo<>(productList);
        List<Category> breadCrumbList=userService.getBreadCrumbList(cid);
        request.setAttribute("pageInfo",pageInfo);
        request.setAttribute("condition",condition);
        request.setAttribute("breadCrumbList",breadCrumbList);
        request.setAttribute("cid",cid);
        return"user/product_list";
    }



    @RequestMapping("/user/product_info")
    public String product_info(HttpServletRequest request,Long pid){
        Category category=userService.getCategory(pid);
        List<Category> breadCrumbList=userService.getBreadCrumbList(category.getCid());
        Product product=userService.getProductByPid(pid);
        request.setAttribute("product",product);
        request.setAttribute("breadCrumbList",breadCrumbList);
        System.out.println(historyList.contains(product));
        if(!historyList.contains(product)){
            historyList.add(0,product);
        }else{
            historyList.remove(product);
            historyList.add(0,product);
        }

        HttpSession session = request.getSession();
        session.setAttribute("historyList",historyList);
        User user =(User)session.getAttribute("user");

        if(user!=null){
            if(historyList!=null){
                for (Product pro : historyList) {
                    History history=new History();
                    history.setHid(null);
                    history.setUid(user.getUid());
                    history.setPid(pro.getPid());
                    history.setHtime(new Date());
                    if(!userService.isExistInHistory(history)){
                        userService.addProductToHistory(history);
                    }
                }
                Product favour = userService.favouriteIsExist(user.getUid(),pid);
                request.setAttribute("favour",favour);
            }
        }
        return "user/product_info";
    }

    @RequestMapping("/user/order_info")
    public String order_info(HttpServletRequest request,Long uid){
        HttpSession session = request.getSession();
        User user=(User)session.getAttribute("user");
        Cart cart=(Cart)session.getAttribute("cart");
        String myid= IdUtils.createId(uid);
        List<CartItem> cartItems = userService.allCartItem(uid);
        Order order=new Order();
        order.setOid(IdUtils.createId(uid));
        order.setOrdertime(new Date());
        order.setAddress(null);
        order.setName(null);
        order.setTelephone(null);
        order.setUser(user);
        order.setTotal(cart.getTotal());
        order.setState(0);
        for (CartItem cartItem : cartItems) {
            OrderItem orderItem=new OrderItem();
            orderItem.setItemid(IdUtils.createId());
            orderItem.setCount(cartItem.getBuynum());
            orderItem.setSubtotal(cartItem.getSubtotal());
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setOrder(order);
            order.getOrderItems().add(orderItem);
        }
        userService.submitOrder(order);
//        session.setAttribute("order",order);
        request.setAttribute("order",order);
        return "user/order_info";
    }

    @RequestMapping("/user/buyNow")
    public String buyBow(HttpServletRequest request,Long uid,Long pid,Integer buyNum){
        HttpSession session = request.getSession();
        User user=(User)session.getAttribute("user");
        Product product = userService.getProductByPid(pid);
        Order order=new Order();
        order.setOid(IdUtils.createId(uid));
        order.setOrdertime(new Date());
        order.setAddress(null);
        order.setName(null);
        order.setTelephone(null);
        order.setUser(user);
        order.setTotal(product.getShopPrice());
        order.setState(0);

        OrderItem orderItem=new OrderItem();
        orderItem.setItemid(IdUtils.createId());
        orderItem.setCount(buyNum);
        orderItem.setSubtotal(product.getShopPrice()*buyNum);
        orderItem.setProduct(product);
        orderItem.setOrder(order);
        order.getOrderItems().add(orderItem);
        userService.submitOrder(order);
//        session.setAttribute("order",order);
        request.setAttribute("order",order);
        return "user/order_info";
    }

    @RequestMapping("/user/exit")
    public String userexit(HttpSession session){
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/user/index";
    }

    @RequestMapping("/user/doregister")
    @ResponseBody
    public String doregister(User user){
        ResponseResult result=null;
        int i=userService.addUser(user);
        if(i>0){
            result=new ResponseResult("1","success");
        }else {
            result=new ResponseResult("0","fail");
        }
        return new Gson().toJson(result);
    }

    @RequestMapping("/user/update")
    public String userUpdate(HttpServletRequest request, @RequestParam("mypic") MultipartFile[] files,User user, RedirectAttributes attr){
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
                                + "static/images/uploads/user/"+ file.getOriginalFilename();
                        System.out.println(filePath);
                        list.add(file.getOriginalFilename());
                        File saveDir = new File(filePath);
                        if (!saveDir.getParentFile().exists())
                            saveDir.getParentFile().mkdirs();
                        // 转存文件
                        file.transferTo(saveDir);
                        String uimage="uploads/user/"+file.getOriginalFilename();
                        user.setUimage(uimage);

                        //int j= adminService.addProduct(product);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        int j=userService.updateUser(user);
        String result=null;
        if(j>0){
            HttpSession session = request.getSession();
            session.removeAttribute("user");
            User newUser=userService.getCurrentUser(user.getUid());
            session.setAttribute("user",newUser);
            result="修改成功";
        }else{
            result="修改失败";
        }
        attr.addFlashAttribute("result",result);
        return "redirect:/user/userInfo";
    }

    @RequestMapping("/user/foots")
    public String userFoots(HttpServletRequest request,Long uid){
        List<History> footsList=userService.getFootsList(uid);
        List<String> dateList=userService.getDateList(uid);
        for (History history : footsList) {
            Product product = userService.getProductByPid(history.getPid());
            history.setProduct(product);
        }
        System.out.println("hhh");
        request.setAttribute("dateList",dateList);
        request.setAttribute("footsList",footsList);
        return "user/userFoots";
    }

    @RequestMapping("/user/favourite")
    public String userFavourite(HttpServletRequest request,Long uid,@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum){
        PageHelper.startPage(pageNum,12,true);
        List<Product> favouriteList=userService.getFavourite(uid);
        PageInfo<Product> pageInfo=new PageInfo<>(favouriteList);
        request.setAttribute("favouriteList",favouriteList);
        request.setAttribute("pageInfo",pageInfo);
        return "user/userFavourite";
    }

    @RequestMapping("/user/findPassword")
    public String findPassword(){
        return "user/findPassword";
    }

    @RequestMapping("/user/updatePassword")
    @ResponseBody
    public String updatePassword(String email,String password){
        ResponseResult result=null;
        int i = userService.updatePassword(email, password);
        if(i>0){
            result=new ResponseResult("1","success");
        }else {
            result=new ResponseResult("0","fail");
        }
        return new Gson().toJson(result);
    }

    @RequestMapping("/user/myorder")
    public String myOrder(HttpServletRequest request,Long uid,@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum){
        PageHelper.startPage(pageNum,5,true);
        List<Order> orderList=userService.findAllOrders(uid);
        if(orderList!=null&&orderList.size()!=0){
            for (Order order : orderList) {
                //获得每一个订单的oid
                String oid = order.getOid();
                //查询该订单的所有的订单项---mapList封装的是多个订单项和该订单项中的商品的信息
                List<Map<String, Object>> mapList = userService.findAllOrderItemByOid(oid);
                //将mapList转换成List<OrderItem> orderItems
                for(Map<String,Object> map : mapList){
                    try {
                        //从map中取出count subtotal 封装到OrderItem中
                        OrderItem item = new OrderItem();
                        //item.setCount(Integer.parseInt(map.get("count").toString()));
                        BeanUtils.populate(item, map);
                        //从map中取出pimage pname shop_price 封装到Product中
                        Product product = new Product();
                        product.setShopPrice((Double) map.get("shop_price"));
                        BeanUtils.populate(product, map);
                        //将product封装到OrderItem
                        item.setProduct(product);
                        //将orderitem封装到order中的orderItemList中
                        order.getOrderItems().add(item);
                    } catch (IllegalAccessException | InvocationTargetException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        PageInfo<Order> pageInfo=new PageInfo<>(orderList);
        request.setAttribute("pageInfo",pageInfo);
        //request.setAttribute("orderList", orderList);
        return "user/userOrder";
    }

    @RequestMapping("/user/deleteOrder")
    @ResponseBody
    public String deleteOrder(HttpServletRequest request,String oid){
        int i=userService.deleteOrder(oid);
        return new Gson().toJson(new ResponseResult("1","删除订单成功"));
    }

    @RequestMapping("/user/deleteFavourite")
    @ResponseBody
    public String deleteFavourite(HttpServletRequest request,Long pid,Long uid){
        int i=userService.deleteFavourite(pid,uid);
        return new Gson().toJson(new ResponseResult("1","删除收藏成功"));
    }

    @RequestMapping("/user/deleteFoot")
    @ResponseBody
    public String deleteFoot(HttpServletRequest request,Long pid,Long uid){
        int i=userService.deleteFoot(pid,uid);
        return new Gson().toJson(new ResponseResult("1","删除足迹成功"));
    }

    @RequestMapping("/user/deleteOrderItem")
    @ResponseBody
    public String deleteOrderItem(HttpServletRequest request,String itemid){
        int i=userService.deleteOrderItem(itemid);
        return new Gson().toJson(new ResponseResult("1","删除足迹成功"));
    }


    @RequestMapping("/user/goToPay")
    public String goToPay(HttpServletRequest request,String oid){
        Order order = userService.getOrder(oid);
        List<OrderItem> orderItems=userService.OrderItems(oid);
        for (OrderItem orderItem : orderItems) {
            Long pid = orderItem.getPid();
            Product product = userService.getProductByPid(pid);
            orderItem.setProduct(product);
            order.getOrderItems().add(orderItem);
        }
        request.setAttribute("order",order);
        return "user/order_info";
    }
}


