package com.dcy.pyshop.config;

import com.dcy.pyshop.interceptor.MyInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * <pre>
 *
 * </pre>
 *
 * @author 刘玉安<br>
 * <b>mail</b> liuyuan@syncsoft.com.cn<br>
 * <b>date</b> 2020/1/28 14:55:55<br>
 * @version 1.0.0
 * <pre>
 * 修改记录
 *  版本号    修订日期    修改人       bug编号     修改内容
 *  1.0.0     2020/1/28    刘玉安                   新建
 * </pre>
 */

@Configuration
public class AddInterceptor extends WebMvcConfigurerAdapter {

    public void addInterceptors(InterceptorRegistry registry){
//        super.addInterceptors(registry);
        registry.addInterceptor(new MyInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/user/login")
                .excludePathPatterns("/")
                .excludePathPatterns("/user/isLogin")
                .excludePathPatterns("/user/register")
                .excludePathPatterns("/admin/isLogin")
                .excludePathPatterns("/admin/login")
                .excludePathPatterns("/admin/dologin")
//                .excludePathPatterns("/admin/*")
                .excludePathPatterns("/user/index")
                .excludePathPatterns("/user/search")
                .excludePathPatterns("/user/checkUsername")
                .excludePathPatterns("/user/checkTelephone")
                .excludePathPatterns("/user/checkCode")
                .excludePathPatterns("/user/product_list")
                .excludePathPatterns("/user/product_info")
                .excludePathPatterns("/user/doregister")
                .excludePathPatterns("/user/findPassword")
                .excludePathPatterns("/user/updatePassword")
                .excludePathPatterns("/static/*")
                .excludePathPatterns("/**/fonts/*")
                .excludePathPatterns("/**/*.css")
                .excludePathPatterns("/**/*.js")
                .excludePathPatterns("/**/*.png")
                .excludePathPatterns("/**/*.gif")
                .excludePathPatterns("/**/*.jpg")
                .excludePathPatterns("/**/*.jpeg")
                .excludePathPatterns("/dologin2");
//        ;
    }
}