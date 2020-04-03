package com.sapient.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sapient.dao.ISubscriptionDao;

@RestController
public class SubscriberRestController {
	
	@Autowired
	private ISubscriptionDao Subscribe;

	private Logger logger=LoggerFactory.getLogger("sapestore");
	
	@RequestMapping(value="addSubscription")
	public String addSubscriber(@RequestParam(value="isbn") String isbn, @RequestParam(value="userId") Long userId, Model model){
		
		logger.debug("In Subscriber rest controller");
		Boolean check= Subscribe.checkSubscriber(userId, isbn);
		if(check==false){
			logger.debug("Adding the user as Subscriber");
			Subscribe.addSubscriber(userId, isbn);
			return "success";
		}
		else{
			logger.debug("user exists");
			return "invalid";
		}
		
	}
	
}
