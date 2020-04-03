package com.sapient.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Login {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "loginId", unique = true, updatable = false, nullable = false)
	private Long loginId;

	@Column(name = "userName", unique = true)
	private String userName;
	@Column(name = "userPassword")
	private String userPassword;

	@Column(name = "tokenId")
	private String tokenId;

	@Column(name = "isVerified")
	private boolean isVerified;
	
	@Column(name = "isActive")
	private Boolean isActive;
	
	@Column(name = "otp")
	private Integer otp;

	@Column(name = "lastModifiedDate")
	@UpdateTimestamp
	private Date lastModifiedDate;

	@Column(name = "createdDate", updatable = false)
	@CreationTimestamp
	private Date createdDate;
	
	@Column(name = "tokenGeneratedDate")
	private Date tokenGeneratedDate;

	@OneToOne
	@JoinColumn(name = "userId", referencedColumnName = "userId")
	private Users user;

	public Long getLoginId() {
		return loginId;
	}

	public void setLoginId(Long loginId) {
		this.loginId = loginId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getTokenId() {
		return tokenId;
	}

	public void setTokenId(String tokenId) {
		this.tokenId = tokenId;
	}

	public boolean isVerified() {
		return isVerified;
	}

	public void setVerified(boolean isVerified) {
		this.isVerified = isVerified;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Integer getOtp() {
		return otp;
	}

	public void setOtp(Integer otp) {
		this.otp = otp;
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

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}
	

	public Date getTokenGeneratedDate() {
		return tokenGeneratedDate;
	}

	public void setTokenGeneratedDate(Date tokenGeneratedDate) {
		this.tokenGeneratedDate = tokenGeneratedDate;
	}

	@Override
	public String toString() {
		return "Login [loginId=" + loginId + ", userName=" + userName + "]";
	}
	
	

	

}
