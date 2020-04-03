package com.sapient.service;

import com.sapient.entity.Login;

public interface ILoginService {
	Login getUserLoginDetails(String userName);
	boolean checkUserNameExists(String userName);
	Login getLoginDetailsByMail(String mail);
	int addLoginDetails(Login login);
	Login getLoginDetailsByUsername(String userName);
	boolean checkPasswordExists(String userName, String password);
}
