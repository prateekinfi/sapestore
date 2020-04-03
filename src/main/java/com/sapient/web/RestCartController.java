package com.sapient.web;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sapient.dao.IDao;
import com.sapient.dao.IUserDao;
import com.sapient.entity.Book;

@RestController
public class RestCartController {

	@Autowired
	private IDao dao;

	private Logger logger=LoggerFactory.getLogger("sapestore");

	@Autowired
	private IUserDao d;
	
	 

	@RequestMapping("addbooktoCart")
	public String displayCartFrm(@RequestParam("isbn") String isbn, HttpServletRequest req, Model model) {
		logger.debug("Inside add to cart");
		HttpSession sess = req.getSession(false);
		Set<Book> cart = (Set<Book>) sess.getAttribute("cartitems");
		sess.setMaxInactiveInterval(10*60);
		logger.debug("in cartview");
		if(cart!=null){
			for(Book book: cart){
				if(isbn.equals(book.getIsbn())){
//					sess.setAttribute("checkmsg","This book is already in your cart");
					return "invalid";
				}
			}
		}
		Map<String,Integer> purchaseMap=(Map<String, Integer>) sess.getAttribute("purchaseMap");
		Map<String,Integer> quantityMap=(Map<String, Integer>) sess.getAttribute("quantityMap");
		purchaseMap.put(isbn, 1);
		quantityMap.put(isbn, 1);
		sess.setAttribute("checkmsg","");
		logger.debug("hello "+isbn);
		cart.add(dao.getBook(isbn));
		logger.debug(cart.toString());
//		sess.setAttribute("flag", true);
		sess.setAttribute("cartitems", cart);
		sess.setAttribute("purchaseMap", purchaseMap);
		sess.setAttribute("quantityMap", quantityMap);
		return "success";
	}


	@RequestMapping("addtoCart")
	public String displayCartForm(@RequestParam("isbn") String isbn, HttpServletRequest req, Model model) {
		logger.debug("Inside add to cart");
		HttpSession sess = req.getSession(false);

		Set<Book> cart = (Set<Book>) sess.getAttribute("cartitems");
		sess.setMaxInactiveInterval(10*60);
		logger.debug("in cartview");
		cart = (Set<Book>)sess.getAttribute("cartitems");
		if(cart!=null){
			for(Book book: cart){
				if(isbn.equals(book.getIsbn())){
					sess.setAttribute("checkmsg","This book is already in your cart");
					return "invalid";
				}
			}
		}
		Map<String,Integer> purchaseMap=(Map<String, Integer>) sess.getAttribute("purchaseMap");
		Map<String,Integer> quantityMap=(Map<String, Integer>) sess.getAttribute("quantityMap");
		purchaseMap.put(isbn, 0);
		quantityMap.put(isbn, 1);
		sess.setAttribute("checkmsg","");
		cart.add(dao.getBook(isbn));
//		sess.setAttribute("flag", false);
		sess.setAttribute("cartitems", cart);
		sess.setAttribute("purchaseMap", purchaseMap);
		sess.setAttribute("quantityMap", quantityMap);
		return "success";
	}

	/*@RequestMapping(value="scroll")
	public List<State> getScrollList(@RequestParam("pgno") Integer pgno ){

		List<Book> book = dao.getTopBooks();

		System.out.println(book.toString());
		HttpSession sess=req.getSession(false);
		Set<Book> cart1=(Set<Book>) sess.getAttribute("cartitems");
		List<Book> bk=new ArrayList<>(cart1);
		List<State> lst=d.getStates(1L);
		return lst;

	}*/


	@RequestMapping(value="scroll")
	public List<Book> getScrollList(@RequestParam("pgno") Integer pgno ){


		List<Book> lst=dao.getTopBooks();
		int first=pgno*15,last=(pgno+1)*15;
		if(lst.size() < (pgno+1)*15){
			last = lst.size()-1;
		}
		lst = lst.subList(first, last);
		List<Book> books = new ArrayList<>();
		for (Book book : lst) {
			Book b = new Book();
			b.setBookTitle(book.getBookTitle());
			b.setAuthor(book.getAuthor());
			b.setSellPrice(book.getSellPrice());
			b.setIsbn(book.getIsbn());
			books.add(b);
		}
		return books;

	}



	/*@RequestMapping(value="scroll")
	public List<Category> getScrollList(@RequestParam("pgno") int pgno, Model model ){

		List<Category> book=dao.getCategories();
		//return book.subList(pgno*15, 5);
		return book;

	}*/

	public int getBookList(Set<Book> cart, HttpServletRequest req, Model model) {
		logger.debug("Inside viewCart");
		model.addAttribute("cartitems",cart);
		return cart.size();
	}



	@RequestMapping(value="removefromcart")
	public int removeFromCart(@RequestParam(value="isbn") String isbn, HttpServletRequest req, Model model){

		logger.debug("Removing From Cart");
		HttpSession sess = req.getSession(false);

		Set<Book> cartList = (HashSet<Book>) sess.getAttribute("cartitems");
		Map<String,Integer> purchaseMap=(Map<String, Integer>) sess.getAttribute("purchaseMap");
		Map<String,Integer> quantityMap=(Map<String, Integer>) sess.getAttribute("quantityMap");
		for(Book book : cartList){
			if(book.getIsbn().equals(isbn)){
				cartList.remove(book);
				purchaseMap.remove(isbn);
				quantityMap.remove(isbn);
				break;
			}
		}
		sess.setAttribute("cartitems", cartList);
		sess.setAttribute("purchaseMap", purchaseMap);
		sess.setAttribute("quantityMap", quantityMap);
		if(cartList.size()==0){
			model.addAttribute("msg","Your cart is empty");
			return 0;
		}
		return getBookList(cartList, req, model);
	}
	
	@RequestMapping(value="getquantity")
	public String getQuantity(@RequestParam(value="isbn") String isbn, @RequestParam(value="flag") Integer flag, HttpServletRequest req){
		boolean f=true;
		if(flag==0){
			f=false;
		}
		Integer quantity = dao.getBookQuantity(isbn, f);
		logger.debug(""+quantity);
		return quantity+"";
	}
	
	@RequestMapping(value="updatesessionquantity")
	public String updateSessionQuantity(@RequestParam("isbn")String isbn,@RequestParam("quantity")int quantity,HttpServletRequest req){
		HttpSession session=req.getSession(false);
		Map<String,Integer> map=(Map<String, Integer>) session.getAttribute("quantityMap");
		map.put(isbn, quantity);
		session.setAttribute("quantityMap", map);
		return "success";
	}
	
	@RequestMapping(value="updatesessionpurchase")
	public String updateSessionPurchase(@RequestParam("isbn")String isbn,@RequestParam("type")int type,HttpServletRequest req){
		HttpSession session=req.getSession(false);
		Map<String,Integer> map=(Map<String, Integer>) session.getAttribute("purchaseMap");
		map.put(isbn, type);
		session.setAttribute("purchaseMap", map);
		return "success";
	}
	
	@RequestMapping("cartorder")
	public String cartToOrder(HttpServletRequest req){
		HttpSession session = req.getSession();
		Set<Book> book=(Set<Book>) session.getAttribute("cartitems");
		Map<String, Integer> purchaseMap = (Map<String, Integer>) session.getAttribute("purchaseMap");
		Map<String, Integer> quantityMap = (Map<String, Integer>) session.getAttribute("quantityMap");
		//Now Enter everything to order details
		return "";
	}
	
}
