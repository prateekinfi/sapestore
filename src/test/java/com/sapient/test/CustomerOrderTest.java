package com.sapient.test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.sapient.dao.ICustomerOrderDao;

@RunWith(SpringRunner.class)

@SpringBootTest
public class CustomerOrderTest {

	@Autowired
	private ICustomerOrderDao dao;
	

	
	@Test
	public void testgetUserOrders(){
		/*assertEquals(1,dao.getOrders(43L).size());*/

	}

	
}
