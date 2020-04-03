package com.sapient.dao;

import org.hibernate.Hibernate;
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
import com.sapient.entity.Users;
import com.sapient.entity.WishItem;
import com.sapient.entity.WishList;

@Repository("wishdao")
public class WishlistDaoImpl implements IWishlistDao{

	private Logger logger = LoggerFactory.getLogger("sapestore");

	@Autowired
	private SessionFactory sfac;

	@Override
	public WishList getWishList(long userId) {
		logger.debug("Inside getWishList() using userId");
		Session sess = null;
		try {
			sess = sfac.openSession();
			Query qry = sess.createQuery("from WishList w where w.user.userId=?");
			qry.setLong(0, userId);
			WishList wl = (WishList) qry.uniqueResult();
//			logger.debug("Inside try wl is "+wl.toString());
			if(wl!=null)
			    Hibernate.initialize(wl.getWishItem());
			return wl;
		} catch (HibernateException ex) {
			logger.error(ex.getMessage());
			return null;
		} finally {
			sess.close();
		}
	}

	@Override
	public int createWishList(Long userId) {
		logger.debug("Creating new Wishlist for user "+userId);
		Session sess=null;
		Transaction tx=null;
		sess=sfac.openSession();
		WishList wl = new WishList();
		Users user = sess.get(Users.class, userId);
		wl.setUser(user);
		try{
			tx=sess.beginTransaction();
			sess.save(wl);
			tx.commit();
			logger.info("new wishlist added");	
			return 1;
		}catch(HibernateException e){
			logger.error(e.getMessage());
			logger.error(e.toString());
			if(tx!=null)
				tx.rollback();
			return 0;
		}finally {
			sess.close();
		}
		
	}

	@Override
	public int createWishItem(Long wishListId, String isbn) {
		logger.debug("Creating new wish item");
		Session sess=null;
		Transaction tx=null;
		sess=sfac.openSession();
		WishItem wi = new WishItem();
		WishList wl = sess.get(WishList.class,wishListId);
		wi.setWishList(wl);
		wi.setBook(sess.get(Book.class,isbn));
		try{
			tx=sess.beginTransaction();
			sess.save(wi);
			tx.commit();
			logger.info("new wishitem added");	
			return 1;
		}catch(HibernateException e){
			logger.error(e.getMessage());
			logger.error(e.toString());
			if(tx!=null)
				tx.rollback();
			return 0;
		}finally {
			sess.close();
		}
		
	}

	@Override
	public boolean existsWishItem(Long wishListId, String isbn) {
		Session sess = null;
			sess = sfac.openSession();
			Query qry = sess.createQuery("from WishItem i where i.book.isbn=? and i.wishList.wishListId=?");
			qry.setString(0, isbn);
			qry.setLong(1, wishListId);
			WishItem wi = (WishItem) qry.uniqueResult();
			logger.debug("checking existence");
			sess.close();
			if(wi==null)
				return false;
			else
				return true;
			
	}
	
	@Override
	public int deleteBookfromWishlist(String wishItemId) {
		logger.info("inside delete wishlist");
		String hql = "delete from WishItem wi where wi.wishItemId=?";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setString(0, wishItemId);
		qry.executeUpdate();
		sess.close();
		return 1;
	} 
}
