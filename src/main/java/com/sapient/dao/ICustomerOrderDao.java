package com.sapient.dao;

import java.util.Date;
import java.util.List;

import com.sapient.entity.BookRent;
import com.sapient.entity.OrderDetails;
import com.sapient.entity.UserOrder;

public interface ICustomerOrderDao {
	
	List<UserOrder> getOrders(long userId);
	UserOrder trackOrder(long userId,long orderId);
	List<OrderDetails> getOrderDetails();

	List<UserOrder> getUserOrders();

	List<OrderDetails> getOrderDetails(Long orderId);

	List<BookRent> getBookRent();
	
	

	List<Float> getPurchasedRevenueOrderDetails(Date dateF, Date dateT);

	List<Float> getRentedRevenueOrderDetails(Date dateF, Date dateT);
	int deleteBookfromDefList(Long bookRentId);
	List<UserOrder> getUserOrdersByStatus();
	List<BookRent> getBookLateFeeNotPaid();
}
