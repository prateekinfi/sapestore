package com.sapient.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sapient.dao.ICustomerOrderDao;
import com.sapient.entity.UserOrder;

@Service
public class CustomerTransactionImpl implements ICustomerTransactionService{

	@Autowired
	ICustomerOrderDao customerOrderDao;
	
	@Override
	public List<UserOrder> getOrders(long userId) {
		
		return customerOrderDao.getOrders(userId);
	}

	@Override
	public UserOrder trackOrder(long userId, long orderId) {
		return customerOrderDao.trackOrder(userId, orderId);
	}

}
