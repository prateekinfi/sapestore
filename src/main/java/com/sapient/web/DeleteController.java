package com.sapient.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sapient.dao.IInventoryDao;
import com.sapient.entity.Login;

@Controller
public class DeleteController {

	@Autowired
	IInventoryDao dao;

	@Autowired
	ReviewRestController rc;

	@Autowired
	AdminController ac;

	private Logger logger = LoggerFactory.getLogger("sapestore");

	@RequestMapping("delete")
	public String deleteBook(@RequestParam("isbn") String isbn,
			@RequestParam(value = "pgno", required = false) Integer pgno, HttpServletRequest req, Model model)
			throws Exception {
		HttpSession sess = req.getSession(false);
		String message = "";
		if (sess != null) {
			Login login = (Login) sess.getAttribute("login");
			String use = dao.bookInUse(isbn);
			if (login!=null &&login.getUser().getIsAdmin()==true && use.equals("none")) {
				logger.debug("Initiating book delete");
				int ct = dao.deleteBookfromCart(isbn);
				int wi = dao.deleteBookfromWishList(isbn);
				int invd = dao.deleteBookfromInventory(isbn);
				int res = dao.deleteBook(isbn);
				rc.removeDescription(isbn);
				message = "The Book is deleted from inventory";
			} else {
				message = "This book is currently in " + use + ". Can't be deleted!!";
				logger.debug(message);
			}
		}
		// List<Book> lst = dao.getBooks();
		// model.addAttribute("catlist", lst);
		model.addAttribute("msg", message);
		if (pgno == null)
			pgno = 1;

		return ac.getBooks(pgno, model, req);
	}
}