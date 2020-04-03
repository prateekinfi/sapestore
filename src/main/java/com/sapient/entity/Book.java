package com.sapient.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "Books")
public class Book {
	@Column(name = "bookTitle")
	private String bookTitle;

	@Column(name = "author")
	private String author;

	@Column(name = "publisher")
	private String publisher;

	@Id
	@Column(name = "isbn")
	private String isbn;

	@Column(name = "fullImage")
	private String fullImage;

	@Column(name = "thumbImage")
	private String thumbImage;

	@Column(name = "sellPrice")
	private Double sellPrice;

	@Column(name = "rentPrice")
	private Double rentPrice;

	@Column(name = "lateFees")
	private Double lateFees;

	@Column(name = "shortDesc")
	private String shortDesc;

	@Column(name = "averageRating")
	private float averageRating;

	@ManyToOne
	@JoinColumn(name = "categoryId", referencedColumnName = "categoryId")
	private Category category;

	@Column(name = "lastModifiedDate")
	@UpdateTimestamp
	private Date lastModifiedDate;

	@Column(name = "createdDate", updatable = false)
	@CreationTimestamp
	private Date createdDate;

	@OneToOne(mappedBy = "book")
	private Inventory inventory;

	@OneToMany(mappedBy = "book")
	private Set<WishItem> wishItem;

	@OneToMany(mappedBy = "book")
	private Set<OrderDetails> orderDetails;

	@OneToMany(mappedBy = "book")
	private Set<BookRent> bookRent;

	public Book() {
		// TODO Auto-generated constructor stub

	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getFullImage() {
		return fullImage;
	}

	public void setFullImage(String fullImage) {
		this.fullImage = fullImage;
	}

	public String getThumbImage() {
		return thumbImage;
	}

	public void setThumbImage(String thumbImage) {
		this.thumbImage = thumbImage;
	}

	public Double getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(Double sellPrice) {
		this.sellPrice = sellPrice;
	}

	public Double getRentPrice() {
		return rentPrice;
	}

	public void setRentPrice(Double rentPrice) {
		this.rentPrice = rentPrice;
	}

	public String getShortDesc() {
		return shortDesc;
	}

	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
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

	public Inventory getInventory() {
		return inventory;
	}

	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}

	public float getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(float averageRating) {
		this.averageRating = averageRating;
	}

	public Set<WishItem> getWishItem() {
		return wishItem;
	}

	public void setWishItem(Set<WishItem> wishItem) {
		this.wishItem = wishItem;
	}

	public Set<OrderDetails> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetails> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Double getLateFees() {
		return lateFees;
	}

	public void setLateFees(Double lateFees) {
		this.lateFees = lateFees;
	}

	public Set<BookRent> getBookRent() {
		return bookRent;
	}

	public void setBookRent(Set<BookRent> bookRent) {
		this.bookRent = bookRent;
	}

}
