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
@Table(name="orderDetails")
public class OrderDetails {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="orderDetailId", unique=true,updatable=false,nullable=false)
	private Long orderDetailId;
	
	@ManyToOne
	@JoinColumn(name="orderId",referencedColumnName="orderId")
	private UserOrder order;
	
	@Column(name="quantity")
	private Integer quantity;
	
	@Column(name="itemPrice")
	private Float itemPrice;
	
	@Column(name="purchaseType")
	private boolean purchaseType;
	
	@ManyToOne
	@JoinColumn(name="isbn", referencedColumnName="isbn")
	private Book book;
	
	
	@Column(name="lastModifiedDate")
	@UpdateTimestamp
	private Date lastModifiedDate;
	
	@Column(name="createdDate", updatable=false)
	@CreationTimestamp
	private Date createdDate;

	public Long getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(Long orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public UserOrder getOrder() {
		return order;
	}

	public void setOrder(UserOrder order) {
		this.order = order;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Float getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(Float itemPrice) {
		this.itemPrice = itemPrice;
	}

	public boolean isPurchaseType() {
		return purchaseType;
	}

	public void setPurchaseType(boolean purchaseType) {
		this.purchaseType = purchaseType;
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
	
	
	
}
