package com.dcy.pyshop.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class IdUtils {
    public static String createId(Long uid){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
        String tm = sdf.format(new Date());
        int i = UUID.randomUUID().hashCode();
        if(i<0){
            i=-i;
        }
        return tm+uid+i;
    }

    public static String createId(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
        String tm = sdf.format(new Date());
        int i = UUID.randomUUID().hashCode();
        if(i<0){
            i=-i;
        }
        return tm+i;
    }
}
