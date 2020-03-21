package com.dcy.pyshop.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.Objects;

public class Product {
    private String cname;
    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return Objects.equals(cname, product.cname) &&
                Objects.equals(pid, product.pid) &&
                Objects.equals(pname, product.pname) &&
                Objects.equals(marketPrice, product.marketPrice) &&
                Objects.equals(shopPrice, product.shopPrice) &&
                Objects.equals(pimage, product.pimage) &&
                Objects.equals(pdate, product.pdate) &&
                Objects.equals(isHot, product.isHot) &&
                Objects.equals(pdesc, product.pdesc) &&
                Objects.equals(pflag, product.pflag) &&
                Objects.equals(cid, product.cid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cname, pid, pname, marketPrice, shopPrice, pimage, pdate, isHot, pdesc, pflag, cid);
    }

    @Override
    public String toString() {
        return "Product{" +
                "cname='" + cname + '\'' +
                ", pid=" + pid +
                ", pname='" + pname + '\'' +
                ", marketPrice=" + marketPrice +
                ", shopPrice=" + shopPrice +
                ", pimage='" + pimage + '\'' +
                ", pdate=" + pdate +
                ", isHot=" + isHot +
                ", pdesc='" + pdesc + '\'' +
                ", pflag=" + pflag +
                ", cid='" + cid + '\'' +
                '}';
    }

    public Product() {
    }

    public Product(Long pid, String pname, Double marketPrice, Double shopPrice, String pimage, Date pdate, Integer isHot, String pdesc, Integer pflag, String cid, String cname) {
        this.cname = cname;
        this.pid = pid;
        this.pname = pname;
        this.marketPrice = marketPrice;
        this.shopPrice = shopPrice;
        this.pimage = pimage;
        this.pdate = pdate;
        this.isHot = isHot;
        this.pdesc = pdesc;
        this.pflag = pflag;
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.pid
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    private Long pid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.pname
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    private String pname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.market_price
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    private Double marketPrice;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.shop_price
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    private Double shopPrice;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.pimage
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    private String pimage;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.pdate
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date pdate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.is_hot
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    private Integer isHot;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.pdesc
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    private String pdesc;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.pflag
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    private Integer pflag;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.cid
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    private String cid;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.pid
     *
     * @return the value of product.pid
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public Long getPid() {
        return pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.pid
     *
     * @param pid the value for product.pid
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public void setPid(Long pid) {
        this.pid = pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.pname
     *
     * @return the value of product.pname
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public String getPname() {
        return pname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.pname
     *
     * @param pname the value for product.pname
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.market_price
     *
     * @return the value of product.market_price
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public Double getMarketPrice() {
        return marketPrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.market_price
     *
     * @param marketPrice the value for product.market_price
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public void setMarketPrice(Double marketPrice) {
        this.marketPrice = marketPrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.shop_price
     *
     * @return the value of product.shop_price
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public Double getShopPrice() {
        return shopPrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.shop_price
     *
     * @param shopPrice the value for product.shop_price
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public void setShopPrice(Double shopPrice) {
        this.shopPrice = shopPrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.pimage
     *
     * @return the value of product.pimage
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public String getPimage() {
        return pimage;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.pimage
     *
     * @param pimage the value for product.pimage
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public void setPimage(String pimage) {
        this.pimage = pimage == null ? null : pimage.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.pdate
     *
     * @return the value of product.pdate
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public Date getPdate() {
        return pdate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.pdate
     *
     * @param pdate the value for product.pdate
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.is_hot
     *
     * @return the value of product.is_hot
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public Integer getIsHot() {
        return isHot;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.is_hot
     *
     * @param isHot the value for product.is_hot
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.pdesc
     *
     * @return the value of product.pdesc
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public String getPdesc() {
        return pdesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.pdesc
     *
     * @param pdesc the value for product.pdesc
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public void setPdesc(String pdesc) {
        this.pdesc = pdesc == null ? null : pdesc.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.pflag
     *
     * @return the value of product.pflag
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public Integer getPflag() {
        return pflag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.pflag
     *
     * @param pflag the value for product.pflag
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public void setPflag(Integer pflag) {
        this.pflag = pflag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.cid
     *
     * @return the value of product.cid
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public String getCid() {
        return cid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.cid
     *
     * @param cid the value for product.cid
     *
     * @mbg.generated Mon Sep 17 23:02:05 CST 2019
     */
    public void setCid(String cid) {
        this.cid = cid == null ? null : cid.trim();
    }
}