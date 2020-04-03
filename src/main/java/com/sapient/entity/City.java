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
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "City")
public class City {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "cityId", unique = true, updatable = false, nullable = false)
	private Long cityId;

	@Column(name = "cityName")
	private String cityName;

	@Column(name = "postalCode")
	private String postalCode;

	@ManyToOne
	@JoinColumn(name = "stateId", referencedColumnName = "stateId")
	private State state;

	@Column(name = "lastModifiedDate")
	@UpdateTimestamp
	private Date lastModifiedDate;

	@Column(name = "createdDate", updatable = false)
	@CreationTimestamp
	private Date createdDate;

	@OneToMany(mappedBy = "city")
	private Set<Users> users;

	@OneToMany(mappedBy = "city")
	private Set<ShippingAddress> shippingAddress;

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
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

	public Set<Users> getUsers() {
		return users;
	}

	public void setUsers(Set<Users> users) {
		this.users = users;
	}

	public Set<ShippingAddress> getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(Set<ShippingAddress> shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

}
