package com.sapient.entity;

import java.time.Duration;
import java.time.LocalDateTime;

public class Review implements Comparable<Review>{

	private String userName;
	private Double rating;
	private String review;
	private LocalDateTime date;
	private String isbn;
	
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public Double getRating() {
		return rating;
	}
	public void setRating(Double rating) {
		this.rating = rating;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public LocalDateTime getDate() {
		return date;
	}
	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	@Override
	public int compareTo(Review o) {
		
		return o.getDate().toString().compareTo(this.getDate().toString());
	}
	
	
	
	
	
	
}
