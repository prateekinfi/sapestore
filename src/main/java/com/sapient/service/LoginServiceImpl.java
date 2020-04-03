package com.sapient.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sapient.dao.ILoginDao;
import com.sapient.entity.Login;

@Service
public class LoginServiceImpl implements ILoginService {

	private Logger logger = LoggerFactory.getLogger("sapestore");
	@Autowired
	@Qualifier("logindao")
	private ILoginDao logindao;
	@Override
	public Login getUserLoginDetails(String userName) {
		logger.debug("Inside get User Details by userName");
		return logindao.getLoginDetails(userName);
	}
	@Override
	public boolean checkUserNameExists(String userName) {
		logger.debug("Inside check Username Exists");
		return logindao.checkUserNameExists(userName);
	}
	@Override
	public Login getLoginDetailsByMail(String mail) {
		return logindao.getLoginDetailsByMail(mail);
	}
	@Override
	public int addLoginDetails(Login login) {
		return logindao.addLoginDetails(login);
	}
	@Override
	public Login getLoginDetailsByUsername(String userName) {
		return logindao.getLoginDetailsByUsername(userName);
	}
	@Override
	public boolean checkPasswordExists(String userName, String password) {
		logger.debug("Inside check Password Exists");
		return logindao.checkPasswordExists(userName, password);
	}

}
