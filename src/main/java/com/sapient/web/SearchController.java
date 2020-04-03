package com.sapient.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sapient.dao.DaoImpl;
import com.sapient.entity.Book;
import com.sapient.entity.Category;
import com.sapient.entity.Review;

@Controller
public class SearchController {
	Logger logger = LoggerFactory.getLogger("sapestore");
	@Autowired
	DaoImpl dao;

	@Autowired
	ReviewRestController reviewRestController;
	
	@RequestMapping("searchpage")
	public String searchpage(@RequestParam(value = "pgno", required = false) Integer pgno, Model model) {
		List<Book> lst = dao.getTopBooks();
		lst=lst.stream().sorted(Comparator.comparing(Book::getAverageRating).reversed()).collect(Collectors.toList()); 
		if (pgno == null)
			pgno = 1;
		return PrepareBookList(lst, model, pgno, "/sapestore/searchpage?");
	}
	
	int getReviewCount(String isbn){
		List<Review> reviews=reviewRestController.getReviews(isbn);
		if(reviews==null)
			return 0;
		return reviews.size();
	}

	@RequestMapping("search")
	public String getBooks(@RequestParam(value= "mostcomments",required=false) String combox,
			@RequestParam(value = "pgno", required = false) Integer pgno,
			@RequestParam("bookTitle") String bookTitle, @RequestParam("bookAuthor") String bookAuthor,
			@RequestParam("isbn") String isbn, @RequestParam("CatId") String catId,
			@RequestParam("bookPublisher") String bookPublisher, Model model) {
		Long cat;
		logger.debug("cat Id:{}",catId);
		if (catId.equals("select")){
			logger.debug("cartId is 0");
			cat = 0L;
		}
		else{
			logger.debug("in else{}:",catId);
			cat = Long.parseLong(catId);
		}
		
		List<Book> lst = dao.getSearch(bookTitle.trim(), bookAuthor.trim(), isbn.trim(), cat, bookPublisher.trim());
		lst=lst.stream().sorted(Comparator.comparing(Book::getAverageRating).reversed()).collect(Collectors.toList());
		if(combox!=null){
		if(combox.equals("mc")){	
			Collections.sort(lst, new Comparator<Book>() {
				@Override
				public int compare(Book o1, Book o2) {
					return (getReviewCount(o2.getIsbn())-getReviewCount(o1.getIsbn()));
				}
			});
			/*for (Book book : lst) {
				System.out.println(book.getBookTitle()+"	^	"+getReviewCount(book.getIsbn()));
			}*/
		}		
		
		}
		String message = "";
		if (lst == null) {
			message = "Your keywords does not match any available product";
		}
		model.addAttribute("msg", message);
		model.addAttribute("list", lst);
		model.addAttribute("booktitle",bookTitle);
		model.addAttribute("bookauthor",bookAuthor);
		model.addAttribute("isbn", isbn);
		model.addAttribute("bookpublisher", bookPublisher); 
		
			model.addAttribute("catId", catId);
		/*else
			model.addAttribute("catId", cat);*/

		model.addAttribute("searchsize", lst.size());
		if (pgno == null)
			pgno = 1;
		return PrepareBookList(lst, model, pgno, "/sapestore/search?bookTitle=" + bookTitle + "&bookAuthor=" + bookAuthor
				+ "&isbn=" + isbn + "&CatId=" + catId + "&bookPublisher="+bookPublisher+"&mostcomments="+combox+"&");
	}

	public String PrepareBookList(List<Book> lst, Model model, int pgno, String pgurl) {
		int end = pgno * 10;
		int start = end - 10;
		if (end >= lst.size())
			end = lst.size();

		int pgs = (int) Math.ceil(lst.size() / 10.0);
		List<Book> sublist = lst.subList(start, end);
		/*
		 * lst.sort((e1,e2)->{ return
		 * ((Integer)e1.getEmpId()).compareTo(e2.getEmpId()); });
		 */
		List<Integer> plist = new ArrayList<>();
		for (int i = 1; i <= pgs; i++) {
			plist.add(i);
		}
		model.addAttribute("plist",plist); 
		model.addAttribute("currpg", pgno);
		model.addAttribute("totpgs", pgs);
		model.addAttribute("blist", sublist);
		model.addAttribute("pgurl", pgurl);
		getCategories(model);
		return "Search";
	}

	public void getCategories(Model model) {
		List<Category> catlist = dao.getCategories();
		model.addAttribute("catlist", catlist);
	}
}