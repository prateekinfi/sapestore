package com.sapient.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "transactionHistory")
public class TransactionHistory implements Comparable<TransactionHistory> {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "uniqueNo", unique = true, updatable = false, nullable = false)
	private Long uniqueNo;
	
	@Column(name = "orderId")
	private Long orderId;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "lastModifiedDate")
	@UpdateTimestamp
	private Date lastModifiedDate;

	@Column(name = "createdDate", updatable = false)
	@CreationTimestamp
	private Date createdDate;

	public Long getUniqueNo() {
		return uniqueNo;
	}

	public void setUniqueNo(Long uniqueNo) {
		this.uniqueNo = uniqueNo;
	}

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

	@Override
	public int compareTo(TransactionHistory o) {
		return o.getUniqueNo().compareTo(this.getUniqueNo());
	}
	
	
	
}
