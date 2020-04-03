package com.sapient.dao;

import java.util.List;

import com.sapient.entity.TransactionHistory;

public interface ITransactionHistoryDao {
	List<TransactionHistory> getTransactionHistory(Long orderId);
	public int setStatusByOrderId(Long OrderId, String status);
}
