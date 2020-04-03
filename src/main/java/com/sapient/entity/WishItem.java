package com.sapient.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="WishItems")
public class WishItem {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="wishItemId", unique=true,updatable=false,nullable=false)
	private Long wishItemId;
	
	@ManyToOne
	@JoinColumn(name="wishListId", referencedColumnName="wishListId")
	private WishList wishList;
	
	@ManyToOne
	@JoinColumn(name="isbn", referencedColumnName="isbn")
	private Book book;

	public Long getWishItemId() {
		return wishItemId;
	}

	public void setWishItemId(Long wishItemId) {
		this.wishItemId = wishItemId;
	}

	public WishList getWishList() {
		return wishList;
	}

	public void setWishList(WishList wishList) {
		this.wishList = wishList;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	
	
	
}
