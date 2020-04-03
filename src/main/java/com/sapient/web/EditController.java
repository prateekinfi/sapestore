package com.sapient.web;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import com.sapient.dao.IInventoryDao;
import com.sapient.entity.Book;
import com.sapient.entity.Login;

@Controller
@PropertySource("classpath:sapestore.properties")
public class EditController {

	@Value("${photo_folder_thumbs}")
	private String photo_folder_thumbs;

	@Value("${photo_folder_full}")
	private String photo_folder_full;

	@Autowired
	IInventoryDao dao;

	@Autowired
	ReviewRestController rc;

	@Autowired
	AdminController ac;
	
	@Autowired
	MainController mainController;

	private Logger logger = LoggerFactory.getLogger("sapestore");

	@RequestMapping(value = "editu")
	public String editBook(@RequestParam("isbn") String isbn, @RequestParam("pgno") int pgno, Model model,
			HttpServletRequest req) throws Exception {
		HttpSession sess = req.getSession(false);
		String message = "";
		if(sess!=null){
			Login login = (Login) sess.getAttribute("login");
			if(login!=null && login.getUser().getIsAdmin()==true){
				model.addAttribute("desc", rc.getDescription(isbn));
				model.addAttribute("myBook", dao.getBook(isbn));
				model.addAttribute("catlist", dao.getCategories());
				model.addAttribute("pgno", pgno);
				return "edit";
			}
		}
		return mainController.getMainpage(1, model);
		

	}

	@RequestMapping(value = "editprod")
	public String editBook(@RequestParam("txtisbn") String isbn,
			@RequestParam(value = "pgno", required = false) Integer pgno, @RequestParam("txtdimg") MultipartFile image,
			@RequestParam("txtthimg") MultipartFile thumbnail, @RequestParam("txttitle") String bookTitle,
			@RequestParam("txtauthor") String author, @RequestParam("txtpublish") String publisher,
			@RequestParam("txtsell") Double sellPrice, @RequestParam("txtrent") Double rentPrice,
			@RequestParam("latefee") Double latefee, @RequestParam("txtdesc") String shortDesc,
			@RequestParam("desc") String fullDesc, @RequestParam("trent") int rent, @RequestParam("tsell") int sell,
			@RequestParam("catId") Long categoryId, HttpServletRequest req, Model model) throws Exception {

		logger.info("Inside edit book");
		HttpSession sess = req.getSession(false);
		String message = "";
		if (sess != null) {
			Login login = (Login) sess.getAttribute("login");
			if (login != null && login.getUser().getIsAdmin() == true) {
				String fullImage = isbn + "full.jpg";
				String thumbImage = isbn + "thumb.jpg";
				int res = dao.updateBook(isbn, fullImage, thumbImage, bookTitle, author, publisher, sellPrice,
						rentPrice, latefee, shortDesc, categoryId, rent, sell);

				rc.updateDescription(isbn, fullDesc);

				logger.debug("Inserting images!!");
				if (!thumbnail.isEmpty()) {
					logger.debug("Thumbnail image is not null");
					FileOutputStream fos = new FileOutputStream(photo_folder_thumbs + thumbImage);
					fos.write(thumbnail.getBytes());
					fos.close();
				}
				if (!image.isEmpty()) {
					logger.debug("Full image is not null");
					FileOutputStream fos1 = new FileOutputStream(photo_folder_full + fullImage);
					fos1.write(image.getBytes());
					fos1.close();
				}

				if (res > 0) {
					message = "Book updated for ISBN " + isbn;
				} else {
					message = "Book update failed";
				}

			}
			else{
				message="You are not authorized to edit book";
			}
		}

		// List<Book> lst = dao.getBooks();
		model.addAttribute("pgno", pgno);
		model.addAttribute("msg", message);
		// model.addAttribute("catlist", lst);
		return ac.getBooks(pgno, model, req);
	}
}