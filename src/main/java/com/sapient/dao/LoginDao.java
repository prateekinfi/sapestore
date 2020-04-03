package com.sapient.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sapient.entity.Login;
import com.sapient.entity.Users;

@Repository("logindao")
public class LoginDao implements ILoginDao {

	private Logger logger = LoggerFactory.getLogger("sapestore");
	@Autowired
	private SessionFactory sfac;

	@Override
	public int addLoginDetails(Login login) {
		logger.debug("Inside Add Login Function");
		Session sess = null;
		Transaction tx = null;
		try {
			sess = sfac.openSession();
			tx = sess.beginTransaction();
			sess.saveOrUpdate(login);
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

	@Override
	public Login getLoginDetails(String userName) {
		logger.debug("Inside get LoginDetails Function");
		Session sess = null;
		try {
			sess = sfac.openSession();
			Query qry = sess.createQuery("from Login where userName like ?");
			qry.setString(0, userName);
			Login loginDetails = (Login) qry.uniqueResult();
			return loginDetails;
		} catch (HibernateException ex) {
			logger.error(ex.getMessage());
			return null;
		} finally {
			sess.close();
		}

	}

	@Override
	public boolean checkUserNameExists(String userName) throws HibernateException {
		logger.debug("Inside check username exists Function");
		Session sess = null;
		sess = sfac.openSession();
		Query qry = sess.createQuery("from Login where userName like ?");
		logger.debug("UserName to fetch {}:",userName);
		qry.setString(0, userName);
		Login loginDetails = (Login) qry.uniqueResult();
		sess.close();
		if (loginDetails == null)
			return false;
		else
			return true;

	}

	@Override
	public Login getLoginDetailsByMail(String mail) {
		logger.debug("Inside get LoginDetails By Email Function {}",mail);
		Session sess = null;
		try {
			sess = sfac.openSession();
			Query qry = sess.createQuery("from Login where user.mail like ?");
			qry.setString(0, mail);
			Login loginDetails = (Login) qry.uniqueResult();
			logger.debug("get login by mail {}",loginDetails);
			return loginDetails;
		} catch (HibernateException ex) {
			logger.error(ex.getMessage());
			return null;
		} finally {
			sess.close();
		}
	}

	@Override
	public Integer checkActiveUser(Long loginId) {
		Session session = sfac.openSession();
		Transaction tx=session.beginTransaction();
		Login login = session.get(Login.class, loginId);
		logger.debug(login.getUserName()+"*******************");
		login.setIsActive(true);
		session.update(login);
		tx.commit();
		logger.debug("Check active user"+loginId);
		
		Login login1 = session.get(Login.class, loginId);
		logger.debug(login1.getIsActive()+"+++++++++++++++++++++++");
		session.close();
		return 1;
	}

	@Override
	public Login getLoginDetailsByUsername(String userName) {
		logger.debug("Inside get LoginDetails By Username Function");
		Session sess = null;
		try {
			sess = sfac.openSession();
			Query qry = sess.createQuery("from Login where userName like ?");
			qry.setString(0, userName);
			Login loginDetails = (Login) qry.uniqueResult();
			return loginDetails;
		} catch (HibernateException ex) {
			logger.error(ex.getMessage());
			return null;
		} finally {
			sess.close();
		}
	}

	@Override
	public boolean checkPasswordExists(String userName, String password) {
		logger.debug("Inside check password exists Function");
		Session sess = null;
		sess = sfac.openSession();
		Query qry = sess.createQuery("from Login where userName like ? and userPassword like ?");
		qry.setString(0, userName);
		qry.setString(1, password);
		Login loginDetails = (Login) qry.uniqueResult();
		sess.close();
		if (loginDetails == null)
		{
			logger.debug("returned false");
			return false;
		}
		else
		{
			logger.debug("returned true");
			return true;
		}
			
	}

	@Override
	public Integer checkActiveUser1(Long loginId) {
		Session session = sfac.openSession();
		Transaction tx=session.beginTransaction();
		Login login = session.get(Login.class, loginId);
		logger.debug(login.getUserName()+"*******************");
		login.setIsActive(false);
		session.update(login);
		tx.commit();
		logger.debug("Check active user"+loginId);
		
		Login login1 = session.get(Login.class, loginId);
		logger.debug(login1.getIsActive()+"+++++++++++++++++++++++");
		session.close();
		return 1;
	}

}
