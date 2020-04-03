package com.sapient.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sapient.entity.Login;
import com.sapient.entity.UserOrder;
import com.sapient.service.ICustomerTransactionService;

@Controller
public class CustomerTransactionController {

	private Logger logger = LoggerFactory.getLogger("sapestore");

	@Autowired
	ICustomerTransactionService ser;

	@RequestMapping("gettransactionhistory")
	public String getTransactionHistory(@RequestParam(value = "pgno", required = false) Integer pgno,
			HttpServletRequest req, Model model) {
		HttpSession sess = req.getSession(false);
		Login login = (Login) sess.getAttribute("login");
		List<UserOrder> lst = null;
		if (pgno == null)
			pgno = 1;
		if (login != null) {

			Long userId = login.getUser().getUserId();
			lst = ser.getOrders(userId);
			logger.debug("Inside get trans hist");
			model.addAttribute("customerorder", lst);
			model.addAttribute("customerorderlen", lst.size());
		} else {
			model.addAttribute("customerorderlen", 0);
		}
		return PrepareBookList(lst, model, pgno, "/sapestore/gettransactionhistory?");
	}

	public String PrepareBookList(List<UserOrder> lst, Model model, int pgno, String pgurl) {
		int end = pgno * 15;
		int start = end - 15;
		if (lst != null) {
			if (end >= lst.size())
				end = lst.size();

			int pgs = (int) Math.ceil(lst.size() / 15.0);
			List<UserOrder> sublist = lst.subList(start, end);
			/*
			 * lst.sort((e1,e2)->{ return
			 * ((Integer)e1.getEmpId()).compareTo(e2.getEmpId()); });
			 */
			model.addAttribute("currpg", pgno);
			model.addAttribute("totpgs", pgs);
			model.addAttribute("customerorder", sublist);
			model.addAttribute("pgurl", pgurl);
			List<Integer> plist = new ArrayList<>();
			for (int i = 1; i <= pgs; i++) {
				plist.add(i);
			}
			model.addAttribute("plist", plist);
		}
		return "customertransaction";
	}

}
