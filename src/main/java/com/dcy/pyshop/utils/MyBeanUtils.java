package com.dcy.pyshop.utils;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.ConvertUtilsBean;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.beanutils.PropertyUtilsBean;

import java.lang.reflect.InvocationTargetException;
import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

public class MyBeanUtils implements Converter {
    private static final String DATE = "yyyy-MM-dd";
    private static final String DATETIME = "yyyy-MM-dd HH:mm:ss";
    private static final String TIMESTAMP = "yyyy-MM-dd HH:mm:ss.SSS";

    @Override
    public Object convert(Class type, Object value) {
        // TODO Auto-generated method stub
        return toDate(type, value);
    }

    public static Object toDate(Class type, Object value) {
        if (value == null || "".equals(value))
            return null;
        if (value instanceof String) {
            String dateValue = value.toString().trim();
            int length = dateValue.length();
            if (type.equals(Date.class)) {
                try {
                    DateFormat formatter = null;
                    if (length <= 10) {
                        formatter = new SimpleDateFormat(DATE, new DateFormatSymbols(Locale.CHINA));
                        return formatter.parse(dateValue);
                    }
                    if (length <= 19) {
                        formatter = new SimpleDateFormat(DATETIME, new DateFormatSymbols(Locale.CHINA));
                        return formatter.parse(dateValue);
                    }
                    if (length <= 23) {
                        formatter = new SimpleDateFormat(TIMESTAMP, new DateFormatSymbols(Locale.CHINA));
                        return formatter.parse(dateValue);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return value;
    }
    public static void populate(Object obj, Map<String,String[]> map) {

        MyBeanUtils dtConverter = new MyBeanUtils();
        ConvertUtilsBean convertUtilsBean = new ConvertUtilsBean();
        convertUtilsBean.deregister(Date.class);
        convertUtilsBean.register(dtConverter, Date.class);
        BeanUtilsBean beanUtilsBean = new BeanUtilsBean(convertUtilsBean,
                new PropertyUtilsBean());
        try {
            beanUtilsBean.populate(obj, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

    }
}
