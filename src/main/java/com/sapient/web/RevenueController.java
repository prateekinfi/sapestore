package com.sapient.web;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sapient.dao.IAdminOrderDao;
import com.sapient.dao.ICustomerOrderDao;
import com.sapient.entity.BookRent;
import com.sapient.entity.OrderDetails;
 

@Controller
public class RevenueController {
	
	Logger logger = LoggerFactory.getLogger("sapestore");
	@Autowired
	private IAdminOrderDao adao;
	@Autowired
	ICustomerOrderDao revenueDao;
	@Autowired
	private ICustomerOrderDao dao;

	@RequestMapping(value="revenuereport", method = RequestMethod.POST)
	public String getRentedRevenue(@RequestParam("dateFrom") String dateFrom, @RequestParam("dateTo") String dateTo, 
			HttpServletRequest req, Model model	)throws NoSuchMethodException {
		
		logger.debug("In the controller");
		
		logger.debug("date to {}:",dateTo);
		logger.debug("date from {}:",dateFrom);
		Date dateF = null;
		Date dateT = null;		
		
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			dateF = formatter.parse(dateFrom);
			dateT = formatter.parse(dateTo);
			logger.debug(dateF+"");
			logger.debug(dateT+"");
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		if(dateF!=null && dateT!=null ){
			List<Float> purchasedRevenueList = revenueDao.getPurchasedRevenueOrderDetails(new java.sql.Date(dateF.getTime()), new java.sql.Date(dateT.getTime()));
			List<Float> rentRevenueList = revenueDao.getRentedRevenueOrderDetails(new java.sql.Date(dateF.getTime()), new java.sql.Date(dateT.getTime()));
			
		
			
			logger.debug(new java.sql.Date(dateF.getTime())+"");
			logger.debug(new java.sql.Date(dateT.getTime())+"");
			
			if(purchasedRevenueList!=null || rentRevenueList!=null){
				int rentSize;
				int purchaseSize;
				double rentTotalNumber=0;
				double purchasedTotalNumber=0;
				if(rentRevenueList!=null){
					rentSize = rentRevenueList.size();
					logger.debug("rent Size={}",rentSize);
					for (Float rentOrder : rentRevenueList) {
						rentTotalNumber+=rentOrder;
					}
				
				}
				else{
					rentSize=0;
				}
				if(purchasedRevenueList!=null){
				
				 purchaseSize = purchasedRevenueList.size();
				 logger.debug("purchase Size={}",purchaseSize );
				 for (Float purchasedOrder : purchasedRevenueList) {
						purchasedTotalNumber+=purchasedOrder;
					}
				}
				
				else{
					purchaseSize=0;
				}

				double revenueTotalNumber = rentTotalNumber + purchasedTotalNumber;
				
				
				BigDecimal totalRevenue = new BigDecimal(revenueTotalNumber);
				BigDecimal totalRent = new BigDecimal(rentTotalNumber);
				BigDecimal totalPurchase = new BigDecimal(purchasedTotalNumber);
				
				model.addAttribute("totalRentOrders", " "+ rentSize);
				model.addAttribute("totalPurchasedOrders", " "+ purchaseSize);
				model.addAttribute("totalRentRevenue", ""+ totalRent);
				model.addAttribute("totalPurchaseRevenue", " "+ totalPurchase);
				model.addAttribute("totalRevenue"," "+  totalRevenue);
				model.addAttribute("checkEntries", "DataPresent");
			}
			else{
				model.addAttribute("checkEntries", null);
				
			}
			model.addAttribute("flag","rev");
			
			List<BookRent> deflist = new ArrayList<>(dao.getBookRent());
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
			List<OrderDetails> itemList = adao.getAllOrderDetails();
	 		model.addAttribute("itemlist", itemList);
			model.addAttribute("defmap", hm);
			return "managereports";
		}
		model.addAttribute("flag","rev");
		List<BookRent> deflist = new ArrayList<>(dao.getBookRent());
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
		List<OrderDetails> itemList = adao.getAllOrderDetails();
 		model.addAttribute("itemlist", itemList);
		model.addAttribute("defmap", hm);
		return "managereports";
	}
	
	
}
