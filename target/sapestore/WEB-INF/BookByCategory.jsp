<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<%@include file="headsection.jsp"%>
</head>
<body onLoad="alignment()">
	<div id="wrapper">
		<!-- header starts-->
		<%@include file="header.jsp"%>
		<!-- header ends -->
		<section>
			<%@include file="bookcategories.jsp"%>
			<div id="mainContent">
				<h2>${catname}</h2>
				<ul class="pagination">
					<li><c:if test="${currpg gt 1}">
							<a href="${pgurl}pgno=${currpg-1}" title="previous">Prev</a>
						</c:if></li>
					<li><c:if test="${currpg lt totpgs}">
							<a href="${pgurl}pgno=${currpg+1}">next</a>
						</c:if></li>
				</ul>
				<div class="clearfix"></div>
				<ul>
					<!-- this is product li which needs to be in loop -->
					<c:forEach items="${booklist}" var="bookl">
						<li><a href="viewdetails?isbn=${bookl.isbn}"
							title="${bookl.bookTitle}" ><img src="img?bookimg=${bookl.isbn}thumb.jpg"
								width="131" height="180" alt="${bookl.bookTitle}"><span>${bookl.bookTitle}</span>
								<p ><span >${bookl.author}</span></p> </a>
							<figure>
								<c:choose>
							<c:when test="${bookl.averageRating eq 0 }">
								<b><img src="img/ratings-0.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${bookl.averageRating le 0.5}">
								<b><img src="img/ratings-0.5.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${bookl.averageRating le 1}">
								<b><img src="img/ratings-1.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${bookl.averageRating le 1.5}">
								<b><img src="img/ratings-1.5.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${bookl.averageRating le 2}">
								<b><img src="img/ratings-2.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${bookl.averageRating le 2.5}">
								<b><img src="img/ratings-2.5.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${bookl.averageRating le 3 }">
								<b><img src="img/ratings-3.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${bookl.averageRating le 3.5}">
								<b><img src="img/ratings-3.5.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${bookl.averageRating le 4 }">
								<b><img src="img/ratings-4.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${bookl.averageRating le 4.5}">
								<b><img src="img/ratings-4.5.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:otherwise>
								<b><img src="img/ratings-5.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:otherwise>

						</c:choose>
							</figure>
							<p class="price">&dollar;${bookl.sellPrice}</p>
							<c:if test="${sessionScope.login eq null }">
							<a href="#login" title="Add To Cart"
							class="inline addCart" ><img src="img/add_cart.jpg" width="15"
								height="13" alt="add to cart"></a>
							</c:if>
							<c:if test="${sessionScope.login ne null and sessionScope.login.isVerified() eq false}">
							<a href="#top" title="Add To Cart"
							class="addCart" onclick="showBanner('verificationerrormsg')"><img src="img/add_cart.jpg" width="15"
								height="13" alt="add to cart"></a>
								
								</c:if>
							<c:if test="${sessionScope.login ne null and sessionScope.login.isVerified() eq true}">
								<c:if test="${bookl.inventory.purchaseQuantity le 0}">
											<a href="javascript:void(0)" title="Add To Cart" onclick="showBanner('outofstock')" class="addCart">
												<img src="img/add_cart.jpg" width="15" height="13" alt="add to cart"></a>
								</c:if>
										<c:if test="${bookl.inventory.purchaseQuantity gt 0}">
											<a href="javascript:void(0)" title="Add To Cart" onclick="addcart(${bookl.isbn})" class="addCart">
												<img src="img/add_cart.jpg" width="15" height="13" alt="add to cart"></a>
										</c:if>
								
							</c:if></li>
					</c:forEach>
				</ul>
				<div class="clearfix"></div>
				<ul class="pagination">
					<li><c:if test="${currpg gt 1}">
							<a href="${pgurl}pgno=${currpg-1}" title="previous">Prev</a>
						</c:if></li>
					<li><c:if test="${currpg lt totpgs}">
							<a href="${pgurl}pgno=${currpg+1}" title="next">next</a>
						</c:if></li>
				</ul>
			</div>
		</section>
		<div class="clearfix"></div>
		<%@include file="footer.jsp"%>
	</div>

	<!-- This contains the hidden content for shopping cart popup -->
	<%@include file="cart.jsp"%>
	<!-- This contains the hidden content for login popup -->
	<%@include file="login.jsp"%>
	<!-- Forgot password-->

	<%@include file="scripts.jsp"%>
	
</body>
</html>