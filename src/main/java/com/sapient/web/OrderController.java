package com.sapient.web;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

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
import com.sapient.dao.IAdminOrderDao;
import com.sapient.dao.ICustomerOrderDao;
import com.sapient.dao.ITransactionHistoryDao;
import com.sapient.entity.BookRent;
import com.sapient.entity.OrderDetails;
import com.sapient.service.IEmailService;

@Controller
@PropertySource("classpath:sapestore.properties")
public class OrderController {

	private Logger logger = LoggerFactory.getLogger("sapestore");

	@Autowired
	private IAdminOrderDao adao;

	@Autowired
	private ICustomerOrderDao dao;
	
	@Autowired
	private ITransactionHistoryDao tdao;
	
	@Autowired
	DispatchDao ddao;

	@Autowired
	private IEmailService emailService;

	@Value("${lateFineMessage}")
	private String lateFineMessage;

	@Value("${lateFineMessage1}")
	private String lateFineMessage1;
	
	
	@RequestMapping("manageReports")
	public String getReports(Model model) {

		List<BookRent> deflist = new ArrayList<>(dao.getBookLateFeeNotPaid());
		
		List<BookRent> deflist2 = new ArrayList<>();
		Map<BookRent, Double> hm = new HashMap<BookRent, Double>();
		for (BookRent b : deflist) {
			long duration = b.getLastModifiedDate().getTime() - b.getReturnDate().getTime();
			long diffInDays = TimeUnit.MILLISECONDS.toDays(duration);
			if (diffInDays > TimeUnit.MILLISECONDS.toDays(0L)) {
				double latefine = diffInDays * b.getBook().getLateFees();
				hm.put(b, latefine);
				deflist2.add(b);
			}

		}
		
		List<OrderDetails> itemList = adao.getConfirmedOrderDetails();
 		
		model.addAttribute("itemlist", itemList);
 		model.addAttribute("flag","pur");
		model.addAttribute("defaulters", deflist2);
		model.addAttribute("defmap", hm);

		return "managereports";
	}
	

	@RequestMapping("sendemailtodefaulters")
	public String sendEmail(@RequestParam(value = "checkbox", required = false) String[] cbox, Model model) {
  		
		
		//sending mail to defaulters
		
		
		List<BookRent> deflist = new ArrayList<>(dao.getBookLateFeeNotPaid());
		List<BookRent> deflist2 = new ArrayList<>();
		Map<BookRent, Double> hm = new HashMap<BookRent, Double>();
		for (BookRent b : deflist) {
			long duration = b.getLastModifiedDate().getTime() - b.getReturnDate().getTime();
			long diffInDays = TimeUnit.MILLISECONDS.toDays(duration);
			if (diffInDays > TimeUnit.MILLISECONDS.toDays(0L)) {
				double latefine = diffInDays * b.getBook().getLateFees();
				hm.put(b, latefine);
				deflist2.add(b);
			}

		}
		List<OrderDetails> itemList = adao.getConfirmedOrderDetails();
 		model.addAttribute("itemlist", itemList);
		model.addAttribute("defmap", hm);

		
		
		
 		model.addAttribute("flag","def");
		if(cbox==null){
			
	
			return "managereports";
		}
		List<Long> chkbox = new ArrayList<Long>();
		logger.debug(cbox[0] + "");
		for (String string : cbox) {
			chkbox.add(Long.parseLong(string));
		}
		Collections.sort(chkbox);
	
		String subject = "Regarding Late Fee and Return Status";
 
		for (int i = 0, c = 0; c < deflist2.size() && i < chkbox.size(); c++) {

			logger.debug(((chkbox.get(i)).equals(deflist2.get(c).getBookRentId())) + "");

			if (chkbox.get(i).equals(deflist2.get(c).getBookRentId())) {
				if (!deflist2.get(c).isReturned()) {
					String[] params = { deflist2.get(c).getUser().getFirstName(),
							deflist2.get(c).getUser().getLastName(), deflist2.get(c).getBook().getBookTitle(),
							deflist2.get(c).getReturnDate().toString(), hm.get(deflist2.get(c)).toString() };
					
					emailService.sendMail(deflist2.get(c).getUser().getMail(), subject,
							MessageFormat.format(lateFineMessage, params));

				} else {
					String[] params = { deflist2.get(c).getUser().getFirstName(),
							deflist2.get(c).getUser().getLastName(), deflist2.get(c).getBook().getBookTitle(),
							deflist2.get(c).getLastModifiedDate().toString(), hm.get(deflist2.get(c)).toString() };
				
					emailService.sendMail(deflist2.get(c).getUser().getMail(), subject,
							MessageFormat.format(lateFineMessage1, params));

				}
				// Delete user from defaulter list
 				logger.debug("book deleted successfully from defList ");
				//hm.remove(deflist2.get(c));
 				ddao.setBookReturnedByBookRentId(deflist2.get(c).getBookRentId());
 				ddao.setLateFeeReceivedByBookRentId(deflist2.get(c).getBookRentId());

				i++;
				c = -1;
			}
			
		}
		

	deflist = new ArrayList<>(dao.getBookLateFeeNotPaid());
	 deflist2 = new ArrayList<>();
	 hm = new HashMap<BookRent, Double>();
		for (BookRent b : deflist) {
			long duration = b.getLastModifiedDate().getTime() - b.getReturnDate().getTime();
			long diffInDays = TimeUnit.MILLISECONDS.toDays(duration);
			if (diffInDays > TimeUnit.MILLISECONDS.toDays(0L)) {
				double latefine = diffInDays * b.getBook().getLateFees();
				hm.put(b, latefine);
				deflist2.add(b);
			}

		}
		itemList = adao.getConfirmedOrderDetails();
 		model.addAttribute("itemlist", itemList);
		model.addAttribute("defmap", hm);
		return "managereports";
	}

}
