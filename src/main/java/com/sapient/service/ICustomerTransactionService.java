package com.sapient.service;

import java.util.List;

import com.sapient.entity.UserOrder;

public interface ICustomerTransactionService {
	
	List<UserOrder> getOrders(long userId);
	UserOrder trackOrder(long userId, long orderId) ;
}
