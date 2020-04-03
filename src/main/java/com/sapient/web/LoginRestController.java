package com.sapient.web;

import java.security.NoSuchAlgorithmException;
import java.text.MessageFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sapient.dao.ICartDao;
import com.sapient.dao.IDao;
import com.sapient.dao.ILoginDao;
import com.sapient.entity.Book;
import com.sapient.entity.CartDetails;
import com.sapient.entity.City;
import com.sapient.entity.Login;
import com.sapient.entity.State;
import com.sapient.entity.UserCart;
import com.sapient.service.IEmailService;
import com.sapient.service.IHashService;
import com.sapient.service.ILoginService;
import com.sapient.service.IOtpService;
import com.sapient.service.IUserService;

@RestController
@PropertySource("classpath:sapestore.properties")
public class LoginRestController {

	Logger logger = LoggerFactory.getLogger("sapestore");
	@Autowired
	private ILoginService loginService;
	@Autowired
	private IUserService userService;
	@Autowired
	private IEmailService emailService;
	@Autowired
	private ICartDao cartdao;
	
	
	@Autowired
	private IDao dao;
	
	@Autowired
	private IHashService hasher;

	@Autowired
	private IOtpService otpService;
	
	@Value("${forgetPasswordSubject}")
	private String forgetPasswordSubject;
	
	@Value("${forgetPasswordMessage}")
	private String forgetPasswordMessage;
	
	@Value("${registerationSubject}")
	private String  registerationSubject;
	
	@Value("${registerationMessage}")
	private String  registerationMessage;
	
	
	@Value("${domain}")
	private String domain;
	
	@Value("${regards}")
	private String regards;

	
	@Autowired
	ICartDao dao1;
	
	@Autowired
	ILoginDao logindao;
	
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String doLogin(@RequestParam("userName") String userName, @RequestParam("userPassword") String userPassword,
			HttpServletRequest req) throws NoSuchAlgorithmException {
		logger.debug(userName);
		Login login = loginService.getUserLoginDetails(userName.trim());
		logger.debug(hasher.generateHash(userPassword));
//		logger.debug(login.getUserPassword());
		if (!(login == null) && (login.getUserPassword().equals(hasher.generateHash(userPassword)))) {

			if(login.getIsActive()== true){
					return "invalid1";
			}
				
				logindao.checkActiveUser(login.getLoginId());
			
			HttpSession sess = req.getSession();
			UserCart userCart=cartdao.getCart(login.getUser().getUserId());
			if(userCart==null){
				dao1.generateCartId(login.getUser().getUserId());
			}
			Set<Book> book=new HashSet<>();
			Map<String,Integer> purchaseMap=new HashMap<>();
			Map<String,Integer> quantityMap= new HashMap<>();
			if(userCart!=null && userCart.getCartDetails()!=null){
				for (CartDetails cartDetails : userCart.getCartDetails()) {
					
					purchaseMap.put(cartDetails.getIsbn(), cartDetails.getPurchaseType());
					quantityMap.put(cartDetails.getIsbn(), cartDetails.getQuantity());
					book.add(dao.getBook(cartDetails.getIsbn()));
				}
			}
			
			sess.setAttribute("cartitems",book);
			sess.setAttribute("login", loginService.getUserLoginDetails(userName));
			sess.setAttribute("purchaseMap", purchaseMap);
			sess.setAttribute("quantityMap", quantityMap);
			return "success";
		}
		return "invalid";
	}

	@RequestMapping(value = "checkemail1")
	public String verifyEmail1(@RequestParam("email") String email) {
		boolean mail = userService.checkUserMailExists(email);
		if (mail) {
			return "success";
		}
		else{
			return "invalid";
		}
	}
	
	
	@RequestMapping(value = "checkemail")
	public String verifyEmail(@RequestParam("email") String email) {
		logger.debug(email);
		boolean mail = userService.checkUserMailExists(email);
		if (mail) {
			String tokenId= setNewToken(email);
			logger.debug(email);
			String link = domain+"resetpassword?mail="+email+"&tokenId="+tokenId;
			Login login = loginService.getLoginDetailsByMail(email);
			String values[]={login.getUserName(),link};
			logger.debug(forgetPasswordMessage);
//			forgetPasswordMessage=MessageFormat.format(forgetPasswordMessage,values);
			emailService.sendMail(email, forgetPasswordSubject, MessageFormat.format(forgetPasswordMessage,values));
			return "success";
		} else {
			return "invalid";
		}

	}
	
	public String setNewToken(String email){
		Login login = loginService.getLoginDetailsByMail(email);
//		logger.debug(arg0);
		logger.debug(email);
		String tokenId = otpService.generateToken();
		login.setTokenId(tokenId);
		login.setTokenGeneratedDate(new Date());
		loginService.addLoginDetails(login);
		return tokenId;
		
	}

	@RequestMapping(value = "checkusername")
	public String verifyUserName(@RequestParam("username") String userName) {

		boolean check = loginService.checkUserNameExists(userName);
		if (check)
		{
			logger.debug("success!");
			return "success";
		}
			else
			{
				logger.debug("invalid!");
			return "invalid";
			}
	}
	
	@RequestMapping(value = "checkuserpassword")
	public String verifyUserPassword(@RequestParam("uname") String userName, @RequestParam("pass")String password) throws NoSuchAlgorithmException {
		
		logger.debug("Inside check old user password controller");
		logger.debug(password);
		boolean check = loginService.checkPasswordExists(userName, hasher.generateHash(password));
		if (check)
		{
			logger.debug("Password matched!");
			return "success";
		}
		else
		{
			logger.debug("Password NOT matched!");
			return "invalid";
		}
	} 
	@RequestMapping(value = "getstates")
	public List<State> getStates(@RequestParam("countryid") Long countryId) {
		if(countryId==null)
			return null;
		List<State> lst = userService.getListOfStates(countryId);
		logger.debug(lst.get(0).getStateName() + " inside controller");

		return lst;

	}

	@RequestMapping(value = "getcities")
	public List<City> getCities(@RequestParam("stateid") Long stateId) {
		if(stateId==null){
			return null;
		}
		List<City> lst = userService.getListOfCities(stateId);
		logger.debug(lst.get(0).getCityName() + " inside controller");

		return lst;

	}
	
	
	@RequestMapping(value="getpostal")
	public String getPostal(@RequestParam("cityid")Long cityId){
		if(cityId==null){
			return null;
		}
		return userService.getPostalCode(cityId);
	}
	
	@RequestMapping(value="sendverificationmail")
	public void sendVerificationMail(@RequestParam("email") String email){
		String tokenId = setNewToken(email);
		String link = domain+"verifymail?mail="+email+"&tokenId="+tokenId;
		Login login = loginService.getLoginDetailsByMail(email);
		String values[]={login.getUserName(),link};
//		registerationMessage=MessageFormat.format(registerationMessage,values);
//		logger.debug(registerationMessage+link);
		emailService.sendMail(email, registerationSubject, MessageFormat.format(registerationMessage,values));
	}
}
