package com.sapient.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sapient.dao.IInventoryDao;
import com.sapient.entity.Book;

@Controller
public class AdminController {

	@Autowired
	IInventoryDao dao;
	
	@RequestMapping("admin")
	public String getBooks(@RequestParam(value="pgno", required=false )Integer pgno,
							Model model,
							HttpServletRequest req) throws Exception {
		
		List<Book> lst = dao.getBooks();
		//model.addAttribute("booklist", lst);
		if(pgno==null)
			pgno=1;
		return PrepareBookList(lst, model, pgno, "/sapestore/admin?");
	}
	
	public String PrepareBookList(List<Book> lst,Model model,int pgno,String pgurl){
		int end=pgno*5;
		int start=end-5;
		if(end>=lst.size())
			end=lst.size();

		int pgs=(int)Math.ceil(lst.size()/5.0);
		List<Book> sublist=lst.subList(start, end);
		
		if(sublist.size()==0 && pgno!=1){
			PrepareBookList(lst, model, --pgno, pgurl);
		}
		List<Integer> plist = new ArrayList<>();
		for (int i = 1; i < pgs+1; i++) {
			plist.add(i);
		}
		model.addAttribute("plist",plist); 
		model.addAttribute("currpg", pgno);
		model.addAttribute("totpgs",pgs);
		model.addAttribute("blist",sublist);
		model.addAttribute("pgurl", pgurl);
		return "Inventory";
	}
}
