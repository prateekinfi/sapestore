package com.sapient.dao;

import com.sapient.entity.WishList;

public interface IWishlistDao {

	WishList getWishList(long userId);
	
	int createWishList(Long userId);
	int createWishItem(Long wishListId, String isbn);

	boolean existsWishItem(Long wishListId, String isbn);
	int deleteBookfromWishlist(String wishItemId); 
}
