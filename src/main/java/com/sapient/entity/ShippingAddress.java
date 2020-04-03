package com.sapient.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="shippingAddress")
public class ShippingAddress {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="shippingId", unique=true,updatable=false,nullable=false)
	private Long shippingId;
	
	@ManyToOne
	@JoinColumn(name="userId", referencedColumnName="userId")
	private Users user;
	
	@OneToOne(mappedBy = "shippingAddress")
	private UserOrder userOrder;
	
	@Column(name="mail")
	private String mail;
	
	@Column(name="mobile")
	private String mobile;
	
	@Column(name="addressLine1")
	private String addressLine1;
	
	@Column(name="addressLine2")
	private String addressLine2;
	
	@ManyToOne
	@JoinColumn(name="cityId", referencedColumnName="cityId")
	private City city;
	
	@ManyToOne
	@JoinColumn(name="stateId", referencedColumnName="stateId")
	private State state;
	
	@ManyToOne
	@JoinColumn(name="countryId", referencedColumnName="countryId")
	private Country country;
	
	@Column(name="postalCode")
	private String postalCode;
	
	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	@Column(name="lastModifiedDate")
	@UpdateTimestamp
	private Date lastModifiedDate;
	
	@Column(name="createdDate", updatable=false)
	@CreationTimestamp
	private Date createdDate;

	public Long getShippingId() {
		return shippingId;
	}

	public void setShippingId(Long shippingId) {
		this.shippingId = shippingId;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	
	public UserOrder getUserOrder() {
		return userOrder;
	}

	public void setUserOrder(UserOrder userOrder) {
		this.userOrder = userOrder;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
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
