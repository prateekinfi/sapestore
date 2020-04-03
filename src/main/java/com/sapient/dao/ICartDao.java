package com.sapient.dao;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.sapient.entity.Book;
import com.sapient.entity.UserCart;

public interface ICartDao {
	
	public UserCart getCart(long userId);
	public void insert(Set<Book> book,Map<String,Integer> quantity,Map<String,Integer> purchaseType,HttpServletRequest req);
	public void generateCartId(Long userId);
	
}
