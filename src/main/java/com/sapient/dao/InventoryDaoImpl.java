package com.sapient.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.sapient.entity.Book;
import com.sapient.entity.BookRent;
import com.sapient.entity.Category;
import com.sapient.entity.Inventory;
import com.sapient.entity.OrderDetails;
import com.sapient.entity.WishItem;

@Repository("inventorydao")
public class InventoryDaoImpl implements IInventoryDao {

	private Logger logger = LoggerFactory.getLogger("sapestore");

	@Autowired
	private SessionFactory sfac;

	@Override
	public int addNewBook(Book book) throws Exception {
		Session session = null;
		Transaction tx = null;
		try {
			session = sfac.openSession();
			tx = session.beginTransaction();
			session.save(book);
			tx.commit();
			logger.info("new book added");
			return 1;
		} catch (HibernateException e) {
			logger.error(e.getMessage());
			if (tx != null)
				tx.rollback();
			throw new Exception("Could not save book to database", e);
		} finally {
			session.close();
		}
	}

	@Override
	public int updateBook(String isbn, String fullImage, String thumbImage, 
							String bookTitle, String author, String publisher, 
							Double sellPrice, Double rentPrice, Double latefee, 
							String shortDesc, Long categoryId, Integer rent, Integer sell) {

		Session sess = sfac.openSession();
		Transaction tx = sess.beginTransaction();
		Book book = sess.get(Book.class, isbn);
		Inventory inv = sess.get(Inventory.class, getInventoryUniqueId(isbn));
		
		book.setAuthor(author);
		book.setBookTitle(bookTitle);
		book.setCategory(sess.get(Category.class, categoryId));
		book.setRentPrice(rentPrice);
		book.setFullImage(fullImage);
		book.setPublisher(publisher);
		book.setShortDesc(shortDesc);
		book.setLateFees(latefee);
		book.setThumbImage(thumbImage);
		book.setSellPrice(sellPrice);
		inv.setPurchaseQuantity(sell);
		inv.setRentQuantity(rent);

		if (inv.getRentQuantity() == 0)
			inv.setForRent(false);
		else
			inv.setForRent(true);

		if (inv.getPurchaseQuantity() == 0)
			inv.setForPurchase(false);
		else
			inv.setForPurchase(true);

		tx.commit();
		sess.close();
		return 1;
	}

	@Override
	public Inventory getInventory(String isbn) {
		logger.info("Getting inventory from isbn");
		String hql = "from Inventory i where i.book.isbn = ?";
		Session sess = sfac.openSession();
		sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setString(0, isbn);
		Inventory inv = (Inventory) qry.uniqueResult();
		sess.close();
		return inv;
	}

	@Override
	public List<Inventory> getInventories() {
		String hql = "from Inventory";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		List<Inventory> invList = qry.list();
		sess.close();
		return invList;
	}
	
	@Override
	public Long getInventoryUniqueId(String isbn) {
		String hql = "from Inventory i where i.book.isbn = ?";
		Session sess = sfac.openSession();
		sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setString(0, isbn);
		Inventory inv = (Inventory) qry.uniqueResult();
		sess.close();
		return inv.getUniqueNo();
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
	public Category getCategory(Long categoryId) {
		Session sess = sfac.openSession();
		Category cate = sess.get(Category.class, categoryId);
		sess.close();
		return cate;
	}

	@Override
	public List<Book> getBooks() {
		String hql = "from Book";
		logger.info("Inside get Books");
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		List<Book> booklist = qry.list();
		sess.close();
		return booklist;
	}

	@Override
	public Book getBook(String isbn) {
		Session sess = sfac.openSession();
		Book book = sess.get(Book.class, isbn);
		sess.close();
		return book;
	}

	@Override
	public int deleteBook(String isbn) {
		String hql = "delete from Book where isbn=?";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setString(0, isbn);
		qry.executeUpdate();
		sess.close();
		return 1;
	}

	@Override
	public int deleteBookfromInventory(String isbn) {
		logger.info("inside delete inventory");
		String hql = "delete from Inventory i where i.book.isbn=?";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setString(0, isbn);
		qry.executeUpdate();
		sess.close();
		return 1;
	}

	@Override
	public int deleteBookfromCart(String isbn) {
		logger.info("inside delete from cart");
		String hql = "delete from CartDetails c where c.isbn=?";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setString(0, isbn);
		qry.executeUpdate();
		sess.close();
		return 1;
	}
	
	@Override
	public int deleteBookfromWishList(String isbn) {
		logger.info("inside delete from wishlist");
		String hql = "delete from WishItem w where w.book.isbn=?";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setString(0, isbn);
		qry.executeUpdate();
		sess.close();
		return 1;
	}
	@Override
	public int addToInventoty(Book book, int rentQuantity, int purchaseQuantity){
		Inventory inv = new Inventory();
		Session sess = null;
		Transaction tx = null;
		try {
			sess = sfac.openSession();
			inv.setBook(book);
			inv.setRentQuantity(rentQuantity);
			inv.setPurchaseQuantity(purchaseQuantity);
			if (rentQuantity == 0)
				inv.setForRent(false);
			else
				inv.setForRent(true);

			if (purchaseQuantity == 0)
				inv.setForPurchase(false);
			else
				inv.setForPurchase(true);
			tx = sess.beginTransaction();
			sess.save(inv);
			tx.commit();
			logger.info("new inventory added");
			return 1;
		} catch (HibernateException e) {
			logger.error(e.getMessage());
			if (tx != null)
				tx.rollback();
			return 0;
		} finally {
			sess.close();
		}

	}

	@Override
	public boolean foundInInventory(String isbn) {
		String hql = "from Inventory i where i.book.isbn = ?";
		Session sess = sfac.openSession();
		sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setString(0, isbn);
		Inventory inv = (Inventory) qry.uniqueResult();
		sess.close();
		if(inv!=null)
			return true;
		else
			return false;
	}
	public boolean foundInOrderItem(String isbn) {
		String hql = "from OrderDetails i where i.book.isbn = ?";
		Session sess = sfac.openSession();
		sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setString(0, isbn);
		List<OrderDetails> od = qry.list();
		sess.close();
		if(od!=null && od.size()>0){
			System.out.println(od.size()+"  books found in Order!");
			return true;
		}
		else
			return false;
		
	}
	public boolean foundInWishItem(String isbn) {
		String hql = "from WishItem i where i.book.isbn = ?";
		Session sess = sfac.openSession();
		sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setString(0, isbn);
		List<WishItem> wi = qry.list();
		sess.close();
		if(wi!=null && wi.size()>0){
			System.out.println(wi.size()+"  books found in Wishlist!");
			return true;
		}
		else
			return false;
		
	}
	
	public boolean foundInBookRent(String isbn) {
		String hql = "from BookRent i where i.book.isbn = ?";
		Session sess = sfac.openSession();
		sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setString(0, isbn);
		List<BookRent> br = qry.list();
		sess.close();
		if(br!=null && br.size()>0){
			System.out.println(br.size()+"  books found in rent!");
			return true;
		}
		else
			return false;
		
	}
	
	@Override
	public String bookInUse(String isbn) {
		String use = "none";
		if(foundInBookRent(isbn))
			use = "rented";
		if( foundInOrderItem(isbn))
			use = "in user order";
		return use;
	}

	
	@Override
	public Integer updateQuantity(Book book, int quantity, int flag) {
		Session sess = sfac.openSession();
		String hql = "";
		if(flag==1)
			hql+="update Inventory i set i.purchaseQuantity=i.purchaseQuantity-? where i.book.isbn=?";
		else
			hql+="update Inventory i set i.rentQuantity=i.rentQuantity-? where i.book.isbn=?";
        Query query = sess.createQuery(hql);
        query.setInteger(0, quantity);
        query.setString(1, book.getIsbn());
        logger.debug(query.executeUpdate()+"");
        sess.close();
		return 1;
	}	
}