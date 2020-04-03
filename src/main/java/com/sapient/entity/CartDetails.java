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
@Table(name = "CartDetails")
public class CartDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "cartDetailsId", unique = true, updatable = false, nullable = false)
	private Long cartDetailsId;
	
	@Column(name="isbn")
	private String isbn;
	
	@Column(name="purchaseType")
	private Integer purchaseType;
	
	@Column(name="quantity")
	private Integer quantity;

	@ManyToOne
	@JoinColumn(name="cartId", referencedColumnName="cartId")
	private UserCart userCart;
	
	public Long getCartDetailsId() {
		return cartDetailsId;
	}

	public void setCartDetailsId(Long cartDetailsId) {
		this.cartDetailsId = cartDetailsId;
	}

	
	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public Integer getPurchaseType() {
		return purchaseType;
	}

	public void setPurchaseType(Integer purchaseType) {
		this.purchaseType = purchaseType;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public UserCart getUserCart() {
		return userCart;
	}

	public void setUserCart(UserCart userCart) {
		this.userCart = userCart;
	}
	
	
	
}
