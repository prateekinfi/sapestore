package com.sapient.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sapient.entity.Book;
import com.sapient.entity.BookRent;
import com.sapient.entity.OrderDetails;
import com.sapient.entity.ShippingAddress;
import com.sapient.entity.UserCart;
import com.sapient.entity.UserOrder;

@Repository
public class CheckOutDaoImpl implements ICheckOutDao {

	
	private Logger logger = LoggerFactory.getLogger("sapestore");
	
	@Autowired
	SessionFactory sfac;
	
	@Autowired
	IUserDao dao;
	
	@Autowired
	IDao dao1;
	
	@Override
	public List<ShippingAddress> getShippingAddress(Long userId) {
		String hql = "from ShippingAddress where user.userId=?";
		Session sess = sfac.openSession();
		Query qry = sess.createQuery(hql);
		qry.setLong(0,userId);
		List<ShippingAddress> shippingAddress= qry.list();
		
		sess.close();
		return shippingAddress;
	}

	@Override
	public Integer insertShippingAddress(String al1, String al2, String mail, String mobile, Long cityId,
			Long countryId, Long stateId, Long userId, Long orderId) {
		ShippingAddress sa = new ShippingAddress();
		sa.setAddressLine1(al1);
		sa.setAddressLine2(al2);
		sa.setMail(mail);
		sa.setMobile(mobile);
		sa.setCity(dao.getCityById(cityId));
		sa.setCountry(dao.getCountryById(countryId));
		sa.setState(dao.getStateById(stateId));
		sa.setPostalCode(dao.getPostalCode(cityId));
		
		Session sess = sfac.openSession();
		Transaction tx=sess.beginTransaction();
		sess.saveOrUpdate(sa);
		tx.commit();
		sess.close();
		
		return 1;
	}

	@Override
	public Integer insertOrder(Float price, Long userId, Long shippingAddressId) {

		UserOrder uo = new UserOrder();
		uo.setPrice(price);
		uo.setUser(dao.getUserById(userId));
		uo.setShippingAddress(dao.getAddressById(shippingAddressId));
		uo.setStatus("pending");
		uo.setPaymentMode("COD");
		Session sess = sfac.openSession();
		sess.saveOrUpdate(uo);
		sess.close();
		return 1;
	}

	@Override
	public UserOrder getOrderId(Long userId) {
		Session sess = sfac.openSession();
		String sql = "select * from user_order u inner join ("
					+"select  max(last_modified_date) as MaxDate"
					+" from user_order v where user_id="+userId
					+")u on u.user_id = "+userId+" and u.last_modified_date = MaxDate";
		SQLQuery query = sess.createSQLQuery(sql);
		query.addEntity(UserOrder.class);
		UserOrder od = (UserOrder) query.uniqueResult();
		sess.close();
		return od;
	}

	@Override
	public Integer insertOrderDetails(UserOrder order, List<Book> book, Map<String, Integer> quantity,
			Map<String, Integer> purchase) {
		Set<String> isbn = quantity.keySet();
		Session session = sfac.openSession();
		for (String string1 : isbn) {
			OrderDetails od = new OrderDetails();
			
			boolean f = false;
			if(purchase.get(string1) == 1){
				f=true;
				float price = Float.parseFloat(dao1.getBook(string1).getSellPrice()+"");
				od.setItemPrice(price);
			}else{
				float price = Float.parseFloat(dao1.getBook(string1).getRentPrice()+"");
				od.setItemPrice(price);
			}
			od.setPurchaseType(f);
			od.setQuantity(quantity.get(string1));
			od.setBook(dao1.getBook(string1));
			od.setOrder(order);
			session.saveOrUpdate(od);
		}
		session.close();
		return 1;
	}

	@Override
	public Integer insertBookRent(BookRent bookrent) {
		Session session = sfac.openSession();
		session.saveOrUpdate(bookrent);
		session.close();
		return 1;
	}

	@Override
	public Integer deleteCart(Long userId) {
		Session sess=sfac.openSession();
		Transaction tx=sess.beginTransaction();
		 tx=sess.beginTransaction();
		 String hql="from UserCart where userId=?";
		 Query qry=sess.createQuery(hql);
			qry.setLong(0, userId);
			UserCart userCart=(UserCart) qry.uniqueResult();
			
			tx.commit();
			if(userCart != null){
				 tx=sess.beginTransaction();
				Query q = sess.createQuery("delete CartDetails where userCart.cartId = ?");
				q.setLong(0, userCart.getCartId());
				logger.debug(q.executeUpdate()+"");
				tx.commit();
				
			}
			sess.close();
			return 0;
	}
	

	@Override
	public Integer removeShipping(Long ShippingId) {
		if(ShippingId == -1){
			return 0;
		}
		logger.debug("inside remove shipping"+ShippingId);
		
		String hql = "update ShippingAddress i set i.user.userId=? where i.shippingId=?";
		Session sess=sfac.openSession();
		Transaction tx=sess.beginTransaction();
		Query qry = sess.createQuery(hql);
		qry.setInteger(0, 4);
		qry.setLong(1, ShippingId);
		qry.executeUpdate();
		tx.commit();
		sess.close();
		return 1;
	}

}
