package com.sapient.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="Country")
public class Country {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="countryId", unique=true,updatable=false,nullable=false)
	private Long countryId;
	
	@Column(name="countryName")
	private String countryName;
	
	@Column(name="lastModifiedDate")
	@UpdateTimestamp
	private Date lastModifiedDate;
	
	@Column(name="createdDate",updatable=false)
	@CreationTimestamp
	private Date createdDate;
	
	@OneToMany(mappedBy="country")
	private Set<State> states; 
	
	@OneToMany(mappedBy="country")
	private Set<Users> users;
	
	@OneToMany(mappedBy="country")
	private Set<ShippingAddress> shippingAddress;
	
	public Long getCountryId() {
		return countryId;
	}

	public void setCountryId(Long countryId) {
		this.countryId = countryId;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
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

	public Set<State> getStates() {
		return states;
	}

	public void setStates(Set<State> states) {
		this.states = states;
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
	
	
	
}
