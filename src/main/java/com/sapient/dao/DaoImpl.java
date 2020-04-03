package com.sapient.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sapient.entity.Book;
import com.sapient.entity.Category;
import com.sapient.entity.Inventory;

@Repository("bookdao")
public class DaoImpl implements IDao {

	private Logger logger = LoggerFactory.getLogger("productapp");

	@Autowired
	private SessionFactory sfac;

	@Override
	public int addNewBook(Book book) throws Exception {
		Session sess = null;
		Transaction tx = null;
		try {
			sess = sfac.openSession();
			tx = sess.beginTransaction();
			sess.save(book);
			tx.commit();
			logger.info("product added");
			return 1;
		} catch (HibernateException e) {
			logger.error(e.getMessage());
			if (tx != null)
				tx.rollback();
			throw new Exception("Could not save book to database", e);
		} finally {
			sess.close();
		}
	}

	@Override
	public int updateBook(int eid, double sal) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Category> getCategories() {
		String hql = "from Category";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		List<Category> catlist = qry.list();
		sess.close();
		return catlist;
	}

	@Override
	public List<Book> getTopBooks() {
		String hql = "From Book where averageRating >= 3.5";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		List<Book> booklist = qry.list();
		sess.close();
		return booklist;
	}

	@Override
	public List<Book> getBooksbyCategory(Long categoryId) {
		Session sess = sfac.openSession();
		Category cat = sess.get(Category.class, categoryId);
		Hibernate.initialize(cat.getBooks());
		sess.close();
		return cat.getBooks();
	}

	@Override
	public Book getBook(String isbn) {
		Session sess = sfac.openSession();
		Book book = sess.get(Book.class, isbn);
		sess.close();
		return book;

	}

	@Override
	public int removeQuantity(String isbn) {
		logger.debug("Removing book from cart");
		Session sess = sfac.openSession();
		Transaction tx = sess.beginTransaction();
		Inventory inventory = sess.get(Inventory.class, isbn);
		inventory.setPurchaseQuantity(inventory.getPurchaseQuantity() + 1);
		tx.commit();
		logger.info("Quantity updated");
		sess.close();
		return 1;
	}

	@Override
	public List<Book> getSearch(String bookTitle, String author, String isbn, Long CatId,
			String bookPublisher) {
		Session sess = sfac.openSession();
		int count =0;
		Transaction tx = sess.beginTransaction();
		String sql="select * from books where ";
		if (bookTitle.length()!=0){
			sql+="book_title like '%"+bookTitle+"%' and ";
			count++;
		}
		if (author.length()!=0){
			sql += "author like '%" + author + "%' and ";
			count++;
		}
		if (CatId!=0){
			sql += "category_id =" + CatId + " and ";
			count++;
		}
		if (isbn.length()!=0){
			sql += "isbn like '%" + isbn + "%' and ";
			count++;
		}
		if (bookPublisher.length()!=0){
			sql += "publisher like '%" + bookPublisher + "%' and ";
			count++;
		}
		
		if(count==0){
			sql+="average_rating >= 3.5 and ";
		}
		
		sql=sql.substring(0,sql.length()-4);
		
		SQLQuery query = sess.createSQLQuery(sql);
		query.addEntity(Book.class);
		List<Book> books=query.list();
		sess.close();
		return books;

	}

	@Override
	public String getCategoryName(Long categoryId) {
		String hql="from Category where categoryId=?";
		Session sess=sfac.openSession();
		Query qry=sess.createQuery(hql);
		qry.setLong(0, categoryId);
		Category cat=(Category) qry.uniqueResult();
		sess.close();
		return cat.getCategoryName();
	}
	
	
	@Override
	public Inventory getInventory(String isbn) {
		Session sess = sfac.openSession();
		String hql="from Inventory where isbn=?";
		Query qry = sess.createQuery(hql);
		qry.setString(0, isbn);		
		Inventory inventory=(Inventory)qry.uniqueResult();
		sess.close();
		return inventory;
	}
	

	
	@Override
	public int addQuantity(String isbn) {
		logger.debug("Adding book to cart");
		Session sess=sfac.openSession();
		Transaction tx=sess.beginTransaction();
		Inventory inventory=sess.get(Inventory.class, isbn);
		if(inventory.getPurchaseQuantity()<=0)
				return 0;
		inventory.setPurchaseQuantity(inventory.getPurchaseQuantity()-1);
		tx.commit();
		logger.info("Quantity updated");
		sess.close();
		return 1;
	}
	
	@Override
	public Integer getBookQuantity(String isbn, Boolean flag) {
		logger.debug("Getting the Quantity left of a good");			
		Inventory inventory=getInventory(isbn);
		if(flag){
			return inventory.getPurchaseQuantity();
		}
		return inventory.getRentQuantity();
	}

	@Override
	public Integer updateAverageRating(String isbn, double avg) {
		logger.debug("update average rating");
		Session sess=sfac.openSession();
		Transaction tx=sess.beginTransaction();
		Book book = getBook(isbn);
		book.setAverageRating((float) avg);
		sess.update(book);
		tx.commit();
		sess.close();
		return 1;
	} 
}