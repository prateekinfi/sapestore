<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<%@include file="headsection.jsp"%>

</head>
<body onLoad="alignment()">
	<c:if test="${sessionScope.login.user.isAdmin eq true}">
		<jsp:forward page="/"></jsp:forward>
	</c:if>
	<section id="top"></section>
	<div id="wrapper">
		<!-- header starts-->
		<%@include file="header.jsp"%>
		<!-- header ends -->
		<section>
			<%@include file="bookcategories.jsp"%>
			<div id="mainContent" class="search">
				<h2>Search Books</h2>
				<br>

				<div class="clearfix"></div>
				<hr />
				<br>
				<form method="post" action="search?pgno=1" id="addAddress">
					<div style="display: flex">
						<div>
							<label for="name">Book Title <span></span></label> <input
								type="text" name="bookTitle" style="width: 300px"
								value="${booktitle}">
						</div>
						<div>
							<label for="name">Book Author <span></span></label> <input
								type="text" name="bookAuthor" style="width: 300px"
								value="${bookauthor}">
						</div>
					</div>
					<br>

					<div style="display: flex">
						<div class="line">
							<label for="isbn">ISBN</label><input type="text" name="isbn"
								id="isbn" value="${isbn }" />
						</div>
						<div class="line" style="margin-left: 6px">
							<label for="name">Category</label> <select name="CatId">
								<option selected value="select">--Select a Category--</option>
								<c:forEach items="${catlist}" var="c">
									<c:choose>
										<c:when
											test="${catId ne 'select' and  not empty catId && catId eq c.categoryId}">
											<option value="${catId}" selected="selected">${c.categoryName}</option>
										</c:when>
										<c:otherwise>
											<option value="${c.categoryId}">${c.categoryName}</option>
										</c:otherwise>
									</c:choose>

								</c:forEach>
							</select>
						</div>
						<div class="line" style="margin-left: 6px">
							<label for="publisher">Publisher</label><input type="text"
								name="bookPublisher" id="publisher" value="${bookpublisher}" />
						</div>
					</div>
					<br>

					<div style="display: flex">
						<div>
							<span><input type="checkbox" value="mc"
								name="mostcomments" /> Search by most number of comments</span>
						</div>

						<!-- <div style="margin-left: 80px">
							<span><input type="checkbox" />Search in partner store</span>
						</div> -->
					</div>
					<br>

					<p align="center">
						<input type="submit" value="Search" class="lightButton addtoStore">
					</p>


				</form>

				<c:if test="${searchsize eq 0 }">
					<div style="color: red; text-align: center">
						<b>No Result Found</b>
					</div>
				</c:if>
				<div class="clearfix"></div>
				<ul>
					<!-- this is product li which needs to be in loop -->
					<c:forEach items="${blist}" var="bookl">
						<li><a href="viewdetails?isbn=${bookl.isbn}"
							title=${bookl.bookTitle}><img
								src="img?bookimg=${bookl.isbn}thumb.jpg" width="131"
								height="180" alt=${bookl.bookTitle}><span>${bookl.bookTitle}</span>
								<p>
									<span>${bookl.author}</span>
								</p> </a>
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
							<p class="price">&dollar;${bookl.sellPrice}</p> <c:if
								test="${sessionScope.login eq null }">
								<a href="#login" title="Add To Cart" class="inline addCart"><img
									src="img/add_cart.jpg" width="15" height="13" alt="add to cart"></a>
							</c:if> <c:if
								test="${sessionScope.login ne null and sessionScope.login.isVerified() eq false}">
								<a class="addCart" href="#top"
									onclick="showBanner('verificationerrormsg')"
									title="Add To Cart" class="addCart"><img
									src="img/add_cart.jpg" width="15" height="13" alt="add to cart"></a>
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
								</c:if>
					</c:forEach>
				</ul>
				<div class="clearfix"></div>
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