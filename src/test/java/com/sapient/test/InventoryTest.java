package com.sapient.test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.sapient.dao.IInventoryDao;

@RunWith(SpringRunner.class)

@SpringBootTest
public class InventoryTest {

	@Autowired
	private IInventoryDao dao;
	

	
	@Test
	public void testGetBook(){
		assertEquals("Apple Cart",dao.getBook("9360000000000").getBookTitle());

	}

	@Test
	public void testGetBooks(){
		assertEquals(false,dao.getBooks().isEmpty());
		

		}

	@Test
	public void testGetCategory(){
		assertEquals("History and Politics",dao.getCategory(7L).getCategoryName());
	}
	/*@Test
	public void testgetInventory(){
		assertEquals(5,dao.getInventory("9360000000000").getRentQuantity().longValue());
	}*/
	@Test
	public void testgetInventoryUniqueId(){
		assertEquals(9L,dao.getInventoryUniqueId("9360000000000").longValue());
	}
	/*@Test
	public void testgetInventories(){
		assertEquals(31,dao.getInventories().size());
	}*/
}
