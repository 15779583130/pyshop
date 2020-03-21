package com.dcy.pyshop;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.dcy.pyshop.dao")
public class PyShopApplication {

    public static void main(String[] args) {
        SpringApplication.run(PyShopApplication.class, args);
    }

}
