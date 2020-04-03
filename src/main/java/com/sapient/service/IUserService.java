package com.sapient.service;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.sapient.entity.City;
import com.sapient.entity.Country;
import com.sapient.entity.State;
import com.sapient.entity.TransactionHistory;
import com.sapient.entity.UserOrder;
import com.sapient.entity.Users;

public interface IUserService {

	
	List<Country> getListOfCountries();

	List<State> getListOfStates(Long countryId);

	List<City> getListOfCities(Long stateId);
	boolean checkUserMailExists(String mail);

    Integer addNewUser(String userName, String firstName, String lastName, String userPassword, String mail,
			Boolean gender, String mobile, String addressLineOne, String addressLineTwo, Long countryId, Long stateId,
			Long cityId) throws NoSuchAlgorithmException;
     Integer updateUser(Long userId, Long loginId,String userName, String firstName, String lastName, String mail,
 			Boolean gender, String mobile, String addressLineOne, String addressLineTwo, Long countryId, Long stateId,
 			Long cityId) throws NoSuchAlgorithmException;
     City getCityById(Long cityId);
 	 State getStateById(Long stateId);
 	 Country getCountryById(Long countryId);
 	 String getPostalCode(Long cityId);
 	 UserOrder odetails(Long orderId,Long userId);
}
