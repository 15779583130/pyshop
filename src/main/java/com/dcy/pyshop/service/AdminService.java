package com.dcy.pyshop.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.dcy.pyshop.dao.*;
import com.dcy.pyshop.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private UserMapper userMapper;

    public PageInfo categoryList(Integer pageNum, Map<String, String[]> condition) {
        int pageSize=10;
        PageHelper.startPage(pageNum,pageSize,true);
        List<Category> categoryList = categoryMapper.showCategory(condition);
        PageInfo<Category> pageInfo=new PageInfo<>(categoryList);
        return pageInfo;
    }
    public PageInfo productList(Integer pageNum, Map<String, String[]> condition) {
        int pageSize=10;
        PageHelper.startPage(pageNum,pageSize,true);
        List<Product> productList = productMapper.showProduct(condition);
        PageInfo<Product> pageInfo=new PageInfo<>(productList);
        return pageInfo;
    }

    public int addCategory(Category category) {
        if(category.getCparentId()==null){
            category.setCparentId(0L);
        }
        int insert = categoryMapper.insert(category);
        return insert;
    }

    public Category editCategory(Long cid) {
        Category category = categoryMapper.getCategoryById(cid);
        return category;
    }
    public Product editProduct(Long pid) {
        Product product=productMapper.selectByPrimaryKey(pid);
        return  product;
    }

    public int updateCategory(Category category) {
        int i = categoryMapper.updateByPrimaryKeySelective(category);
        return i;
    }

    public int deleteCategoryByCid(Long cid){
        int i = categoryMapper.deleteByPrimaryKey(cid);
        return i;
    }

    public int addProduct(Product product){
        int insert = productMapper.insert(product);
        return insert;
    }

    public int deleteProductByPid(Long pid) {
        int i=productMapper.deleteByPrimaryKey(pid);
        return i;
    }

    public int updateProduct(Product product) {
        int i = productMapper.updateByPrimaryKeySelective(product);
        return i;
    }

    public PageInfo orderList(Integer pageNum, Map<String, String[]> condition) {
        int pageSize=10;
        PageHelper.startPage(pageNum,pageSize,true);
        List<Order> orderList=orderMapper.showOrder(condition);
        PageInfo<Order> pageInfo=new PageInfo<>(orderList);
        return pageInfo;
    }

    public  List<Map<String, Object>> findOrderInfoByOid(String oid){
        return orderMapper.findOrderInfoByOid(oid);
    }

    public PageInfo userList(Integer pageNum, Map<String, String[]> condition) {
        int pageSize=10;
        PageHelper.startPage(pageNum,pageSize,true);
        List<User> userList=userMapper.showUser(condition);
        PageInfo<User> pageInfo=new PageInfo<>(userList);
        return pageInfo;
    }

    public Admin adminIsExist(Admin currentAdmin) {
        return adminMapper.adminIsExist(currentAdmin);
    }

    public int deleteUserByUid(Long uid) {
        int i = userMapper.deleteByPrimaryKey(uid);
        return i;
    }
}
