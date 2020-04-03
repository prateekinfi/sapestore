package com.sapient.web;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sapient.dao.DispatchDao;
import com.sapient.dao.ICustomerOrderDao;
import com.sapient.dao.ITransactionHistoryDao;
import com.sapient.entity.BookRent;
import com.sapient.entity.UserOrder;
import com.sapient.service.IEmailService;

@Controller
@PropertySource("classpath:sapestore.properties")
public class AdminOrderController {

	private Logger logger = LoggerFactory.getLogger("sapestore");

	@Autowired
	private ICustomerOrderDao dao;

	@Autowired
	private DispatchDao adao;
	
	@Autowired
	private ITransactionHistoryDao tdao;

	@Autowired
	private IEmailService emailService;

	@Value("${dispatchMessage}")
	private String dispatchMessage;

	@RequestMapping("manageOrders")
	public String getOrders(@RequestParam(value="type",required=false) String type, @RequestParam(value="pgno",required=false) Integer pgno, Model model) {
		List<UserOrder> orderList = dao.getUserOrdersByStatus();
		List<BookRent> rentList = new ArrayList<>(dao.getBookLateFeeNotPaid());
		for (BookRent bookRent : rentList) {
			logger.debug(bookRent.getBookRentId()+"");
		}
		Map<BookRent, Double> lateFineMap = new TreeMap<BookRent, Double>();
		logger.debug("ooooooooo");
		
		for (BookRent b : rentList) {
			long duration = b.getLastModifiedDate().getTime() - b.getReturnDate().getTime();
			if(duration<0)
				duration = -duration;
			long diffInDays = TimeUnit.MILLISECONDS.toDays(duration);
			double latefine = 0.0;
			latefine = diffInDays*(b.getBook().getLateFees());
			lateFineMap.put(b,200.00);
			
			
		}
		Set<BookRent> keys=lateFineMap.keySet();
		for (BookRent bb : keys) {
			logger.debug(bb.getBookRentId()+" "+"b*"+lateFineMap.get(bb));
		}
		
		orderList = orderList.stream().sorted(Comparator.comparing(UserOrder::getOrderId).reversed())
				.collect(Collectors.toList());
		
		if (pgno == null || pgno==0)
			pgno = 1;
		
		if(type.equals("rented")){
			int endsize=10;
			if(endsize>orderList.size())
				endsize=orderList.size();
			List<UserOrder> sublist1 = orderList.subList(0, endsize);
			model.addAttribute("orderList", sublist1);
			Set<BookRent> bookRent=lateFineMap.keySet();
			List<BookRent> bookRentList=new ArrayList<>(bookRent);
			
			int end = pgno * 10;
			int start = end - 10;
			if (end >= bookRent.size())
				end = bookRent.size();

			int pgs = (int) Math.ceil(bookRent.size() / 10.0);
			Map<BookRent, Double> lateFineMap1=new TreeMap<>();
			List<BookRent> sublist = bookRentList.subList(start, end);
			for (BookRent bookRent2 : sublist) {
				//logger.debug(lateFineMap.get(bookRent2)+"");
				lateFineMap1.put(bookRent2, lateFineMap.get(bookRent2));
			}
			
			
			
			model.addAttribute("rentMap", lateFineMap);
			model.addAttribute("currpg2", pgno);
			model.addAttribute("totpgs2", pgs);
			model.addAttribute("currpg1", 1);
			model.addAttribute("totpgs1", (int) Math.ceil(orderList.size() / 10.0));
			model.addAttribute("tab", "r");
			
		}
		else if(type.equals("active")){
			Set<BookRent> bookRent=lateFineMap.keySet();
			List<BookRent> bookRentList=new ArrayList<>(bookRent);
			if(bookRentList.size()<10)
				model.addAttribute("rentMap", lateFineMap);
			else{
				Map<BookRent, Double> lateFineMap1=new TreeMap<>();
				for(int idx=0;idx<10;idx++){
					lateFineMap1.put(bookRentList.get(idx), lateFineMap.get(bookRentList.get(idx)));
				}
				model.addAttribute("rentMap", lateFineMap1);
			}
			
			
			
			
			int end = pgno * 10;
			int start = end - 10;
			if (end >= orderList.size())
				end = orderList.size();

			int pgs = (int) Math.ceil(orderList.size() / 10.0);
			List<UserOrder> sublist = orderList.subList(start, end);
			model.addAttribute("orderList", sublist);
			model.addAttribute("currpg1", pgno);
			model.addAttribute("totpgs1", pgs);
			model.addAttribute("currpg2", 1);
			model.addAttribute("totpgs2", (int) Math.ceil(bookRent.size() / 10.0));
			model.addAttribute("tab", "a");
		}
		else{
			model.addAttribute("rentMap", lateFineMap);
			model.addAttribute("orderList", orderList);
			model.addAttribute("tab", "a");
		}
		
		
		
		return "ManageOrder";
	}

	@RequestMapping(value = "dispatchList")
	public String processOrder(@RequestParam(value = "dlist", required = false) List<Long> dispatchList, Model model) {
		String subject = "SapeStore | Your Order has been Dispatched";
		if (dispatchList == null) {

			return getOrders("",0,model);
		}

		List<UserOrder> lst = new ArrayList<UserOrder>();

		for (Long s : dispatchList) {
			// set order status as dispatched
			adao.setDispatchByOrderId(s);

			//set due Date for Rented Books
			List<BookRent> rentList = adao.getRentByOrderId(s);
			for(BookRent br: rentList){
				logger.debug("setting return date for rentId"+br.getBookRentId());
				adao.setReturnDate(br.getBookRentId());				
			}
			
			//setting transaction history
			tdao.setStatusByOrderId(s, "dispatched");
			// getting userOrder from orderId
			lst.add(adao.getUserByOrderId(s));

		}

		for (UserOrder o : lst) {

			// EMAIL
			String[] params = { o.getUser().getFirstName(), o.getUser().getLastName(), o.getOrderId().toString(),
					o.getLastModifiedDate().toString() };

			emailService.sendMail(o.getUser().getMail(), subject, MessageFormat.format(dispatchMessage, params));

		}

		model.addAttribute("user", lst);

		return "dispatchSlip";
	}

	@RequestMapping(value = "paymentList")
	public String processPayments(@RequestParam(value = "plist", required = false) List<Long> payList, Model model) {

		if (payList == null) {
			return getOrders("",0,model);
		}
		for (Long s : payList) {
			adao.setPaymentReceivedByOrderId(s);
			tdao.setStatusByOrderId(s, "confirmed");
		}
		model.addAttribute("paymsg","Payment recieved for selected orders.");
		return getOrders("active",0,model);
	}

	@RequestMapping(value = "returnedList")
	public String processRentOrder(@RequestParam(value = "rlist", required = false) List<Long> rentList, Model model) {

		if (rentList == null) {

			return getOrders("",0,model);
		}
		for (Long s : rentList) {
			adao.setBookReturnedByBookRentId(s);

		}
		return getOrders("rented",0,model);
	}

	@RequestMapping(value = "lateFeeList")
	public String processLateFee(@RequestParam(value = "flist", required = false) List<Long> feeList, Model model) {

		if (feeList == null) {

			return getOrders("",0,model);
		}
		for (Long s : feeList) {
			adao.setLateFeeReceivedByBookRentId(s);

		}
		return getOrders("rented",0,model);
	}

}
