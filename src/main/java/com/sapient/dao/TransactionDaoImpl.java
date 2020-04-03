package com.sapient.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sapient.entity.TransactionHistory;
import com.sapient.entity.UserOrder;

@Repository
public class TransactionDaoImpl implements ITransactionHistoryDao{

	private Logger logger = LoggerFactory.getLogger("sapestore");
	@Autowired
	private SessionFactory sfac;
	
	@Override
	public List<TransactionHistory> getTransactionHistory(Long orderId) {
		logger.debug("Inside get transaction hiostory by order Id");
		Session sess = sfac.openSession();
		Query qry = sess.createQuery("from TransactionHistory where orderId=?");
		qry.setLong(0,orderId);
		List<TransactionHistory> transactionHistory=  qry.list();
		logger.debug(transactionHistory.size()+"");
		sess.close();
		return transactionHistory;
	}

	@Override
	public int setStatusByOrderId(Long orderId, String status) {
		Session sess = sfac.openSession();
		Transaction tx = sess.beginTransaction();
		TransactionHistory th = new TransactionHistory();
		th.setOrderId(orderId);
		th.setStatus(status);
		sess.saveOrUpdate(th);
		tx.commit();
		sess.close();
		return 1;
	}
	

}
