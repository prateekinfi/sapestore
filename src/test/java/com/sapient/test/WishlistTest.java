package com.sapient.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.sapient.dao.IWishlistDao;

@RunWith(SpringRunner.class)

@SpringBootTest
public class WishlistTest {

	@Autowired
	private IWishlistDao dao;
	

	
	@Test
	public void testgetWishlist(){
		assertEquals("Pallavi",dao.getWishList(54L).getUser().getFirstName());
		assertNotEquals(1L,dao.getWishList(2L).getWishListId().longValue());
	}

	
}
