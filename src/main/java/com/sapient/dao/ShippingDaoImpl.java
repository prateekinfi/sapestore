package com.sapient.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sapient.entity.ShippingAddress;

@Repository
public class ShippingDaoImpl implements IShippingDao{

	private Logger logger = LoggerFactory.getLogger("sapestore");
	@Autowired
	private SessionFactory sfac;
	
	@Override
	public Integer addAddress(ShippingAddress shippingAddress) {
		logger.debug("Inside Add User Function");
		Session sess = null;
		Transaction tx = null;
		try {
			sess = sfac.openSession();
			tx = sess.beginTransaction();
			sess.saveOrUpdate(shippingAddress);
			tx.commit();
			return 1;
		} catch (HibernateException ex) {
			logger.error(ex.getMessage());
			tx.rollback();
			return 0;
		} finally {
			sess.close();
		}
	}

}
