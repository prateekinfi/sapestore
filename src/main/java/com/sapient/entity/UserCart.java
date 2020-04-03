package com.sapient.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "UserCart")
public class UserCart {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="cartId", unique = true, updatable = false, nullable = false)
	private Long cartId;
	
	@Column(name = "userId", unique = true)
	private Long userId;

	@OneToMany(mappedBy="userCart")
	private List<CartDetails> cartDetails;
	
	public Long getCartId() {
		return cartId;
	}

	public void setCartId(Long cartId) {
		this.cartId = cartId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public List<CartDetails> getCartDetails() {
		return cartDetails;
	}

	public void setCartDetails(List<CartDetails> cartDetails) {
		this.cartDetails = cartDetails;
	}
	
}
