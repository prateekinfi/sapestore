package com.sapient.web;

import java.security.NoSuchAlgorithmException;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sapient.dao.ICartDao;
import com.sapient.dao.IDao;
import com.sapient.dao.ILoginDao;
import com.sapient.entity.Book;
import com.sapient.entity.Category;
import com.sapient.entity.Login;
import com.sapient.entity.Users;
import com.sapient.service.IEmailService;
import com.sapient.service.ILoginService;
import com.sapient.service.IOtpService;
import com.sapient.service.IUserService;

@Controller
@PropertySource("classpath:sapestore.properties")
public class UserController {
	private Logger logger = LoggerFactory.getLogger("sapestore");

	@Autowired
	private IUserService userService;

	@Autowired
	private ILoginService loginService;

	@Autowired
	IDao dao;

	@Autowired
	ILoginDao logindao;
	
	@Autowired
	MainController maincontroler;

	@Value("${tokenTimeOut}")
	private Integer tokenTimeOut;

	@Value("${cnfrmregmsg}")
	private String cnfrmregmsg;

	@Value("${registerationSubject}")
	private String registerationSubject;

	@Value("${registerationMessage}")
	private String registerationMessage;

	@Value("${domain}")
	private String domain;

	@Value("${regards}")
	private String regards;

	@Value("${emailVerifiedMessage}")
	private String emailVerifiedMessage;

	@Value("${emailVerificationFailMessage}")
	private String emailVerificationFailMessage;

	@Autowired
	private IEmailService emailService;

	@Autowired
	private ICartDao cartDao;

	@Autowired
	private IOtpService otpService;

	@RequestMapping(value = "register")
	public String showRegisterFrm(HttpServletRequest request, Model model) {
		HttpSession sess = request.getSession(false);
		if (sess != null)
			sess.invalidate();
		model.addAttribute("userbean", new Users());
		model.addAttribute("countries", userService.getListOfCountries());
		getCategories(model);
		return "registerfrm";
	}

	@RequestMapping(value = "getregister")
	public String getRegistered(@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
			@RequestParam("userName") String userName, @RequestParam("userPassword") String userPassword,
			@RequestParam("mail") String mail, @RequestParam("gender") Boolean gender,
			@RequestParam("mobile") String mobile, @RequestParam("addressLine1") String addressLineOne,
			@RequestParam("addressLine2") String addressLineTwo, @RequestParam("country") Long countryId,
			@RequestParam("state") Long stateId, @RequestParam("city") Long cityId, Model model)
			throws NoSuchAlgorithmException {
		logger.debug("Inside register user");
		int res = userService.addNewUser(userName.trim(), firstName.trim(), lastName.trim(), userPassword.trim(),
				mail.trim(), gender, mobile.trim(), addressLineOne.trim(), addressLineTwo.trim(), countryId, stateId,
				cityId);
		if (res != 0)
			logger.debug("User added to database");

		/*
		 * Login login = loginService.getLoginDetailsByMail(mail); String
		 * tokenId = otpService.generateToken(); login.setTokenId(tokenId);
		 * login.setTokenGeneratedDate(new Date());
		 * loginService.addLoginDetails(login); String link =
		 * domain+"verifymail?mail="+mail+"&tokenId="+tokenId;
		 * logger.debug(registerationMessage+link); emailService.sendMail(mail,
		 * registerationSubject, registerationMessage+link+regards);
		 */
		model.addAttribute("cnfrmregmsg", cnfrmregmsg);
		return maincontroler.getMainpage(1, model);
	}

	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request, Model model) {
		HttpSession sess = request.getSession(false);
		Set<Book> book = null;
		Login login=(Login) sess.getAttribute("login");
		if (sess != null){
			book = (Set<Book>) sess.getAttribute("cartitems");
			Map<String, Integer> purchaseMap = (Map<String, Integer>) sess.getAttribute("purchaseMap");
			Map<String, Integer> quantityMap = (Map<String, Integer>) sess.getAttribute("quantityMap");

			if (book != null) {
				cartDao.insert(book, quantityMap, purchaseMap, request);
			}
			if(login!=null)
			logindao.checkActiveUser1(login.getLoginId());
			sess.invalidate();
		}
		return maincontroler.getMainpage(1, model);
	}

	@RequestMapping(value = "editprofile")
	public String editProfile() {
		return "editfrm";

	}

	@RequestMapping(value = "updateprofile")
	public String updateProfile(@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
			@RequestParam("mobile") String mobile, @RequestParam("addressLine1") String addressLineOne,
			@RequestParam("addressLine2") String addressLineTwo, @RequestParam("country") Long countryId,
			@RequestParam("state") Long stateId, @RequestParam("city") Long cityId, HttpServletRequest req, Model model)
			throws NoSuchAlgorithmException {
		logger.debug("Inside update user");
		HttpSession session = req.getSession(false);
		Login login = (Login) session.getAttribute("login");
		int res = userService.updateUser(login.getUser().getUserId(), login.getLoginId(), login.getUserName(),
				firstName.trim(), lastName.trim(), login.getUser().getMail(), login.getUser().getGender(),
				mobile.trim(), addressLineOne.trim(), addressLineTwo.trim(), countryId, stateId, cityId);
		session.setAttribute("login", loginService.getUserLoginDetails(login.getUserName()));
		if (res != 0)
			logger.debug("User added to database");
		return "editfrm";
	}

	public void getCategories(Model model) {
		List<Category> catlist = dao.getCategories();
		model.addAttribute("catlist", catlist);
	}

	@RequestMapping(value = "verifymail")
	public String verifyMail(@RequestParam("mail") String mail, @RequestParam("tokenId") String tokenId,
			HttpServletRequest request, Model model) {
		Login login = loginService.getLoginDetailsByMail(mail);
		boolean res = otpService.verifyToken(login, tokenId);
		if (res) {
			login.setVerified(true);
			loginService.addLoginDetails(login);
			HttpSession sess = request.getSession(false);
			sess.setAttribute("login", login);
			model.addAttribute("emailVerifiedMessage", emailVerifiedMessage);
		} else
			model.addAttribute("emailVerificationFailMessage", emailVerificationFailMessage);
		logger.debug("inside vierify email");
		return maincontroler.getMainpage(1, model);
	}

	@RequestMapping(value = "ordertrack")
	public String Ordertrack(Model model) {
		getCategories(model);
		return "orderTracking";
	}

	// CHANGE USER PASSWORD
	@RequestMapping(value = "changepassword")
	public String showResetForm(HttpServletRequest request, Model model) {
		logger.debug("inside change password function");
		HttpSession sess = request.getSession(false);
		Login login = (Login) sess.getAttribute("login");
		if (login != null) {
			model.addAttribute("tokenVerified", true);
			return "resetpassword";
		} else {
			return maincontroler.getMainpage(1, model);
		}

	}
}
