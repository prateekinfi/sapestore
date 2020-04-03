package com.sapient.dao;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sapient.entity.OrderDetails;
import com.sapient.entity.UserOrder;


@Repository("orderdao")
public class AdminOrderDaoImpl implements IAdminOrderDao{

	private Logger logger = LoggerFactory.getLogger("OrderDetails");

	@Autowired
	private SessionFactory sfac;


	@Override
	public List<OrderDetails> getAllOrderDetails() {
		String hql = "from OrderDetails";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
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
	public List<OrderDetails> getConfirmedOrderDetails() {
		String hql = "from OrderDetails d where d.order.status=?";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setString(0, "confirmed");
		List<OrderDetails> orderList = qry.list();
		logger.debug("got confirmed order details");
		sess.close();
		return orderList;
	}
	
}
