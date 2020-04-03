package com.sapient.test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.sapient.dao.IUserDao;

@RunWith(SpringRunner.class)

@SpringBootTest
public class UserTest {

	@Autowired
	private IUserDao dao;
	

	
	/*@Test
	public void testgetCountries(){
		assertEquals((long)1,dao.getCountries().size());

	}
	@Test
	public void testgetStates(){
		assertEquals((long)10,dao.getStates(1L).size());

	}
	@Test
	public void testgetCities(){
		assertEquals((long)10,dao.getCities(2L).size());

	}*/
	@Test
	public void testgetCityById(){
		assertEquals("Bedford",dao.getCityById(71L).getCityName());

	}
	@Test
	public void testgetStateById(){
		assertEquals("Georgia",dao.getStateById(7L).getStateName());

	}
	@Test
	public void testgetCountryById(){
		assertEquals("USA",dao.getCountryById(1L).getCountryName());

	}
	@Test
	public void testgetPostalCode(){
		assertEquals("70053",dao.getCityById(10L).getPostalCode());

	}
	
	
}
