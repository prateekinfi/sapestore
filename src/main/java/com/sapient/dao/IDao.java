package com.sapient.dao;

import java.util.List;

import com.sapient.entity.Book;
import com.sapient.entity.Category;
import com.sapient.entity.Inventory;

public interface IDao {

	int addNewBook(Book book) throws Exception;

	int updateBook(int eid, double sal);

	List<Category> getCategories();
	List<Book> getBooksbyCategory(Long categoryId);
	List<Book> getTopBooks();
	Book getBook(String isbn); 
	int removeQuantity(String isbn);
	List<Book> getSearch(String bookTitle,String BookAuthor,String ISBN,Long bookCategory,String bookPublisher);
	String getCategoryName(Long categoryId);
	Inventory getInventory(String isbn);
	int addQuantity(String isbn);

	Integer getBookQuantity(String isbn, Boolean flag);
	Integer updateAverageRating(String isbn,double avg); 
	
}
