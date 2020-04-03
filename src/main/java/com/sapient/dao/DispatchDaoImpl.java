package com.sapient.dao;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sapient.entity.BookRent;
import com.sapient.entity.UserOrder;

@Repository("dispatchOrder")
public class DispatchDaoImpl implements DispatchDao {
	
	private Logger logger=LoggerFactory.getLogger("sapestore");
	//private static final DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	
	private Integer rentPeriod = 1;

	@Autowired
	private SessionFactory sfac;

	@Override
	public UserOrder getUserByOrderId(Long orderId) {
		String hql = "from UserOrder where orderId=?";
		Session sess = sfac.openSession();
		sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setLong(0, orderId);
		UserOrder userOrder = (UserOrder) qry.uniqueResult();
		sess.close();
		return userOrder;
	}

	@Override
	public int setPaymentReceivedByOrderId(Long orderId) {
		String result = "confirmed";
		Session sess = sfac.openSession();
		Transaction tx = sess.beginTransaction();
		UserOrder userOrder = sess.get(UserOrder.class, orderId);
		userOrder.setStatus(result);
		tx.commit();
		sess.close();
		return 1;
	}
	
	@Override
	public int setDispatchByOrderId(Long orderId) {
		String result = "dispatched";
		Session sess = sfac.openSession();
		Transaction tx = sess.beginTransaction();
		UserOrder userOrder = sess.get(UserOrder.class, orderId);
		userOrder.setStatus(result);
		tx.commit();
		sess.close();
		return 1;
	}
	
	@Override
	public int setBookReturnedByBookRentId(Long bookRentId) {
		boolean result = true;
		Session sess = sfac.openSession();
		Transaction tx = sess.beginTransaction();
		BookRent bookRent = sess.get(BookRent.class, bookRentId);
		bookRent.setReturned(result);
		tx.commit();
		sess.close();
		return 1;
	} 
	@Override
	public int setLateFeeReceivedByBookRentId(Long bookRentId) {
		boolean result = true;
		Session sess = sfac.openSession();
		Transaction tx = sess.beginTransaction();
		BookRent bookRent = sess.get(BookRent.class, bookRentId);
		bookRent.setLateFeePaid(result);;
		tx.commit();
		sess.close();
		return 1;
	}

	@Override
	public List<BookRent> getRentByOrderId(Long orderId) {
		String hql = "from BookRent b where b.userOrder.orderId=?";
		Session sess = sfac.openSession();
		sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setLong(0, orderId);
		List<BookRent> rentlist = qry.list();
		sess.close();
		return rentlist;
	}

	@Override
	public int setReturnDate(Long bookRentId) {
		Session sess = sfac.openSession();
		Transaction tx = sess.beginTransaction();
		
		Date dt = new Date();
		Calendar c = Calendar.getInstance(); 
		c.setTime(dt); 
		c.add(Calendar.DATE, rentPeriod);
		dt = c.getTime();
		
		//logger.debug(sdf.format(dt));
		BookRent br = sess.get(BookRent.class, bookRentId);
		br.setReturnDate(dt);
		tx.commit();
		sess.close();
		return 1;
	} 

}
