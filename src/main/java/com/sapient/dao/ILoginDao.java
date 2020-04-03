package com.sapient.dao;

import com.sapient.entity.Login;

public interface ILoginDao {
	int addLoginDetails(Login login);
	Login getLoginDetails(String userName);
	boolean checkUserNameExists(String userName);
	Login getLoginDetailsByMail(String mail);
	Login getLoginDetailsByUsername(String userName);
	boolean checkPasswordExists(String userName, String password);
	Integer checkActiveUser(Long loginId);
	Integer checkActiveUser1(Long loginId);
}
