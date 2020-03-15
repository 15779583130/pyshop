package com.dcy.pyshop.entity;

public class OrderItem {
    private Product product;
    private Order order;

    public Product getProduct() {
        return product;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "product=" + product +
                ", order=" + order +
                ", itemid='" + itemid + '\'' +
                ", count=" + count +
                ", subtotal=" + subtotal +
                ", pid=" + pid +
                ", oid='" + oid + '\'' +
                '}';
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column orderitem.itemid
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    private String itemid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column orderitem.count
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    private Integer count;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column orderitem.subtotal
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    private Double subtotal;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column orderitem.pid
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    private Long pid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column orderitem.oid
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    private String oid;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column orderitem.itemid
     *
     * @return the value of orderitem.itemid
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    public String getItemid() {
        return itemid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column orderitem.itemid
     *
     * @param itemid the value for orderitem.itemid
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    public void setItemid(String itemid) {
        this.itemid = itemid == null ? null : itemid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column orderitem.count
     *
     * @return the value of orderitem.count
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    public Integer getCount() {
        return count;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column orderitem.count
     *
     * @param count the value for orderitem.count
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    public void setCount(Integer count) {
        this.count = count;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column orderitem.subtotal
     *
     * @return the value of orderitem.subtotal
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    public Double getSubtotal() {
        return subtotal;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column orderitem.subtotal
     *
     * @param subtotal the value for orderitem.subtotal
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column orderitem.pid
     *
     * @return the value of orderitem.pid
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    public Long getPid() {
        return pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column orderitem.pid
     *
     * @param pid the value for orderitem.pid
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    public void setPid(Long pid) {
        this.pid = pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column orderitem.oid
     *
     * @return the value of orderitem.oid
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    public String getOid() {
        return oid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column orderitem.oid
     *
     * @param oid the value for orderitem.oid
     *
     * @mbg.generated Mon Sep 24 12:06:33 CST 2019
     */
    public void setOid(String oid) {
        this.oid = oid == null ? null : oid.trim();
    }
}