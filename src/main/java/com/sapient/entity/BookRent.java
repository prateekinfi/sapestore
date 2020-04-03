package com.sapient.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "BookRent")
public class BookRent implements Comparable<BookRent>{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "bookRentId", unique = true, updatable = false, nullable = false)
	private Long bookRentId;

	@Column(name = "isReturned")
	private boolean isReturned;

	@Column(name = "returnDate")
	private Date returnDate;

	@ManyToOne
	@JoinColumn(name = "userId", referencedColumnName = "userId")
	private Users user;

	@ManyToOne
	@JoinColumn(name = "isbn", referencedColumnName = "isbn")
	private Book book;

	@ManyToOne
	@JoinColumn(name = "orderId", referencedColumnName = "orderId")
	private UserOrder userOrder;
	
	
	@Column(name = "lastModifiedDate")
	@UpdateTimestamp
	private Date lastModifiedDate;

	@Column(name = "createdDate", updatable = false)
	@CreationTimestamp
	private Date createdDate;

	@Column(name="isLateFeePaid")
	private boolean isLateFeePaid;
	
	public BookRent() {
		isReturned = false;
	}

	public Long getBookRentId() {
		return bookRentId;
	}

	public void setBookRentId(Long bookRentId) {
		this.bookRentId = bookRentId;
	}

	public boolean isReturned() {
		return isReturned;
	}

	public void setReturned(boolean isReturned) {
		this.isReturned = isReturned;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
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

	public UserOrder getUserOrder() {
		return userOrder;
	}

	public void setUserOrder(UserOrder userOrder) {
		this.userOrder = userOrder;
	}

	public boolean isLateFeePaid() {
		return isLateFeePaid;
	}

	public void setLateFeePaid(boolean isLateFeePaid) {
		this.isLateFeePaid = isLateFeePaid;
	}
	
	@Override
	public int compareTo(BookRent o) {
		if(this.userOrder.getOrderId()>o.getUserOrder().getOrderId()){
			return -1;
		}
		else{
			return 1;
		}
		
	} 

	
	
}
