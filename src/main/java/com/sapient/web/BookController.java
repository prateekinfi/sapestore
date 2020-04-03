package com.sapient.web;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sapient.dao.IDao;
import com.sapient.dao.ISubscriptionDao;
import com.sapient.entity.Book;
import com.sapient.entity.Category;
import com.sapient.entity.Login;
import com.sapient.entity.Review;
import com.sapient.entity.Subscription;


@Controller
@PropertySource("classpath:sapestore.properties")
public class BookController {

	Logger logger = LoggerFactory.getLogger("sapestore");
	@Autowired
	private IDao dao;
	
	@Autowired
	private ISubscriptionDao subUser;
	
	@Value("${photo_folder_thumbs}")
	private String photo_folder_thumbs;
	
	@Value("${photo_folder_full}")
	private String photo_folder_full;
	
	@Autowired
	ReviewRestController reviewRestController;
	
	@RequestMapping("viewBooksbyCategory")
	public String getBookByCategories(@RequestParam("categoryId") Long categoryId, Model model){
		List<Book> booklist=dao.getBooksbyCategory(categoryId);
		model.addAttribute("booklist",booklist);
		model.addAttribute("catname", dao.getCategoryName(categoryId));
		getCategories(model);
		return "BookByCategory";
	}
	
	
	
	/*@RequestMapping("viewdetails")
	public String getBookDetails(@RequestParam("isbn") String isbn, Model model,HttpServletRequest req){
		HttpSession sess=req.getSession(false);
		Login login=(Login) sess.getAttribute("login");
		int flag=0;
		Book book=dao.getBook(isbn);
		model.addAttribute("book",book);
		getCategories(model);
		model.addAttribute("description", reviewRestController.getDescription(isbn));
		List<Review> reviews=reviewRestController.getReviews(isbn);
		model.addAttribute("reviews", reviews);
		model.addAttribute("review_count", reviews.size());
		
		if(reviews.size()>0 && login!=null){
			for (Review review : reviews) {
				if(review.getUserName().equals(login.getUserName())){
					model.addAttribute("ownreview", review.getReview());
					flag=1;
				}
				
			}
		}
		model.addAttribute("flag", flag);
		
		return "BookDetails";
	}*/
	
	@RequestMapping("viewdetails")
	public String getBookDetails(@RequestParam("isbn") String isbn, Model model,HttpServletRequest req){
		HttpSession sess=req.getSession(false);
		Login login = null;
		if(sess!=null)	
	      login=(Login) sess.getAttribute("login");
		int flag=0;
		Book book=dao.getBook(isbn);
		
		logger.debug("book received {}", book);
		
		List<Subscription> subscribe = subUser.getSubscribedUsersByIsbn(isbn);
		
		
		logger.debug("in book controller");
		
		int purquan = book.getInventory().getPurchaseQuantity();
		
		model.addAttribute("purQuan", purquan); 
		
		logger.debug("purchase quantity {}", purquan);
		
		int rentquan = book.getInventory().getRentQuantity();
		
		model.addAttribute("rentQuan", rentquan);
		
		logger.debug("rent quantity {}", rentquan); 
		
		model.addAttribute("book",book);
		getCategories(model);
		model.addAttribute("description", reviewRestController.getDescription(isbn));
		List<Review> reviews=reviewRestController.getReviews(isbn);
		model.addAttribute("reviews", reviews);
		if(reviews!=null){
			model.addAttribute("review_count", reviews.size());
			if(reviews.size()>0 && login!=null){
				for (Review review : reviews) {
					if(review.getUserName().equals(login.getUserName())){
						model.addAttribute("ownreview", review.getReview());
						model.addAttribute("ownrating", review.getRating());
						logger.debug("ratings {}:",review.getRating());
						flag=1;
					}
					
				}
			}
		}
		
		else
			model.addAttribute("review_count", 0);
	
		
		model.addAttribute("flag", flag);
		
		return "BookDetails";
	}
	
	
	
	@RequestMapping("addreview")
	public String addReview(@RequestParam("isbn")String isbn,@RequestParam("rating")Double rating,@RequestParam("review")String review,@RequestParam("username")String username,Model model,HttpServletRequest req){
		reviewRestController.addReview(username, isbn, rating, review);
		return getBookDetails(isbn, model,req);
	}
	
	
	public void getCategories(Model model){
		List<Category> catlist = dao.getCategories();
		model.addAttribute("catlist",catlist);
	}
	
	
	@RequestMapping(value = "img")
	public void downimg(@RequestParam("bookimg") String img, HttpServletResponse resp) {
		resp.setContentType("image/jpg");
		FileInputStream fis;
		try {
			if(img.contains("thumb"))
			    fis = new FileInputStream(photo_folder_thumbs + img);
			else
				fis = new FileInputStream(photo_folder_full + img);
			ServletOutputStream out = resp.getOutputStream();
			byte[] arr = new byte[fis.available()];
			fis.read(arr);
			out.write(arr);
			out.flush();// output stream should not be closed it should be
						// flushed
			fis.close();
		} catch (FileNotFoundException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
	}

	
	
}
