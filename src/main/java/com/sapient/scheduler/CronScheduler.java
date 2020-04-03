package com.sapient.scheduler;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.sapient.dao.ICustomerOrderDao;
import com.sapient.dao.IDao;
import com.sapient.dao.IInventoryDao;
import com.sapient.dao.ISubscriptionDao;
import com.sapient.dao.IUserDao;
import com.sapient.entity.Book;
import com.sapient.entity.BookRent;
import com.sapient.entity.Inventory;
import com.sapient.entity.Review;
import com.sapient.entity.Subscription;
import com.sapient.entity.Users;
import com.sapient.service.IEmailService;

@Component
@PropertySource("classpath:sapestore.properties")
public class CronScheduler {

	Logger logger = LoggerFactory.getLogger("sapestore");

	@Autowired
	private MongoClient mongoClient;

	@Value("${adminMail}")
	private String adminMail;
	
	@Value("${domain}")
	private String domain;

	@Value("${inventorySubject}")
	private String inventorySubject;

	@Value("${inventoryMessage}")
	private String inventoryMessage;

	@Value("${inventoryAlertQty}")
	private int inventoryAlertQty;

	@Value("${subscriptionSubject}")
	private String subscriptionSubject;

	@Value("${subscriptionMessage}")
	private String subscriptionMessage;
	
	@Value("${dueDateReminder}")
	private String dueDateReminder;
	
	@Value("${dueDateReminder1}")
	private String dueDateReminder1;

	@Autowired
	private IDao dao;

	@Autowired
	private IInventoryDao inventorydao;

	@Autowired
	private IEmailService emailSer;

	@Autowired
	private ISubscriptionDao subscriptionDao;

	@Autowired
	private IUserDao userdao;
	
	@Autowired
	private ICustomerOrderDao cdao; 

	@Scheduled(fixedRate = 1000 * 60 * 60)
	public void calculateAverageRating() {
		try {
			List<Review> reviews = new ArrayList<>();
			DB db = mongoClient.getDB("sapestoremongodb");
			DBCollection tbl = db.getCollection("review");

			DBCursor cursor = tbl.find();
			DBObject row = null;
			while (cursor.hasNext()) {
				row = cursor.next();
				Review review = new Review();
				review.setIsbn((String) row.get("isbn"));
				review.setRating((Double) row.get("rating"));
				reviews.add(review);
			}
			reviews = reviews.stream().sorted(Comparator.comparing(Review::getIsbn)).collect(Collectors.toList());
			Review[] rev = reviews.toArray(new Review[reviews.size()]);
			Double avg = 0.0;
			int count = 0;

			for (int i = 0; i < rev.length; i++) {
				if (i == rev.length - 1) {
					count++;
					avg += rev[i].getRating();
					avg /= count;
					avg *= 100;
					avg = (double) Math.round(avg);
					avg /= 100;
					dao.updateAverageRating(rev[i].getIsbn(), avg);
					break;
				}
				if (rev[i].getIsbn().equals(rev[i + 1].getIsbn())) {
					avg += rev[i].getRating();
					count++;
				} else {
					count++;
					avg += rev[i].getRating();
					avg /= count;
					avg *= 100;
					avg = (double) Math.round(avg);
					avg /= 100;
					dao.updateAverageRating(rev[i].getIsbn(), avg);

					avg = 0.0;
					count = 0;
				}
			}

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}

	}

	@Scheduled(fixedRate = 1000 * 60 * 60 * 24)
	public void sendMail() {
		List<Inventory> lst = inventorydao.getInventories();
		String msg = "<tr><th>Book</th><th>Purchase Quantity</th><th>Rent Quantity</th></tr>";
		for (Inventory inventory : lst) {
			if (inventory.getPurchaseQuantity() < inventoryAlertQty
					|| (inventory.getRentQuantity() < inventoryAlertQty && inventory.isForRent())) {
				msg += "<tr><td>" + inventory.getBook().getBookTitle() + " </td><td>" + inventory.getPurchaseQuantity()
						+ "</td><td>" + inventory.getRentQuantity() + "</td></tr>";
			}
		}
		logger.debug(msg);
		String values[] = { msg };
		// inventoryMessage=MessageFormat.format(inventoryMessage,values);
		emailSer.sendMail(adminMail, inventorySubject, MessageFormat.format(inventoryMessage, values));
	}

	@Scheduled(fixedRate = 1000 * 60 * 60 * 24)
	public void sendEmailSubscribedUsers() {
		List<String> isbns = subscriptionDao.getDistinctSubscriberBooks();
		logger.debug("isbns {}",isbns);
		if (isbns != null) {
			for (String isbn : isbns) {
				logger.debug(isbn);
				Book book = dao.getBook(isbn);
				if (book.getInventory().getPurchaseQuantity() > 0 || book.getInventory().getRentQuantity() > 0) {
					List<Subscription> subscribedUsers = subscriptionDao.getSubscribedUsersByIsbn(isbn);
					for (Subscription subscription : subscribedUsers) {
						Users user = userdao.getUser(subscription.getUserId());
						logger.debug("user :{}",user.getFirstName());
						String bookTitle = book.getBookTitle();
						String mail = user.getMail();
						String values[] = { user.getFirstName(),domain+"viewdetails?isbn="+isbn,bookTitle };
						emailSer.sendMail(mail, subscriptionSubject, MessageFormat.format(subscriptionMessage, values));
						subscriptionDao.removeSubscribedUser(user.getUserId(), isbn);
					}
				}
			}
		}

	}
	@Scheduled(fixedRate = 1000* 60 * 60 * 24 )
	public void sendMailToDefaulters(){
		List<BookRent> bookrent = new ArrayList<>(cdao.getBookRent());
		for(BookRent book:bookrent){
			if(book.isLateFeePaid()==false){
				Date date=new Date();
				String subject="SapeStore | Due Date Reminder";
				long duration =date.getTime() - book.getReturnDate().getTime();
				long diffInDays = TimeUnit.MILLISECONDS.toDays(duration);
				logger.debug("Difference in days: {}",diffInDays );
				String duedays=String.valueOf(diffInDays);
				logger.debug("Due days: {}",duedays); 				

				double latefine=0.0;
				logger.debug("parse value =  "+ Integer.parseInt(duedays));
				logger.debug("late fees =  "+book.getBook().getLateFees());
				if(Integer.parseInt(duedays) >0)
				latefine= book.getBook().getLateFees()*Integer.parseInt(duedays);
				
				
				logger.debug("latefine="+latefine+"");
				String params[]={book.getUser().getFirstName(),
						book.getUser().getLastName(),
						book.getUserOrder().getOrderId().toString(),
						book.getReturnDate().toString()};
				String params1[]={book.getUser().getFirstName(),
						book.getUser().getLastName(),
						book.getUserOrder().getOrderId().toString(),
						book.getReturnDate().toString(),String.valueOf(latefine)};
				
			if(Integer.parseInt(duedays)>=-2 ){
				
				if(Integer.parseInt(duedays)>7)
					duedays="exceedslimit";
				
				switch(duedays){
				
				
				case "-2":
					emailSer.sendMail(book.getUser().getMail(), subject,
							MessageFormat.format(dueDateReminder, params));		
					break;	
				
				case "0":
					emailSer.sendMail(book.getUser().getMail(), subject,
							MessageFormat.format(dueDateReminder, params));		
					break;
					
					//book.getUser().getMail()
				case "2":
					emailSer.sendMail(book.getUser().getMail(), subject,
							MessageFormat.format(dueDateReminder1, params1));		
					
					break;
						
				case "7":
					emailSer.sendMail(book.getUser().getMail(), subject,
							MessageFormat.format(dueDateReminder1, params1));							
					break;
					
				case "exceedslimit" :	
					emailSer.sendMail(book.getUser().getMail(), subject,
							MessageFormat.format(dueDateReminder1, params1));	
				}
				}
			}
		}
	}

}
