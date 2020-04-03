package com.sapient.dao;

import static org.hamcrest.CoreMatchers.is;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sapient.entity.Login;
import com.sapient.entity.Subscription;

@Repository
public class SubscribtionDaoImpl implements ISubscriptionDao{

	@Autowired
	SessionFactory sfac;
	
	private Logger logger = LoggerFactory.getLogger("sapestore");
	
	@Override
	public List<Subscription> getSubscribedUsersByIsbn(String isbn) {
		
		String hql="from Subscription where isbn like ?";
		Session sess=sfac.openSession();
		Query qry=sess.createQuery(hql);
		qry.setString(0, isbn);
		List<Subscription> lst=qry.list();
		
		sess.close();
		  
		return lst;
	}

	
	@Override
	public List<String> getDistinctSubscriberBooks() {

		Session sess=sfac.openSession();
		String hql="select distinct isbn from Subscription";
		Query qry=sess.createQuery(hql);
		List<String> lst=qry.list();
		sess.close();
		return lst;
		
	}


	@Override
	public Integer removeSubscribedUser(Long userId, String isbn) {
		Session sess = sfac.openSession();
		Transaction tx=sess.beginTransaction();
		 tx=sess.beginTransaction();
		String hql = "Delete Subscription where userId=? and isbn=?";
		Query qry = sess.createQuery(hql);
		qry.setLong(0, userId);
		qry.setString(1, isbn);
		qry.executeUpdate();
		tx.commit();
		sess.close();
		return 1;
	}
	
	@Override
	public Integer addSubscriber(Long userId, String isbn) {
		Session sess = sfac.openSession();
		Transaction tx=sess.beginTransaction();
		tx=sess.beginTransaction();
		Subscription subscriber = new Subscription();
		subscriber.setIsbn(isbn);
		subscriber.setUserId(userId);
		sess.save(subscriber);
		tx.commit();
		sess.close();
		return 1;
	}


	@Override
	public Boolean checkSubscriber(Long userId, String isbn) {
		Session sess = sfac.openSession();
		Query qry = sess.createQuery("from Subscription where userId=? and isbn like ?");
		qry.setLong(0, userId);
		qry.setString(1, isbn);
		Subscription subscriptionDetails = (Subscription) qry.uniqueResult();
		sess.close();
		if (subscriptionDetails == null)
			return false;
		else
			return true;
	}
	
	
}
