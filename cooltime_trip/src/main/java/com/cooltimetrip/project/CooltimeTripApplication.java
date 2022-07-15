package com.cooltimetrip.project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.cooltimetrip.project"})
@MapperScan(basePackages = {"com.cooltimetrip.project"})
public class CooltimeTripApplication {

	public static void main(String[] args) {
		SpringApplication.run(CooltimeTripApplication.class, args);
	}

}
