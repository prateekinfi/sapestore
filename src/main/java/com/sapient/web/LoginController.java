package com.sapient.web;

import java.security.NoSuchAlgorithmException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sapient.entity.Login;
import com.sapient.service.IEmailService;
import com.sapient.service.IHashService;
import com.sapient.service.ILoginService;
import com.sapient.service.IOtpService;

@Controller
@PropertySource("classpath:sapestore.properties")
public class LoginController {
	Logger logger = LoggerFactory.getLogger("sapestore");
	@Autowired
	private ILoginService loginService;
	@Autowired
	private IEmailService emailService;

	@Autowired
	private IOtpService otpService;
	@Autowired
	private IHashService hasher;

	@Value("${tokenTimeOut}")
	private Integer tokenTimeOut;

	@Autowired
	MainController maincontroler;

	@RequestMapping(value = "resetpassword")
	public String showResetForm(@RequestParam("mail") String mail, @RequestParam("tokenId") String tokenId,
			Model model) {
		logger.debug("inside reset password function");
		Login login = loginService.getLoginDetailsByMail(mail);
		boolean res = otpService.verifyToken(login, tokenId);
		if (res) {
			model.addAttribute("tokenVerified", true);

		} else
			model.addAttribute("tokenVerified", false);
		model.addAttribute("mail", mail);
		return "resetpassword";
	}

	@RequestMapping(value = "updatepassword", method = RequestMethod.POST)
	public String updatePassword(@RequestParam("userPassword") String userPassword, @RequestParam("mail") String mail,
			Model model) throws NoSuchAlgorithmException {
		Login login = loginService.getLoginDetailsByMail(mail);
		login.setUserPassword(hasher.generateHash(userPassword));
		loginService.addLoginDetails(login);
		return maincontroler.getMainpage(1, model);
	}
	// CHANGE USER PASSWORD-EDIT
	@RequestMapping(value="changepasswordedit", method = RequestMethod.POST)
	public String changePassword(@RequestParam("userPassword") String userPassword, @RequestParam("userName") String userName,Model model) throws NoSuchAlgorithmException{
        logger.debug("Inside final controller");
        logger.debug(userName);
		Login login = loginService.getLoginDetailsByUsername(userName);
        login.setUserPassword(hasher.generateHash(userPassword));
		loginService.addLoginDetails(login);
		return maincontroler.getMainpage(1, model);
	}
}
