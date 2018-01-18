package com.zking.springboot_mtbatis;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.zking.springboot_mtbatis.dao")
public class SpringbootMtbatisApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootMtbatisApplication.class, args);
	}
}
