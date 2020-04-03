package com.sapient.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.sapient.dao.IAdminOrderDao;

@RunWith(SpringRunner.class)

@SpringBootTest
public class AdminTest {

	@Autowired
	private IAdminOrderDao dao;
	

	
	@Test
	public void testgetOrderUserDetails(){
		/*assertEquals(1,dao.getOrderDetails(1001L).size());*/

	}

	@Test
	public void testgetUserOrders(){
		/*assertEquals(5,dao.getUserOrders().size());
		assertNotEquals(2,dao.getUserOrders().size());*/

		}

}
