package com.sapient.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "Inventory")
public class Inventory {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "uniqueNo", unique = true, updatable = false, nullable = false)
	private Long uniqueNo;
	@OneToOne
	@JoinColumn(name = "isbn", referencedColumnName = "isbn")
	private Book book;

	@Column(name = "rentQuantity")
	private Integer rentQuantity;
	@Column(name = "purchaseQuantity")
	private Integer purchaseQuantity;
	
	@Column(name="isForRent")
	private boolean isForRent;
	

	@Column(name="isForPurchase")
	private boolean isForPurchase;

	@Column(name = "lastModifiedDate")
	@UpdateTimestamp
	private Date lastModifiedDate;

	@Column(name = "createdDate", updatable = false)
	@CreationTimestamp
	private Date createdDate;

	public Inventory() {
		// TODO Auto-generated constructor stub

	}

	public Long getUniqueNo() {
		return uniqueNo;
	}

	public void setUniqueNo(Long uniqueNo) {
		this.uniqueNo = uniqueNo;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
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

	public Integer getRentQuantity() {
		return rentQuantity;
	}

	public void setRentQuantity(Integer rentQuantity) {
		this.rentQuantity = rentQuantity;
	}

	public Integer getPurchaseQuantity() {
		return purchaseQuantity;
	}

	public void setPurchaseQuantity(Integer purchaseQuantity) {
		this.purchaseQuantity = purchaseQuantity;
	}

	public boolean isForRent() {
		return isForRent;
	}

	public void setForRent(boolean isForRent) {
		this.isForRent = isForRent;
	}

	public boolean isForPurchase() {
		return isForPurchase;
	}

	public void setForPurchase(boolean isForPurchase) {
		this.isForPurchase = isForPurchase;
	}
	
	
}
