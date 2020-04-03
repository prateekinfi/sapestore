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
@Table(name="State")
public class State {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="stateId", unique=true,updatable=false,nullable=false)
	private Long stateId;
	
	@Column(name="stateName")
	private String stateName;
	
	@Column(name="lastModifiedDate")
	@UpdateTimestamp
	private Date lastModifiedDate;
	
	@Column(name="createdDate",updatable=false)
	@CreationTimestamp
	private Date createdDate;
	
	@ManyToOne
	@JoinColumn(name="countryId", referencedColumnName="countryId")
	private Country country;
	
	@OneToMany(mappedBy="state")
	private Set<Users> users;
	
	@OneToMany(mappedBy="state")
	private Set<City> cities;
	
	@OneToMany(mappedBy="state")
	private Set<ShippingAddress> shippingAddress;
	
	public Long getStateId() {
		return stateId;
	}

	public void setStateId(Long stateId) {
		this.stateId = stateId;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
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

	public Set<City> getCities() {
		return cities;
	}

	public void setCities(Set<City> cities) {
		this.cities = cities;
	}
	
	
	
}
