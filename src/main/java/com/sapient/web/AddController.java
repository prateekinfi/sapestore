package com.sapient.web;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sapient.dao.IInventoryDao;
import com.sapient.entity.Book;
import com.sapient.entity.Category;
import com.sapient.entity.Login;

@Controller
@PropertySource("classpath:sapestore.properties")
public class AddController {

	@Autowired
	IInventoryDao dao;
	
	@Autowired
	ReviewRestController rc;
	
	@Autowired
	AdminController ac;
	
	@Autowired
	MainController mainController;
	
	@Value("${photo_folder_thumbs}")
	private String photo_folder_thumbs;
	
	@Value("${photo_folder_full}")
	private String photo_folder_full;

	@RequestMapping("addbook")
	public String addProduct(@RequestParam(value="pgno", required=false )Integer pgno, HttpServletRequest req, Model model) {
		HttpSession sess = req.getSession(false);
		if(sess!=null){
			Login login = (Login) sess.getAttribute("login");
			if(login!=null && login.getUser().getIsAdmin()==true){
				Book newBook = new Book();
				model.addAttribute("pgno", pgno);
				model.addAttribute("bookbean", newBook);
				model.addAttribute("clist", dao.getCategories());
				return "addForm";
			}
		}
		return mainController.getMainpage(1, model);
		
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addProduct(@Valid @ModelAttribute("bookbean") Book book,
			@RequestParam(value="pgno", required=false )Integer pgno,
							@RequestParam("rent")int rentQuantity,
							@RequestParam("sell")int sellQuantity, 
							@RequestParam("thumb") MultipartFile thumbnail, 
							@RequestParam("image") MultipartFile image,
							@RequestParam("catId") Long categoryId,
							@RequestParam("longdesc") String longDesc,
							@RequestParam("desc") String desc,
							BindingResult br,HttpServletRequest req, Model model)
			throws Exception {

		if(dao.foundInInventory(book.getIsbn())){
			model.addAttribute("msg", "Book with this ISBN already exist");

		}
		else{
			if (br.hasErrors()) {
				throw new Exception("Error obtaining book bean");
			}
			book.setFullImage(book.getIsbn() + "full" + ".jpg");
			book.setThumbImage(book.getIsbn() + "thumb" + ".jpg");
			book.setShortDesc(desc);

			Category ca = dao.getCategory(categoryId);
			book.setCategory(ca);

			dao.addNewBook(book);
			dao.addToInventoty(book,rentQuantity,sellQuantity);

			rc.addDescription(book.getIsbn(), longDesc);

			FileOutputStream fos = new FileOutputStream(photo_folder_thumbs + book.getThumbImage());
			fos.write(thumbnail.getBytes());
			fos.close();

			FileOutputStream fos1 = new FileOutputStream(photo_folder_full + book.getFullImage());
			fos1.write(image.getBytes());
			fos1.close();
			
			model.addAttribute("msg", "Book added Successfully");
		}
		//List<Book> lst = dao.getBooks();
		//model.addAttribute("catlist", lst);
		if(pgno==null)
			pgno=1;
		return ac.getBooks(pgno, model, req);
	}
	
}