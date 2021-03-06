package com.dcy.pyshop.dao;

import com.dcy.pyshop.entity.Order;
import com.dcy.pyshop.entity.OrderExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbg.generated Mon Sep 24 12:04:42 CST 2019
     */
    long countByExample(OrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbg.generated Mon Sep 24 12:04:42 CST 2019
     */
    int deleteByExample(OrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbg.generated Mon Sep 24 12:04:42 CST 2019
     */
    int deleteByPrimaryKey(String oid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbg.generated Mon Sep 24 12:04:42 CST 2019
     */
    int insert(Order record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbg.generated Mon Sep 24 12:04:42 CST 2019
     */
    int insertSelective(Order record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbg.generated Mon Sep 24 12:04:42 CST 2019
     */
    List<Order> selectByExample(OrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbg.generated Mon Sep 24 12:04:42 CST 2019
     */
    Order selectByPrimaryKey(String oid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbg.generated Mon Sep 24 12:04:42 CST 2019
     */
    int updateByExampleSelective(@Param("record") Order record, @Param("example") OrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbg.generated Mon Sep 24 12:04:42 CST 2019
     */
    int updateByExample(@Param("record") Order record, @Param("example") OrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbg.generated Mon Sep 24 12:04:42 CST 2019
     */
    int updateByPrimaryKeySelective(Order record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbg.generated Mon Sep 24 12:04:42 CST 2019
     */
    int updateByPrimaryKey(Order record);

    List<Order> showOrder(@Param("params") Map<String, String[]> condition);

    List<Map<String,Object>> findOrderInfoByOid(String oid);


}