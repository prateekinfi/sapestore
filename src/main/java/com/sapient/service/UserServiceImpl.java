package com.sapient.service;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sapient.dao.ILoginDao;
import com.sapient.dao.IUserDao;
import com.sapient.entity.City;
import com.sapient.entity.Country;
import com.sapient.entity.Login;
import com.sapient.entity.State;
import com.sapient.entity.UserOrder;
import com.sapient.entity.Users;

@Service
public class UserServiceImpl implements IUserService {
	private Logger logger = LoggerFactory.getLogger("sapestore");
	@Autowired
	@Qualifier("userdao")
	private IUserDao userdao;

	@Autowired
	@Qualifier("logindao")
	private ILoginDao logindao;

	@Autowired
	private IHashService hasher;

	@Override
	public List<Country> getListOfCountries() {
		return userdao.getCountries();
	}

	@Override
	public List<State> getListOfStates(Long countryId) {
		return userdao.getStates(countryId);
	}

	@Override
	public List<City> getListOfCities(Long stateId) {

		return userdao.getCities(stateId);
	}

	@Override
	public boolean checkUserMailExists(String mail) {

		return userdao.checkMailExists(mail);
	}

	@Override
	public Integer addNewUser(String userName, String firstName, String lastName, String userPassword, String mail,
			Boolean gender, String mobile, String addressLineOne, String addressLineTwo, Long countryId, Long stateId,
			Long cityId) throws NoSuchAlgorithmException {
		Users user = new Users();
		Integer res = setUserDetails(user, firstName, lastName, mail, gender, mobile, addressLineOne, addressLineTwo,
				countryId, stateId, cityId);
		if (res == 0) {
			return 0;
		}
		logger.debug(user.toString());
		Login login = new Login();
		res = setLoginDetails(user, login, userName, userPassword);
		if (res == 0) {
			userdao.removeUser(user.getUserId());
		}
		return res;
	}

	@Override
	public Integer updateUser(Long userId, Long loginId, String userName, String firstName, String lastName,
			String mail, Boolean gender, String mobile, String addressLineOne, String addressLineTwo, Long countryId,
			Long stateId, Long cityId) throws NoSuchAlgorithmException {
		Users user = new Users();
		user.setUserId(userId);
		Integer res = setUserDetails(user, firstName, lastName, mail, gender, mobile, addressLineOne, addressLineTwo,
				countryId, stateId, cityId);
		if (res == 0) {
			return 0;
		}
		logger.debug(user.toString());
		Login login = logindao.getLoginDetails(userName);
		login.setLoginId(loginId);
		res = updateLoginDetails(user, login, userName);
		logger.debug("After update login:{}", res);
		if (res == 0) {
			userdao.removeUser(user.getUserId());
		}
		return res;
	}

	public Integer setUserDetails(Users user, String firstName, String lastName, String mail, Boolean gender,
			String mobile, String addressLineOne, String addressLineTwo, Long countryId, Long stateId, Long cityId) {
		user.setAddressLine1(addressLineOne);
		user.setAddressLine2(addressLineTwo);
		user.setGender(gender);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setMail(mail);
		user.setMobile(mobile);
		City city = userdao.getCityById(cityId);
		user.setCity(city);
		State state = userdao.getStateById(stateId);
		user.setState(state);
		Country country = userdao.getCountryById(countryId);
		user.setCountry(country);
		user.setIsAdmin(false);
		return userdao.addUser(user);
	}

	public Integer setLoginDetails(Users user, Login login, String userName, String userPassword)
			throws NoSuchAlgorithmException {
		login.setUser(user);
		login.setUserName(userName);
		login.setUserPassword(hasher.generateHash(userPassword));
		login.setVerified(false);
		login.setIsActive(false);
		return logindao.addLoginDetails(login);
	}

	public Integer updateLoginDetails(Users user, Login login, String userName) throws NoSuchAlgorithmException {
		Login currlogin = logindao.getLoginDetails(userName);
		login.setUser(user);
		login.setUserName(userName);
		login.setUserPassword(currlogin.getUserPassword());
//		login.setVerified(false);
		login.setIsActive(false);
		return logindao.addLoginDetails(login);
	}

	@Override
	public City getCityById(Long cityId) {

		return userdao.getCityById(cityId);
	}

	@Override
	public State getStateById(Long stateId) {

		return userdao.getStateById(stateId);
	}

	@Override
	public Country getCountryById(Long countryId) {

		return userdao.getCountryById(countryId);
	}

	@Override
	public String getPostalCode(Long cityId) {

		return userdao.getPostalCode(cityId);
	}

	@Override
	public UserOrder odetails(Long orderId, Long userId) {
		// TODO Auto-generated method stub
		return userdao.odetails(orderId,userId);
	}

}
