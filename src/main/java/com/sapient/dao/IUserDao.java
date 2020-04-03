package com.sapient.dao;

import java.util.List;
import java.util.Set;

import com.sapient.entity.City;
import com.sapient.entity.Country;
import com.sapient.entity.ShippingAddress;
import com.sapient.entity.State;
import com.sapient.entity.UserOrder;
import com.sapient.entity.Users;

public interface IUserDao {
	int addUser(Users user);
	int removeUser(Long userId);
	List<Country> getCountries();
	List<State> getStates(Long countryId);
	List<City> getCities(Long stateId);
	boolean checkMailExists(String mail);
	City getCityById(Long cityId);
	State getStateById(Long stateId);
	Country getCountryById(Long countryId);
	String getPostalCode(Long cityId);
	Users getUserById(Long userId);
	ShippingAddress getAddressById(Long shippingId);
	UserOrder odetails(Long orderId, Long userId);
	Users getUser(long userId);
	
}
