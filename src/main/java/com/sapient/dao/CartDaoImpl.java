package com.sapient.dao;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sapient.entity.Book;
import com.sapient.entity.CartDetails;
import com.sapient.entity.Login;
import com.sapient.entity.UserCart;

@Repository
public class CartDaoImpl implements ICartDao{

	private Logger logger = LoggerFactory.getLogger("productapp");

	@Autowired
	private SessionFactory sfac;

	
	@Override
	public UserCart getCart(long userId) {
		Session sess=sfac.openSession();
		String hql="from UserCart where userId=?";	
		Query qry = sess.createQuery(hql);
		qry.setLong(0, userId);
		UserCart userCart=(UserCart) qry.uniqueResult();
		if(userCart!=null)
		Hibernate.initialize(userCart.getCartDetails());
		sess.close();
		return userCart;
				
	}


	@Override
	public void insert(Set<Book> book, Map<String, Integer> quantity, Map<String, Integer> purchaseType,HttpServletRequest req) {
		HttpSession session=req.getSession(false);
		Login login=(Login) session.getAttribute("login");
		
		//adding user to usercart
		Session sess=sfac.openSession();
		Transaction tx=sess.beginTransaction();
		 tx=sess.beginTransaction();
		 String hql="from UserCart where userId=?";
		 Query qry=sess.createQuery(hql);
			qry.setLong(0, login.getUser().getUserId());
			UserCart userCart=(UserCart) qry.uniqueResult();
			
			if(userCart==null){
				UserCart usercart=new UserCart();
				usercart.setUserId(login.getUser().getUserId());
				sess.saveOrUpdate(usercart);
			}
	
		tx.commit();
		sess.close();
		
		//getting userCartId of user
		 sess=sfac.openSession();
		 
		 hql="from UserCart where userId=?";
		 qry=sess.createQuery(hql);
		qry.setLong(0, login.getUser().getUserId());
		 userCart=(UserCart) qry.uniqueResult();
		
		//deleting previous entries
		Query q = sess.createQuery("delete CartDetails where userCart.cartId = ?");
		q.setLong(0, userCart.getCartId());
		q.executeUpdate();
		
		sess.close();
		//adding cart entries
		if(book==null)
			return;
		for (Book book2 : book) {
			sess=sfac.openSession();
			tx=sess.beginTransaction();
			CartDetails cartDetails=new CartDetails();
			cartDetails.setUserCart(userCart);
			cartDetails.setIsbn(book2.getIsbn());
			cartDetails.setPurchaseType(purchaseType.get(book2.getIsbn()));
			cartDetails.setQuantity(quantity.get(book2.getIsbn()));
			sess.saveOrUpdate(cartDetails);
			tx.commit();
			sess.close();
		}
		
	}


	@Override
	public void generateCartId(Long userId) {
		
		Session sess=sfac.openSession();
		UserCart userCart=new UserCart();
		userCart.setUserId(userId);
		sess.saveOrUpdate(userCart);
		sess.close();
	}


	

	
	
	
}
