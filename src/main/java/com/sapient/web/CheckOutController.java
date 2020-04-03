package com.sapient.web;

import java.text.MessageFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sapient.dao.ICheckOutDao;
import com.sapient.dao.IDao;
import com.sapient.dao.IInventoryDao;
import com.sapient.dao.IShippingDao;
import com.sapient.dao.ITransactionHistoryDao;
import com.sapient.dao.IUserDao;
import com.sapient.entity.Book;
import com.sapient.entity.BookRent;
import com.sapient.entity.Login;
import com.sapient.entity.ShippingAddress;
import com.sapient.entity.UserOrder;
import com.sapient.service.IEmailService;
import com.sapient.service.IUserService;

@Controller
public class CheckOutController {

	private Logger logger = LoggerFactory.getLogger("sapestore");
	
	@Autowired
	IDao dao;
	
	@Autowired
	IInventoryDao inventorydao;
	
	@Autowired
	ICheckOutDao checkoutdao;
	
	@Autowired
	IUserDao dao1;
	
	@Autowired
	IShippingDao shippingdao;
	
	@Autowired
	IUserService userService;
	
	@Autowired
	private IEmailService emailService;

	@Value("${orderSummaryMessage}")
	private String orderSummaryMessage;
	
	@Autowired
	private ITransactionHistoryDao tdao;
	

	@RequestMapping("addaddress")
	public String getAddress(Model model){
		model.addAttribute("countries", userService.getListOfCountries());
		return "ShippingAddress";
	} 

	@RequestMapping("cartcheckout")
	public String cartToOrder(Model model, HttpServletRequest req){
		Map<Long, String> address = new HashMap<>();
		HttpSession session = req.getSession(false);
		Login login = (Login) session.getAttribute("login");
		String address1 = login.getUser().getAddressLine1();
		if(login.getUser().getAddressLine2() != null && !login.getUser().getAddressLine2().equals(""))
			address1 += ", "+login.getUser().getAddressLine2()+"<br>";
		else
			address1 +="<br>";
		address1 += login.getUser().getCity().getCityName() + ", " + login.getUser().getState().getStateName() + ",<br>"
				+ login.getUser().getCountry().getCountryName() + ", pincode : "+login.getUser().getCity().getPostalCode()+"<br>";
		
		model.addAttribute("home", address1);
		
		List<ShippingAddress> shippingAddress = checkoutdao.getShippingAddress(login.getUser().getUserId());
		if(shippingAddress != null){
			shippingAddress =  shippingAddress.stream().sorted(Comparator.comparing(ShippingAddress::getShippingId)).collect(Collectors.toList());
		}
		
		for (ShippingAddress shippingAddress2 : shippingAddress) {
			
			String address12 = shippingAddress2.getAddressLine1();
			if(!shippingAddress2.getAddressLine2().equals("") && shippingAddress2.getAddressLine2()!=null)
				address12 += ", "+shippingAddress2.getAddressLine2()+"<br>";
			else
				address12 +="<br>";
			address12 += shippingAddress2.getCity().getCityName() + ", " + shippingAddress2.getState().getStateName() + ",<br>"
					+ shippingAddress2.getCountry().getCountryName() + ", pincode : "+shippingAddress2.getCity().getPostalCode()+"<br>";
			address.put(shippingAddress2.getShippingId(),address12);
		}
		model.addAttribute("shipping",address);
		model.addAttribute("number", shippingAddress.size());
		return "selectaddress";
	}
	
	@RequestMapping("ordershippingaddresssubmit")
	public String orderShippingAddressSubmit(@RequestParam("addr") Long shippingId, HttpServletRequest req){
		HttpSession session = req.getSession(false);
		Login login = (Login) session.getAttribute("login");
		Map<String,Integer> quantity = (Map<String, Integer>) session.getAttribute("quantityMap");
		Map<String,Integer> purchase = (Map<String, Integer>) session.getAttribute("purchaseMap");
		Set<String> isbn = quantity.keySet();
		float sum=0f;
		for (String string1 : isbn) {
			Double price=0.0;
			if(purchase.get(string1).equals(0))
				price = dao.getBook(string1).getRentPrice();
			else
				price = dao.getBook(string1).getSellPrice();
			sum+=(quantity.get(string1)*price);
		}
		checkoutdao.insertOrder(sum, login.getUser().getUserId(), shippingId);
		
		UserOrder order = checkoutdao.getOrderId(login.getUser().getUserId());
		Set<Book> book1 = (Set<Book>) session.getAttribute("cartitems");
		List<Book> book=new ArrayList<>(book1);
		checkoutdao.insertOrderDetails(order, book, quantity, purchase);
		for (String string1 : isbn) {
			if(purchase.get(string1).equals(0)){
				BookRent br = new BookRent();
				br.setReturned(false);
				Date date = java.sql.Date.valueOf(LocalDate.now().plusDays(30));
				br.setReturnDate(date);
				br.setUser(login.getUser());
				br.setBook(dao.getBook(string1));
				br.setUserOrder(checkoutdao.getOrderId(login.getUser().getUserId()));
				checkoutdao.insertBookRent(br);
			}
			
		}
		checkoutdao.deleteCart(login.getUser().getUserId());
		
		//		Sending Email to User with order summary
		String body="";

		body+="<tr><th>ISBN</th><th>BOOK TITLE</th><th>QUANTITY</th><th>PRICE</th><th>SUB TOTAL</th>" ;

		for(Book b:book){
			Double price;
			if(purchase.get(b.getIsbn()).equals(0))
				price = dao.getBook(b.getIsbn()).getRentPrice();
			else
				price = dao.getBook(b.getIsbn()).getSellPrice();
			body+="<tr><td>"+b.getIsbn() +"</td>"+"<td>"+ b.getBookTitle()+"</td>"+
					"<td>"+ quantity.get(b.getIsbn())+"</td>"+"<td>"+ price+"</td>"+
					"<td>"+ (quantity.get(b.getIsbn())*price)+"</td></tr>";
		}
		body+="<tr><td colspan='5'>Total Bill = $ "+sum+"</td>";
		String params[]={login.getUser().getFirstName(),login.getUser().getLastName(),body};
		emailService.sendMail(login.getUser().getMail(),"SapeStore | Your Order Summary",
				MessageFormat.format(orderSummaryMessage, params));
		
		
		//Setting transaction history
		tdao.setStatusByOrderId(checkoutdao.getOrderId(login.getUser().getUserId()).getOrderId(), "pending");
		
		for (Book book2 : book) {
			inventorydao.updateQuantity(book2, quantity.get(book2.getIsbn()), purchase.get(book2.getIsbn()));
		}
		if(shippingId == -1){
			ShippingAddress sa = new ShippingAddress();
			sa.setAddressLine1(login.getUser().getAddressLine1());
			sa.setAddressLine2(login.getUser().getAddressLine2());
			sa.setCity(login.getUser().getCity());
			sa.setState(login.getUser().getState());
			sa.setCountry(login.getUser().getCountry());
			sa.setPostalCode(login.getUser().getCity().getPostalCode());
			session.setAttribute("shipaddress", sa);
		}else{
			session.setAttribute("shipaddress", dao1.getAddressById(shippingId));
		}
		session.setAttribute("cart2", session.getAttribute("cartitems"));
		session.setAttribute("cartitems",new HashSet<Book>());
		session.setAttribute("quantityMap", new HashMap<>());
		session.setAttribute("purchaseMap", new HashMap<>());
		session.setAttribute("order",checkoutdao.getOrderId(login.getUser().getUserId()) );
		return "OrderConfirm";
	}
	
	@RequestMapping("removeaddress")
	public String removeAddress(@RequestParam("addr") Long shippingId, HttpServletRequest req,Model model){
		int check=checkoutdao.removeShipping(shippingId);
		if(check==0){
			model.addAttribute("home1", "yes");
		}
		else{
			model.addAttribute("home1", "no");
		}
		return cartToOrder(model, req);
	}
	
	@RequestMapping("submitaddress")
	public String submitAddress(@RequestParam("mobile") String mobile, @RequestParam("addressLine1") String addressLine1, 
			@RequestParam(value="addressLine2", required=false) String addressLine2, @RequestParam("country") Long countryId ,
			@RequestParam("state") Long stateId, @RequestParam("city") Long cityId, HttpServletRequest req,Model model){
		logger.debug("inside add shipping address");
		HttpSession sess = req.getSession(false);
		Login login = (Login) sess.getAttribute("login");
		ShippingAddress shippingAddress = new ShippingAddress();
		shippingAddress.setUser(login.getUser());
		
		
		
		
		
		UserOrder userOrder = checkoutdao.getOrderId(login.getUser().getUserId());
		
		shippingAddress.setUserOrder(userOrder);
		shippingAddress.setMail(login.getUser().getMail());
		shippingAddress.setAddressLine1(addressLine1);
		if(addressLine2!="" || addressLine2!=null)
		shippingAddress.setAddressLine2(addressLine2);
		shippingAddress.setCity(dao1.getCityById(cityId));
		shippingAddress.setState(dao1.getStateById(stateId));
		shippingAddress.setCountry(dao1.getCountryById(countryId));
		shippingAddress.setPostalCode(dao1.getPostalCode(cityId));
		
		logger.debug(shippingAddress.getAddressLine1());
		
		shippingdao.addAddress(shippingAddress);
		
		return cartToOrder(model, req);
	}
}
