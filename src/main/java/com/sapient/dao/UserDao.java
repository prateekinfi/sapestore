package com.sapient.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.catalina.User;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sapient.entity.City;
import com.sapient.entity.Country;
import com.sapient.entity.ShippingAddress;
import com.sapient.entity.State;
import com.sapient.entity.UserOrder;
import com.sapient.entity.Users;

@Repository("userdao")
public class UserDao implements IUserDao {
	private Logger logger = LoggerFactory.getLogger("sapestore");
	@Autowired
	private SessionFactory sfac;

	@Override
	public int addUser(Users user) {
		logger.debug("Inside Add User Function");
		Session sess = null;
		Transaction tx = null;
		try {
			sess = sfac.openSession();
			tx = sess.beginTransaction();
			sess.saveOrUpdate(user);
			tx.commit();
			return 1;
		} catch (HibernateException ex) {
			logger.error(ex.getMessage());
			tx.rollback();
			return 0;
		} finally {
			sess.close();
		}

	}

	@Override
	public int removeUser(Long userId) {
		logger.debug("Inside Add User Function");
		Session sess = null;
		Transaction tx = null;
		try {
			sess = sfac.openSession();
			tx = sess.beginTransaction();
			Users user = new Users();
			user.setUserId(userId);
			sess.delete(user);
			tx.commit();
			return 1;
		} catch (HibernateException ex) {
			logger.error(ex.getMessage());
			tx.rollback();
			return 0;
		} finally {
			sess.close();
		}
	}

	@Override
	public List<Country> getCountries() {
		logger.debug("Inside get Countries Function");
		Session sess = null;
		try {
			sess = sfac.openSession();
			Query query = sess.createQuery("from Country");
			List<Country> countries = query.list();
			return countries;
		} catch (HibernateException ex) {
			logger.error(ex.getMessage());
			return null;
		} finally {
			sess.close();
		}
	}

	@Override
	public List<State> getStates(Long countryId) {
		logger.debug("Inside get States Function");
		Session sess = null;
		try {
			sess = sfac.openSession();
			Query query = sess.createQuery("from Country where countryId=?");
			query.setLong(0, countryId);
			Country country = (Country) query.uniqueResult();
			logger.debug(country.getCountryName());
			Hibernate.initialize(country.getStates());
			List<State> lst = new ArrayList<>(country.getStates());
			List<State> lststate = new ArrayList<>();
			for (Iterator iterator = lst.iterator(); iterator.hasNext();) {
				State state = (State) iterator.next();
				State states = new State();
				states.setStateId(state.getStateId());
				states.setStateName(state.getStateName());
				lststate.add(states);

			}
			logger.debug(lst.get(0).getStateName());
			return lststate;
		} catch (HibernateException ex) {
			logger.error(ex.getMessage());
			return null;
		} finally {
			sess.close();
		}

	}

	@Override
	public List<City> getCities(Long stateId) {
		logger.debug("Inside get Countries Function");
		Session sess = null;
		try {
			sess = sfac.openSession();
			Query query = sess.createQuery("from State where stateId=?");
			query.setLong(0, stateId);
			State state = (State) query.uniqueResult();
			logger.debug("cities{}", state.getCities().size());
			Hibernate.initialize(state.getCities());
			List<City> lst = new ArrayList<>(state.getCities());
			List<City> lstcity = new ArrayList<>();
			for (Iterator iterator = lst.iterator(); iterator.hasNext();) {
				City city = (City) iterator.next();
				City cities = new City();
				cities.setCityId(city.getCityId());
				cities.setCityName(city.getCityName());
				cities.setPostalCode(city.getPostalCode());
				lstcity.add(cities);
			}
			logger.debug(lst.get(0).getCityName());
			return lstcity;
		} catch (HibernateException ex) {
			logger.error(ex.getMessage());
			return null;
		} finally {
			sess.close();
		}
	}

	@Override
	public boolean checkMailExists(String mail) throws HibernateException {
		logger.debug("Inside check mail exists Function");
		logger.debug("mail in dao{}",mail);
		Session sess = null;
		sess = sfac.openSession();
		Query qry = sess.createQuery("from Users where mail like ?");
		qry.setString(0, mail);
		Users user = (Users) qry.uniqueResult();
		sess.close();
		if (user == null){
			logger.debug("returning false");
			return false;
		}
		else{
			logger.debug("returning true");
			return true;
		}

	}

	@Override
	public City getCityById(Long cityId) {
		Session sess = null;
		logger.debug("Inside get City by ID");
		sess = sfac.openSession();
		City city = sess.get(City.class, cityId);
		logger.debug(city.getCityName());
		sess.close();
		return city;
	}

	@Override
	public State getStateById(Long stateId) {
		Session sess = null;
		logger.debug("Inside get state by ID");
		try {
			sess = sfac.openSession();
			State state = sess.get(State.class, stateId);
			logger.debug(state.getStateName());
			return state;
		} finally {
			sess.close();
		}
	}

	@Override
	public Country getCountryById(Long countryId) {
		Session sess = null;
		logger.debug("Inside get country by ID");
		sess = sfac.openSession();
		Country country = sess.get(Country.class, countryId);
		logger.debug(country.getCountryName());
		sess.close();
		return country;
	}

	@Override
	public String getPostalCode(Long cityId) {
		Session sess = null;
		logger.debug("Inside get postal by ID");
		sess = sfac.openSession();
		City city = sess.get(City.class, cityId);
		logger.debug(city.getPostalCode());
		sess.close();
		return city.getPostalCode();
	}

	@Override
	public Users getUserById(Long userId) {
		Session sess = sfac.openSession();
		Users user = sess.get(Users.class, userId);
		sess.close();
		return user;
	}

	@Override
	public ShippingAddress getAddressById(Long shippingId) {
		Session sess = sfac.openSession();
		ShippingAddress sa = sess.get(ShippingAddress.class, shippingId);
		sess.close();
		return sa;
	}
	
	@Override
	public UserOrder odetails(Long orderId,Long userId){
		logger.debug("order tracking");
		Session sess = null;
		sess = sfac.openSession();
		Query qry = sess.createQuery("from UserOrder where orderId=? and user.userId=?");
		qry.setLong(0, orderId);
		qry.setLong(1, userId);
		UserOrder uorder = (UserOrder) qry.uniqueResult();
		sess.close();
	    return uorder;
	}

	@Override
	public Users getUser(long userId) {
		Session sess = null;
		sess = sfac.openSession();
		logger.debug("Session {}",sess);
		Query qry = sess.createQuery("from Users where userId=?");
		qry.setLong(0, userId);
		Users user = (Users) qry.uniqueResult();
		sess.close();
		return  user;
	}

}
