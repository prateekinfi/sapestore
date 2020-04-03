package com.sapient.dao;

import java.util.List;
import java.util.Map;

import com.sapient.entity.Book;
import com.sapient.entity.BookRent;
import com.sapient.entity.ShippingAddress;
import com.sapient.entity.UserOrder;
public interface ICheckOutDao {

	List<ShippingAddress> getShippingAddress(Long userId);
	
	Integer insertShippingAddress(String al1, String al2, String mail, String mobile, Long cityId, Long countryId, Long stateId, Long userId, Long orderId);

	Integer insertOrder(Float price, Long userId, Long shippingAddressId);
	
	UserOrder getOrderId(Long userId);
	
	Integer insertOrderDetails(UserOrder order, List<Book> book, Map<String, Integer> quantity, Map<String, Integer> purchase );
	
	Integer insertBookRent(BookRent bookrent);
	
	Integer deleteCart(Long userId);
	
	Integer removeShipping(Long ShippingId);
}
