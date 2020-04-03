<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<%@include file="headsection.jsp"%>
</head>
<body onLoad="alignment()">
<div id="cnfrmregmsg" class="successBanner">${cnfrmregmsg}</div>
<div id="emailVerifiedMessage" class="successBanner">${emailVerifiedMessage}</div>
<div id="emailVerificationFailMessage" class="errorBanner">${emailVerificationFailMessage}</div>
<section id="top"></section>
	<div id="wrapper">
		<!-- header starts-->
		<%@include file="header.jsp"%>
		<!-- header ends -->
		<section>
			<%@include file="bookcategories.jsp"%>
			<div id="mainContent">
			
				<h2>Top Rated</h2>
				<ul class="pagination">
					<li><c:if test="${currpg gt 1}">
							<a href="${pgurl}pgno=${currpg-1}" title="previous"><b>&lt;&lt;</b></a>
						</c:if></li>
					<c:forEach items="${plist}" var="i">
						<c:if test="${i eq currpg}">
					<div id="activepage">
					<c:if test="${totpgs ne 1}">
						<li><a href="${pgurl}pgno=${i}" ><b><u>${i}</u></b></a></li>
					</c:if>	</div>
					</c:if>
					<c:if test="${i ne currpg }">
					<div id="nonactivepage">
					<li><a href="${pgurl}pgno=${i}"><b>${i}</b></a></li>
					</div>
					</c:if>
					</c:forEach>
					<li><c:if test="${currpg lt totpgs}">
							<a href="${pgurl}pgno=${currpg+1}"><b>&gt;&gt;</b></a>
						</c:if></li>
				</ul>
				<div class="clearfix"></div>
				<ul>
					<!-- this is product li which needs to be in loop -->
					<c:forEach items="${blist}" var="topl">
						<li><a href="viewdetails?isbn=${topl.isbn}"
							title="${topl.bookTitle}"><img src="img?bookimg=${topl.isbn}thumb.jpg" width="131"
								height="180" alt="${topl.bookTitle}"><span>${topl.bookTitle}</span>
								<p><span>${topl.author}</span></p> </a>
							<figure>
								<c:choose>
							<c:when test="${topl.averageRating eq 0 }">
								<b><img src="img/ratings-0.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${topl.averageRating le 0.5}">
								<b><img src="img/ratings-0.5.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${topl.averageRating le 1}">
								<b><img src="img/ratings-1.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${topl.averageRating le 1.5}">
								<b><img src="img/ratings-1.5.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${topl.averageRating le 2}">
								<b><img src="img/ratings-2.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${topl.averageRating le 2.5}">
								<b><img src="img/ratings-2.5.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${topl.averageRating le 3 }">
								<b><img src="img/ratings-3.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${topl.averageRating le 3.5}">
								<b><img src="img/ratings-3.5.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${topl.averageRating le 4 }">
								<b><img src="img/ratings-4.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:when test="${topl.averageRating le 4.5}">
								<b><img src="img/ratings-4.5.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:when>
							<c:otherwise>
								<b><img src="img/ratings-5.jpg" width="98" height="14"
									alt="ratings"></b>
							</c:otherwise>

						</c:choose>
							</figure>
							<p class="price">&dollar;${topl.sellPrice}</p> 
							<c:set var = "checkmsg" scope = "session" value = "  "/>
							 
							<c:if test="${sessionScope.login eq null }">
						      
						     <a class="inline addCart" href="#login" title="Add To Cart"
							class="addCart" ><img src="img/add_cart.jpg" width="15"
								height="13" alt="add to cart"></a>  
					       </c:if>
					       <c:if test="${sessionScope.login ne null and sessionScope.login.isVerified() eq false}">
					       	<a class="addCart" href="#" onclick="showBanner('verificationerrormsg')" title="Add To Cart" class="addCart" ><img src="img/add_cart.jpg" width="15"
								height="13" alt="add to cart"></a>
					       </c:if>
							<c:if test="${sessionScope.login ne null and sessionScope.login.isVerified() eq true }">
										<c:if test="${topl.inventory.purchaseQuantity le 0}">
											<a href="javascript:void(0)" title="Add To Cart" onclick="showBanner('outofstock')" class="addCart" >
												<img src="img/add_cart.jpg" width="15" height="13" alt="add to cart"></a>
								</c:if>
										<c:if test="${topl.inventory.purchaseQuantity gt 0}">
											<a href="javascript:void(0)" title="Add To Cart" onclick="addcart(${topl.isbn})" class="addCart" >
												<img src="img/add_cart.jpg" width="15" height="13" alt="add to cart"></a>
										</c:if>
									</c:if>
							</li>
					</c:forEach>
				</ul>
				<div class="clearfix"></div>
				<%-- <ul class="pagination">
					<li><c:if test="${currpg gt 1}">
							<a href="${pgurl}pgno=${currpg-1}" title="previous"><b>&lt;&lt;</b></a>
						</c:if></li>
					<c:forEach items="${plist}" var="i">
						<c:if test="${i eq currpg}">
					<div id="activepage">
						<li><a href="${pgurl}pgno=${i}" ><b><u>${i}</u></b></a></li>
						</div>
					</c:if>
					<c:if test="${i ne currpg }">
					<div id="nonactivepage">
					<li><a href="${pgurl}pgno=${i}"><b>${i}</b></a></li>
					</div>
					</c:if>
					</c:forEach>
					<li><c:if test="${currpg lt totpgs}">
							<a href="${pgurl}pgno=${currpg+1}"><b>&gt;&gt;</b></a>
						</c:if></li>
				</ul> --%>
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