package com.sapient.web;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sapient.dao.IDao;
import com.sapient.dao.IWishlistDao;
import com.sapient.entity.Book;
import com.sapient.entity.Category;
import com.sapient.entity.Login;
import com.sapient.entity.WishItem;
import com.sapient.entity.WishList;

@Controller
public class WishlistController {

	@Autowired
	IWishlistDao wdao;

	@Autowired
	IDao dao;

	@Autowired
	BookController bookCon;

	private Logger logger = LoggerFactory.getLogger("sapestore");

	@RequestMapping("wishlist")
	public String addToWishlist(@RequestParam("isbn") String isbn, @RequestParam("userId") Long userId, Model model,
			HttpServletRequest req) {
		logger.debug("in wishlist");
		WishList wl = wdao.getWishList(userId);
		if (wl == null) {
			// create new wish list for user
			if (wdao.createWishList(userId) == 1)
				wl = wdao.getWishList(userId);
			else {
				logger.error("Error creating Wishlist");
				return bookCon.getBookDetails(isbn, model, req);
			}
		}
		String message;
		if (wdao.existsWishItem(wl.getWishListId(), isbn)) {
			logger.debug("existing item");
			message = "This item is already present in your wish list";
		} else {
			wdao.createWishItem(wl.getWishListId(), isbn);
			logger.debug("item added in wishitem");
			message = "This item is added to your wish list";
		}
		model.addAttribute("msg", message);
		return bookCon.getBookDetails(isbn, model, req);
	}

	@RequestMapping("wishlistpage")
	public String getWishListItems(@RequestParam(value = "pgno", required = false) Integer pgno, HttpServletRequest req, Model model) {
		logger.debug("trying to get wish items");
		Login login = (Login) req.getSession().getAttribute("login");
		WishList wl = wdao.getWishList(login.getUser().getUserId());

		logger.debug("wishlist id obtained");
		List<WishItem> wt = null;
		if (wl != null) {
			Set<WishItem> setItems = wl.getWishItem();
			logger.debug("set of wish items obtained");

			wt = new ArrayList<>(setItems);
			wt = wt.stream().sorted(Comparator.comparing(WishItem::getWishItemId)).collect(Collectors.toList());
			model.addAttribute("wishitems", wt);
		} else {
			model.addAttribute("message", "Your wishlist is empty");
		}
		getCategories(model);
		if (pgno == null)
			pgno = 1;
		return PrepareWishList(wt, model, pgno, "wishlistpage?");
	}

	public String PrepareWishList(List<WishItem> lst, Model model, int pgno, String pgurl) {
		int end = pgno * 4;
		int start = end - 4;
		if(lst !=null){
			if (end >= lst.size())
				end = lst.size();
			int pgs = (int) Math.ceil(lst.size() / 4.0);
			List<WishItem> sublist = lst.subList(start, end);
			logger.debug("list:"+sublist.toString());
			if(sublist.size()==0 && pgno!=1){
				return PrepareWishList(lst, model, --pgno, pgurl);
			}
			List<Integer> plist = new ArrayList<>();
			for (int i = 1; i <= pgs; i++) {
				plist.add(i);
			}
			model.addAttribute("plist",plist);
			model.addAttribute("totpgs", pgs);
			model.addAttribute("blist", sublist);
		}
		else{
			model.addAttribute("blist", new ArrayList<>());
		}
		model.addAttribute("currpg", pgno);
		model.addAttribute("pgurl", pgurl);
		return "Wishlist";
	}

	public void getCategories(Model model) {
		List<Category> catlist = dao.getCategories();
		model.addAttribute("catlist", catlist);
	}

	@RequestMapping("removefromwishlist")
	public String deleteBook(@RequestParam(value = "pgno", required = false) Integer pgno,
			@RequestParam("wishItemId") String wishItemId, HttpServletRequest req,
			Model model) {
		
		int wid = wdao.deleteBookfromWishlist(wishItemId);
		logger.debug("inside remove");
		
		return getWishListItems(pgno, req, model);
	}
}
