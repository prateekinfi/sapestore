package com.sapient.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sapient.entity.BookRent;
import com.sapient.entity.OrderDetails;
import com.sapient.entity.UserOrder;
@Repository
public class CustomerOrderDaoImpl implements ICustomerOrderDao{

	private Logger logger = LoggerFactory.getLogger("sapestore");
	@Autowired
	private SessionFactory sfac;
	
	
	@Override
	public List<UserOrder> getOrders(long userId) {
		
		Session sess=sfac.openSession();
		String query="from UserOrder where user.userId like ?";
		Query qry=sess.createQuery(query);
		qry.setLong(0, userId);
		List<UserOrder> userOrderList=qry.list();
		
		sess.close();
		return userOrderList;
	}

	@Override
	public UserOrder trackOrder(long userId, long orderId) {
		Session sess=sfac.openSession();
		String query="from UserOrder where user.userId like ? and orderId =?";
		Query qry=sess.createQuery(query);
		qry.setLong(0, userId);
		qry.setLong(1, orderId);
		UserOrder userOrder=(UserOrder) qry.uniqueResult();
		sess.close();
		return userOrder;
	}
	@Override
	public List<OrderDetails> getOrderDetails(Long orderId) {
		String hql = "from OrderDetails d where d.order.orderId=?";
		Session sess=sfac.openSession();
		Query qry=sess.createQuery(hql);
		qry.setLong(0, orderId);
		List<OrderDetails> orderList = qry.list();
		sess.close();
		return orderList;
	}
	@Override
	public List<UserOrder> getUserOrders() {
		String hql = "from UserOrder";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		List<UserOrder> uList = qry.list();
		sess.close();
		return uList;
	}
	@Override
	public List<OrderDetails> getOrderDetails() {
		String hql = "from OrderDetails";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		List<OrderDetails> orderList = qry.list();
		sess.close();
		return orderList;
	}


	@Override
	public List<BookRent> getBookRent() {
		
		String hql="from BookRent";
		Session sess=sfac.openSession();
		Query qry=sess.createQuery(hql);
		List<BookRent> bookRent=qry.list();
		sess.close();
		return bookRent;
	}
	
	@Override
	public List<BookRent>  getBookLateFeeNotPaid() {
		
		String hql="from BookRent b where b.isLateFeePaid = ?";
		Session sess=sfac.openSession();
		Query qry=sess.createQuery(hql);
		qry.setBoolean(0, false);
		List<BookRent> bookRent=qry.list();
		sess.close();
		return bookRent;
	}

	@Override
	public int deleteBookfromDefList(Long bookRentId) {
		logger.info("inside delete from def list");
		String hql = "delete from BookRent br where br.bookRentId=?";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setLong(0, bookRentId);
		qry.executeUpdate();
		sess.close();
		return 1;
	}

	//This method returns all the rented books' price
		@Override
		public List<Float> getRentedRevenueOrderDetails(Date dateFrom, Date dateTo) {
			
			logger.debug("in rent dao");
			
			logger.debug(dateTo+"");
			logger.debug(dateFrom+"");
			
			String hql = "from OrderDetails where createdDate >= ? AND createdDate < ? AND purchaseType = FALSE";//This statement is creating query to fetch all the purchased books
			Session sess = sfac.openSession();
			Query qry = sess.createQuery(hql);
			qry.setDate(0, dateFrom);
			qry.setDate(1, dateTo);
			List<OrderDetails> rentedBooks= qry.list();
			if(rentedBooks.isEmpty()){
				logger.debug("i am NULL RENTED");
				return null;
			}
			List<Float> rentedOList  = new ArrayList<Float>();
			for (OrderDetails od: rentedBooks) {
				logger.debug("Rented Item Price{}:",od.getItemPrice());
				rentedOList.add(od.getItemPrice()*od.getQuantity());
			}
			
//			logger.debug(rentedBooks.get(0)+"");
			
			sess.close();
			return rentedOList;
		} 
	
	
	//This method returns all the purchased books' price
		@Override
		public List<Float> getPurchasedRevenueOrderDetails(Date dateFrom, Date dateTo) {
			
			logger.debug("in purchase dao");
			
			logger.debug(dateTo+"");
			logger.debug(dateFrom+"");
			String hql = "from OrderDetails where createdDate >= ? AND createdDate < ? AND purchaseType=true"; //This statement is creating query to fetch all the purchased books
			Session sess = sfac.openSession();
			Query qry = sess.createQuery(hql);
			qry.setDate(0, dateFrom);
			qry.setDate(1, dateTo);
			List<OrderDetails> purchasedBooks= qry.list();
			logger.debug(purchasedBooks.toString());
			if(purchasedBooks.isEmpty()){
				logger.debug("i am NULL");
				return null;
			}
			List<Float> purchasedOList  = new ArrayList<Float>();
			for (OrderDetails od: purchasedBooks) {
				logger.debug("Purchased Item Price{}:",od.getItemPrice());
				purchasedOList.add(od.getItemPrice()*od.getQuantity());
			}
			
//			logger.debug(purchasedBooks.get(0)+"");
			
			sess.close();
			return purchasedOList;
		} 

	@Override
	public List<UserOrder> getUserOrdersByStatus() {
		String hql = "from UserOrder u where u.status=? or u.status=?";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setString(0, "pending");
		qry.setString(1, "dispatched");
		List<UserOrder> uList = qry.list();
		sess.close();
		return uList;
	}
}
