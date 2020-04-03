<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!-- header starts-->
<header>
	<div id="carterrormsg" class="errorBanner">Item already in cart</div>
	<!-- <div id="wishlistmsg" class="successBanner">Item has been added to your wishlist</div> -->
	<div id="outofstock" class="errorBanner">The book is Out of Stock</div>
	<div id="verificationerrormsg" class="errorBanner">You need to verify your Email first. Please verify it from profile page.</div>
	<div id="subscribererrormsg" style="display:none; color: white; background-color: red; text-align: center;">You are already Subscribed</div>
	<div id="subscribmsg" class="successBanner">You have been Subscribed for the mail</div>
	<%-- <c:set var="carterror" scope="session" value=""></c:set> --%>
	<div id="header">
		<div id="header">
			<a href="/sapestore/" title="SapeStore" class="logo"><img
				src="img/logo.jpg" alt="SapeStore"></a>
			<ul class="topLinks">
				<!-- <li><input name="include_books" type="checkbox"
					value="include_books" checked> <a
					title="Add books from Partner Store" href="javacript:void(0)"
					class="partnerStore">Include books from Partner Store</a></li> -->
				<li><a href="editprofile">${sessionScope.login.userName}</a></li>
				<li><c:if test="${sessionScope.login ne null }">
						<a class='inline' href="#shoppingCart" onclick="doTotal()"><img
							src="img/icon_cart.jpg" width="15" height="12" alt="cart"></a>
					</c:if>
					<c:if test="${sessionScope.login eq null }">
						<a class='inline' href="#login"><img
							src="img/icon_cart.jpg" width="15" height="12" alt="cart"></a>
					</c:if>
					
					
				</li>
				<li class="cartNum">${sessionScope.cartitems.size()}</li>
			</ul>
			<nav>
				<ul class="nav">
					<li class="active"><a href="/sapestore/" title="Home">Home</a></li>
					<li><a href="searchpage" title="Search">Search</a></li>
					<c:if test="${sessionScope.login ne null }">
						<li><a href="editprofile" title="Account">Account </a></li>
					</c:if>
					<li><c:if test="${sessionScope.login eq null }">
							<a href="#login" class='inline' title="Wishlist">Wishlist</a>
						</c:if> <c:if test="${sessionScope.login ne null }">
							<a href="wishlistpage?pgno=${currpg}"
								title="Wishlist">Wishlist</a>
						</c:if></li>
					<li><c:if test="${sessionScope.login eq null}">
							<a href="#login" class='inline' onclick="enterlogin()">Login</a>
						</c:if> <c:if test="${sessionScope.login ne null}">
							<a href="logout" title="Logout">Logout</a>
						</c:if></li>
				</ul>
			</nav>
		</div>
</header>
<!-- header ends -->