package com.sapient.dao;

import java.util.List;

import com.sapient.entity.Subscription;

public interface ISubscriptionDao {

	List<Subscription> getSubscribedUsersByIsbn(String isbn);
	List<String> getDistinctSubscriberBooks();
	Integer removeSubscribedUser(Long userId, String isbn);
	
	Integer addSubscriber(Long userId, String isbn);
	Boolean checkSubscriber(Long userId, String isbn);
	
}
