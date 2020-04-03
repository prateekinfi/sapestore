package com.sapient;

import javax.persistence.EntityManagerFactory;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class SapeStoreProjectApplication extends SpringBootServletInitializer{

	@Autowired
	private EntityManagerFactory emf;
	
	@Bean
	public SessionFactory getFactory(){
		return emf.unwrap(SessionFactory.class);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(SapeStoreProjectApplication.class, args);
		
	}
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application){
		return application.sources(SapeStoreProjectApplication.class);
	}  

}
