package com.sapient.web;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.sapient.entity.Review;

@RestController
public class ReviewRestController {

	Logger logger=LoggerFactory.getLogger("sapestore");
	
	@Autowired
	private MongoClient mongoClient;
	
	public String getDescription(String isbn){
		
		try{
			//MongoClient mongoClient= new MongoClient("10.203.60.37", 27017);
			DB db= mongoClient.getDB("sapestoremongodb");
			
			DBCollection tbl= db.getCollection("description");
			BasicDBObject criteria= new BasicDBObject();
			criteria.append("isbn", isbn);
			DBCursor cursor= tbl.find(criteria);
			DBObject row= null;
			while( cursor.hasNext()){
				row=cursor.next();
				
				return (String) row.get("desc");
			}
			
		}catch(Exception e){
			System.err.println(e.getClass().getName() +": "+e.getMessage());
		}
		
		return null;
	}
	
	
	public List<Review> getReviews(String isbn){
		try{
			logger.debug("inside mongo");
			//MongoClient mongoClient= new MongoClient("10.203.60.37", 27017);
			DB db= mongoClient.getDB("sapestoremongodb");
			DBCollection tbl= db.getCollection("review");
			BasicDBObject criteria= new BasicDBObject();
			criteria.append("isbn", isbn);
			DBCursor cursor= tbl.find(criteria);
			DBObject row= null;
			List<Review> reviews=new ArrayList<Review>();
			
			while( cursor.hasNext()){
				row=cursor.next();
				Review rev=new Review();
				rev.setUserName((String) row.get("username"));
				rev.setRating((Double)row.get("rating"));
				logger.debug((String)row.get("date"));
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
				cal.setTime(sdf.parse((String)row.get("date")));
				LocalDateTime localDateTime = toLocalDateTime(cal);
				rev.setDate(localDateTime);
				/*Date date=new SimpleDateFormat("yyyy MMM dd HH:mm:ss").parse((String)row.get("date"));
				logger.debug(date+"");*/
				/*Date date=new Date((String)row.get("date"));SimpleDateFormat sdf = new SimpleDateFormat("yyyy MMM dd HH:mm:ss"); 
				rev.setDate(date);*/
				rev.setReview((String)row.get("rev"));
				reviews.add(rev);
			}
			reviews=reviews.stream().sorted().collect(Collectors.toList());
			logger.debug(reviews.get(0)+"           aslkjdlasj");
			/*reviews=reviews.stream().sorted().collect(Collectors.toList());*/
			return reviews;
			
		}catch(Exception e){
			System.err.println(e.getClass().getName() +": "+e.getMessage());
		}
		return null;
	}
	
	public static LocalDateTime toLocalDateTime(Calendar calendar) {
	      if (calendar == null) {
	          return null;
	      }
	      TimeZone tz = calendar.getTimeZone();
	      ZoneId zid = tz == null ? ZoneId.systemDefault() : tz.toZoneId();
	      return LocalDateTime.ofInstant(calendar.toInstant(), zid);
	  }
	
	public void addReview(String username,String isbn,Double rating,String review){
		try{
			logger.debug("add reviews");
			logger.debug(isbn);
			/*Date date = Calendar.getInstance().getTime();  
			DateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy");  
			String strDate = dateFormat.format(date);  */
			
			String strDate=Calendar.getInstance().getTime().toString();
			
			
			DB db = mongoClient.getDB("sapestoremongodb");
			DBCollection tbl = db.getCollection("review");
			
			BasicDBObject criteria= new BasicDBObject();
			criteria.append("username", username);
			criteria.append("isbn", isbn);
			DBCursor cursor= tbl.find(criteria);
				if(cursor.size()==0){
					logger.debug("inside add review");
					BasicDBObject row = new BasicDBObject();
					row.put("rev", review);
					row.put("rating", rating);
					row.put("isbn", isbn);
					row.put("date", strDate);
					row.put("username", username);
					tbl.insert(row);
					
				}
				else{
					BasicDBObject searchQuery = new BasicDBObject();
					searchQuery=searchQuery.append("username", username);
					searchQuery=searchQuery.append("isbn", isbn);
					
					BasicDBObject newDocument1 = new BasicDBObject();
					newDocument1.append("rating", rating);
					newDocument1.append("rev", review);
					newDocument1.append("date", strDate);
					BasicDBObject newDocument=new BasicDBObject().append("$set", newDocument1);
					tbl.update(searchQuery, newDocument);					
					
				}
			
			
			
		}catch(Exception e){
			System.err.println(e.getClass().getName() +": "+e.getMessage());
		}
	}
	
public void addDescription(String isbn,String description){
		
		DB db = mongoClient.getDB("sapestoremongodb");
		DBCollection tbl = db.getCollection("description");
		BasicDBObject row = new BasicDBObject();
		row.put("isbn", isbn);
		row.put("desc", description);
		tbl.insert(row);
	}
	
	public void removeDescription(String isbn){
		
		DB db = mongoClient.getDB("sapestoremongodb");
		DBCollection tbl = db.getCollection("description");
		BasicDBObject query = new BasicDBObject();
		query.put("isbn", isbn);
		tbl.remove(query);

	}
	public void updateDescription(String isbn,String description) {
		
		DB db = mongoClient.getDB("sapestoremongodb");
		DBCollection tbl = db.getCollection("description");		
		BasicDBObject query = new BasicDBObject();
		query.put("isbn", isbn);	
		tbl.update(query, new BasicDBObject("$set", 
				new BasicDBObject("desc", description)));

	}
	
	
	
}
