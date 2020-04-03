package com.sapient.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sapient.dao.IDao;


@Controller
public class TestController {

	private Logger logger=LoggerFactory.getLogger("bookstore");

	@Autowired
	private IDao dao;

	@RequestMapping("con")
	public String privacyPolicy(Model model){
		return "homeadmin";
	}
	
	@RequestMapping("p")
	public String contactUs(Model model){
		return "privacyPolicy";
	}
}
