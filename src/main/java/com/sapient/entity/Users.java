package com.sapient.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name = "Users")
public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "userId", unique = true, updatable = false, nullable = false)
	private Long userId;

	@Column(name = "firstName")
	private String firstName;

	@Column(name = "lastName")
	private String lastName;

	@Column(name = "gender")
	private Boolean gender;

	@Column(name = "mail", unique = true)
	private String mail;

	@Column(name = "mobile")
	private String mobile;

	@Column(name = "addressLine1")
	private String addressLine1;

	@Column(name = "addressLine2")
	private String addressLine2;

	@ManyToOne
	@JoinColumn(name = "cityId", referencedColumnName = "cityId")
	private City city;

	@ManyToOne
	@JoinColumn(name = "stateId", referencedColumnName = "stateId")
	private State state;

	@ManyToOne
	@JoinColumn(name = "countryId", referencedColumnName = "countryId")
	private Country country;

	@Column(name = "isAdmin")
	private Boolean isAdmin;

	@Column(name = "lastModifiedDate")
	@UpdateTimestamp
	private Date lastModifiedDate;

	@Column(name = "createdDate", updatable = false)
	@CreationTimestamp
	private Date createdDate;

	@OneToOne(mappedBy = "user")
	private Login login;

	@OneToMany(mappedBy = "user")
	private Set<UserOrder> order;

	@OneToMany(mappedBy = "user")
	private Set<ShippingAddress> shippingAddress;

	@OneToMany(mappedBy = "user")
	private Set<BookRent> bookRent;
	
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
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
	
	public Boolean getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
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

	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	public Set<UserOrder> getOrder() {
		return order;
	}

	public void setOrder(Set<UserOrder> order) {
		this.order = order;
	}

	public Set<ShippingAddress> getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(Set<ShippingAddress> shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public Set<BookRent> getBookRent() {
		return bookRent;
	}

	public void setBookRent(Set<BookRent> bookRent) {
		this.bookRent = bookRent;
	}

	@Override
	public String toString() {
		return "Users [userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + "]";
	}
	
	
	

}
