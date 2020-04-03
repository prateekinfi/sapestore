package com.sapient.web;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sapient.dao.IDao;
import com.sapient.entity.Book;
import com.sapient.entity.Category;


@Controller
public class MainController {

	private Logger logger=LoggerFactory.getLogger("bookstore");

	@Autowired
	private IDao dao;
	
	/*************************************************/
	@Value("${domain}")
	private String domain;
	/*************************************************/
	@RequestMapping(value="/")
	public String getMainpage(@RequestParam(value="pgno", required=false )Integer pgno,
			Model model){
		List<Book> lst=dao.getTopBooks();
		lst=lst.stream().sorted(Comparator.comparing(Book::getAverageRating).reversed()).collect(Collectors.toList());
		model.addAttribute("toplist",lst);
		
		if(pgno==null)
			pgno=1;
		getCategories(model);
		
		return PrepareBookList(lst, model, pgno, "/sapestore/?");
	}

	public String PrepareBookList(List<Book> lst,Model model,int pgno,String pgurl){
		int end=pgno*15;
		int start=end-15;
		if(end>=lst.size())
			end=lst.size();

		int pgs=(int)Math.ceil(lst.size()/15.0);
		List<Book> sublist=lst.subList(start, end);
		/*lst.sort((e1,e2)->{
			return ((Integer)e1.getEmpId()).compareTo(e2.getEmpId());
		});*/
		List<Integer> plist = new ArrayList<>();
		if(pgs>1){
		for (int i = 1; i <= pgs; i++) {
			plist.add(i);
		}
		}
		model.addAttribute("plist",plist); 
		model.addAttribute("currpg", pgno);
		model.addAttribute("totpgs",pgs);
		model.addAttribute("blist",sublist);
		model.addAttribute("pgurl", pgurl);
		return "Home";
	}
	
	public void getCategories(Model model){
		List<Category> catlist = dao.getCategories();
		model.addAttribute("catlist",catlist);
	}
	@RequestMapping("contact")
	public String privacyPolicy(Model model){
		getCategories(model);
		return "contactUs";
	}
	
	@RequestMapping("privacy")
	public String contactUs(Model model){
		getCategories(model);
		model.addAttribute("domain", domain);        /************************************************/
		return "privacyPolicy";
	}
}
