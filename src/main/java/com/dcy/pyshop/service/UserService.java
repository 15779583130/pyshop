package com.dcy.pyshop.service;

import com.github.pagehelper.PageHelper;
import com.dcy.pyshop.dao.*;
import com.dcy.pyshop.entity.*;
import com.dcy.pyshop.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserService {
    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CartItemMapper cartItemMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private HistoryMapper historyMapper;
    @Autowired
    private FavouriteMapper favouriteMapper;

    public List<Category> getCurrentLevel(Integer level){
        CategoryExample categoryExample=new CategoryExample();
        categoryExample.createCriteria().andClevelEqualTo(level);
        return categoryMapper.selectByExample(categoryExample);
    }
    public List<Product> findHotProductList(){
        PageHelper.startPage(1,12,true);
        ProductExample productExample=new ProductExample();
        productExample.createCriteria().andIsHotEqualTo(1);
        return productMapper.selectByExample(productExample);
    }

    public List<Product> findNewProductList(){
        PageHelper.startPage(1,12,true);
        ProductExample productExample=new ProductExample();
        productExample.setOrderByClause("pdate");
        return productMapper.selectByExample(productExample);
    }

    public List<Product> getChildList(Long cid, Map<String, String[]> condition){
        return productMapper.getChildList(cid,condition);
    }

    public Product getProductByPid(Long pid) {
        Product product = productMapper.selectByPrimaryKey(pid);
        return product;
    }

    public User userIsExist(User currentUser){
        currentUser.setPassword(MD5Util.MD5EncodeUtf8(currentUser.getPassword()));
        return userMapper.userIsExist(currentUser);
    }

    public CartItem cartItemisExist(Long uid, Long pid){
        return cartItemMapper.cartItemisExist(uid, pid);
    }

    public int updateCardItem(CartItem cartItem){
        int i = cartItemMapper.updateByPrimaryKeySelective(cartItem);
        return i;
    }

    public int addProductToCart(CartItem cartItem){
        int insert = cartItemMapper.insert(cartItem);
        return insert;
    }
    public List<CartItem> allCartItem(Long uid){
        return cartItemMapper.allCartItem(uid);
    }

    public int deleteCartItem(Long uid, Long pid) {
        return cartItemMapper.deleteCartItem(uid,pid);
    }
    public int deleteAllCartItem(Long uid) {
        return cartItemMapper.deleteAllCartItem(uid);
    }

    public void submitOrder(Order order) {
        order.setUid(order.getUser().getUid());
        int insert = orderMapper.insert(order);
        List<OrderItem> orderItems = order.getOrderItems();
        for (OrderItem orderItem : orderItems) {
            orderItem.setPid(orderItem.getProduct().getPid());
            orderItem.setOid(orderItem.getOrder().getOid());
            orderItemMapper.insert(orderItem);
        }
    }

    public void updateOrder(Order order) {
        orderMapper.updateByPrimaryKeySelective(order);
    }

    public Order getOrder(String oid){
        return orderMapper.selectByPrimaryKey(oid);
    }

    public List<Category> getBreadCrumbList(Long cid) {
        return categoryMapper.getParentList(cid);
    }

    public Category getCategory(Long pid) {
        Product product = productMapper.selectByPrimaryKey(pid);
        return categoryMapper.selectByCid(product.getCid());
    }

    public void addProductToHistory(History history){
        historyMapper.insert(history);
    }

    public Boolean isExistInHistory(History history){
        History his=historyMapper.isExist(history);
        if (his!=null){
            return true;
        }else {
            return false;
        }
    }

    public int addUser(User user) {
        user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
        user.setUimage("users/default.jpg");
        return userMapper.insert(user);
    }

    public int updateUser(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    public User getCurrentUser(Long uid) {
        return userMapper.selectByPrimaryKey(uid);
    }

    public List<Product> getFoots(Long uid) {
        return userMapper.getFoots(uid);
    }

    public List<Product> getFavourite(Long uid) {
        List<Product> favourite = userMapper.getFavourite(uid);
        return favourite;
    }

    public int updatePassword(String email,String password){
        UserExample userExample=new UserExample();
        userExample.createCriteria().andEmailEqualTo(email);
        List<User> userList = userMapper.selectByExample(userExample);
        User user = userList.get(0);
        user.setPassword(MD5Util.MD5EncodeUtf8(password));
        return userMapper.updateByPrimaryKeySelective(user);
    }

    public List<Order> findAllOrders(Long uid) {
        OrderExample orderExample=new OrderExample();
        orderExample.createCriteria().andUidEqualTo(uid);
        orderExample.setOrderByClause("ordertime desc");
        return orderMapper.selectByExample(orderExample);
    }

    public List<Map<String, Object>> findAllOrderItemByOid(String oid) {
        return orderMapper.findOrderInfoByOid(oid);
    }

    public Product favouriteIsExist(Long uid, Long pid) {
        return productMapper.favouriteIsExist(uid,pid);
    }

    public int addFavourite(Favourite favourite) {
        return favouriteMapper.insert(favourite);
    }

    public int cancelFavourite(Long pid, Long uid) {
        FavouriteExample favouriteExample=new FavouriteExample();
        favouriteExample.createCriteria().andUidEqualTo(uid).andPidEqualTo(pid);
        int i = favouriteMapper.deleteByExample(favouriteExample);
        return i;
    }

    public int deleteOrder(String oid) {
        int i = orderMapper.deleteByPrimaryKey(oid);
        OrderItemExample orderItemExample=new OrderItemExample();
        orderItemExample.createCriteria().andOidEqualTo(oid);
        int j = orderItemMapper.deleteByExample(orderItemExample);
        if(i>0&&j>0){
            return 1;
        }else{
            return 0;
        }
    }

    public List<OrderItem> OrderItems(String oid) {
        OrderItemExample orderItemExample=new OrderItemExample();
        orderItemExample.createCriteria().andOidEqualTo(oid);
        return orderItemMapper.selectByExample(orderItemExample);
    }

    public int deleteFavourite(Long pid, Long uid) {
        FavouriteExample favouriteExample=new FavouriteExample();
        favouriteExample.createCriteria().andPidEqualTo(pid).andUidEqualTo(uid);
        return favouriteMapper.deleteByExample(favouriteExample);
    }

    public List<History> getFootsList(Long uid) {
        HistoryExample historyExample=new HistoryExample();
        historyExample.createCriteria().andUidEqualTo(uid);
        historyExample.setOrderByClause("htime desc");
        return historyMapper.selectByExample(historyExample);
    }

    public List<String> getDateList(Long uid) {
        return historyMapper.getDateList(uid);
    }

    public int deleteFoot(Long pid, Long uid) {
        HistoryExample historyExample=new HistoryExample();
        historyExample.createCriteria().andUidEqualTo(uid).andPidEqualTo(pid);
        return historyMapper.deleteByExample(historyExample);
    }

    public int deleteOrderItem(String itemid) {
        return orderItemMapper.deleteByPrimaryKey(itemid);
    }
}
