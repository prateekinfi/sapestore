package com.sapient.dao;

import java.util.List;

import com.sapient.entity.OrderDetails;
import com.sapient.entity.UserOrder;

public interface IAdminOrderDao {

/*	List<UserOrder> getUserOrders(Long userId);

	List<OrderDetails> getOrderDetails(Long orderId);

	List<UserOrder> getAllUserOrders();*/

	List<UserOrder> getUserOrders();

	List<OrderDetails> getOrderDetails(Long orderId);

	List<OrderDetails> getAllOrderDetails();

	List<OrderDetails> getConfirmedOrderDetails();


}
