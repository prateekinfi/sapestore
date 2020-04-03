package com.sapient.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sapient.dao.ITransactionHistoryDao;
import com.sapient.entity.Login;
import com.sapient.entity.TransactionHistory;
import com.sapient.entity.UserOrder;
import com.sapient.service.IUserService;

@RestController
public class UserRestController {
	private Logger logger = LoggerFactory.getLogger("sapestore");
	@Autowired
	private IUserService userService;
	
	@Autowired
	private ITransactionHistoryDao transactionDao;
	
	@RequestMapping(value = "trackorder")
	public List<TransactionHistory> getOrdertrack(@RequestParam("orderid") Long orderId, HttpServletRequest req, Model model) {
		HttpSession sess = req.getSession(false);
		Login login =(Login) sess.getAttribute("login");
		logger.debug("inside order tracking");
		if(orderId!=-1){
			UserOrder userorder=userService.odetails(orderId,login.getUser().getUserId());
			if (userorder == null) {
				return null;
			} else {
				return transactionDao.getTransactionHistory(orderId);
			}
		}
		else
			return null;
	}
}
