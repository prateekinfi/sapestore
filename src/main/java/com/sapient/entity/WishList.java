package com.sapient.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="WishList")

public class WishList {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="wishListId", unique=true,updatable=false,nullable=false)
	private Long wishListId;
	
	@OneToOne
	@JoinColumn(name="userId",referencedColumnName="userId")
	Users user;
	
	@Column(name="lastModifiedDate")
	@UpdateTimestamp
	private Date lastModifiedDate;
	
	@Column(name="createdDate", updatable=false)
	@CreationTimestamp
	private Date createdDate;
	
	@OneToMany(mappedBy="wishList")
	private Set<WishItem> wishItem;

	public Long getWishListId() {
		return wishListId;
	}

	public void setWishListId(Long wishListId) {
		this.wishListId = wishListId;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Set<WishItem> getWishItem() {
		return wishItem;
	}

	public void setWishItem(Set<WishItem> wishItem) {
		this.wishItem = wishItem;
	} 
	
	
}
