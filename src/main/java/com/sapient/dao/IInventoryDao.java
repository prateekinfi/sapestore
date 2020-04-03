package com.sapient.dao;

import java.util.List;

import com.sapient.entity.Book;
import com.sapient.entity.Category;
import com.sapient.entity.Inventory;

public interface IInventoryDao {

	int addNewBook(Book book) throws Exception;

	public int updateBook(String isbn,String fullImage, String thumbImage, String bookTitle, String author, String publisher,Double sellPrice,Double rentPrice,Double latefee, String shortDesc,Long categoryId, Integer rent, Integer sell);

	List<Category> getCategories();

	Book getBook(String isbn);

	List<Book> getBooks();

	int deleteBook(String isbn);

	Category getCategory(Long categoryId);

	int addToInventoty(Book book, int rentQuantity, int sellQuantity) ;

	int deleteBookfromInventory(String isbn);

	Inventory getInventory(String isbn);

	Long getInventoryUniqueId(String isbn);

	List<Inventory> getInventories();

	boolean foundInInventory(String isbn);

	String bookInUse(String isbn);

	Integer updateQuantity(Book book, int quantity, int flag);

	int deleteBookfromWishList(String isbn);

	int deleteBookfromCart(String isbn);
	
}
