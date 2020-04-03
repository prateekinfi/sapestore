package com.sapient.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.sapient.dao.IDao;
import com.sapient.dao.IInventoryDao;

@RunWith(SpringRunner.class)

@SpringBootTest
public class BookTest {

	@Autowired
	private IDao dao;
	
	@Autowired
	private IInventoryDao invendao;

	@Test
	public void testGetUserBook() {
		assertEquals("Apple Cart",dao.getBook("9360000000000").getBookTitle());
		assertEquals("Harper Collins",dao.getBook("9110000000000").getPublisher());
		
	}
	
	/*@Test
	public void testGetUserCategories() {
		assertEquals(12,dao.getCategories().size());
		assertNotEquals(0,dao.getCategories().size());
		
	}*/
	
	/*@Test
	public void testGetUserBooksByCategory() {
		assertEquals(2,dao.getBooksbyCategory((long)1).size());
		assertNotEquals(3,dao.getBooksbyCategory((long)1).size());
	}*/
	
	/*@Test
	public void testGetUserTopBooks() {
		assertNotEquals(0,dao.getTopBooks().size());
		
		
	}*/
	
	/*@Test
	public void testGetUserSearch() {
		assertNotEquals(1,dao.getSearch("A Gift of Monotheists","Ram Mohan Roy" ,"9220000000000",(long)7, "iUniverse").size());	
	}*/
	
	@Test
	public void testGetUserCategoryName() {
		assertEquals("Sports and Games",dao.getCategoryName((long)12));
		assertEquals("Food and Wine",dao.getCategoryName((long)5));
		
	}
	
	@Test
	public void testGetUserInventory() {
		assertEquals("Apple Cart",invendao.getInventory("9360000000000").getBook().getBookTitle());
		
		
	}
	/*@Test
	public void testGetBookQuantities(){
		assertEquals(10L,dao.getBookQuantity("5560000000000", true).longValue());
		assertNotEquals(20L,dao.getBookQuantity("2220000000000", true).longValue());

	}
*/
}
