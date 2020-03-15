package com.dcy.pyshop.entity;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    public Map<Long, CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(Map<Long, CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    private Map<Long,CartItem> cartItems=new HashMap<Long, CartItem>();
    private double total;


}
