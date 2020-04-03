package com.sapient.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "userOrder")
public class UserOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "orderId", unique = true, updatable = false, nullable = false)
	private Long orderId;

	@Column(name = "status")
	private String status;

	@Column(name = "paymentMode")
	private String paymentMode;

	@Column(name = "price")
	private Float price;

	@Column(name = "isActive")
	private boolean isActive;

	@ManyToOne
	@JoinColumn(name = "userId", referencedColumnName = "userId")
	private Users user;

	@OneToMany(mappedBy = "order" , fetch=FetchType.EAGER)
	private Set<OrderDetails> orderDetails;

	

	@OneToOne
	@JoinColumn(name="shippingAddressId",referencedColumnName="shippingId")
	private ShippingAddress shippingAddress;
	
	@Column(name = "lastModifiedDate")
	@UpdateTimestamp
	private Date lastModifiedDate;

	@Column(name = "createdDate", updatable = false)
	@CreationTimestamp
	private Date createdDate;

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Set<OrderDetails> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetails> orderDetails) {
		this.orderDetails = orderDetails;
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

	public ShippingAddress getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(ShippingAddress shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

}
