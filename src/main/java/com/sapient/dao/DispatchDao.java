package com.sapient.dao;

import java.util.List;

import com.sapient.entity.BookRent;
import com.sapient.entity.UserOrder;

public interface DispatchDao {

	public UserOrder getUserByOrderId(Long orderId);

	public int setPaymentReceivedByOrderId(Long orderId);

	int setDispatchByOrderId(Long orderId);

	int setBookReturnedByBookRentId(Long bookRentId);

	int setLateFeeReceivedByBookRentId(Long bookRentId);

	public List<BookRent> getRentByOrderId(Long orderId);

	public int setReturnDate(Long bookRentId);
}
