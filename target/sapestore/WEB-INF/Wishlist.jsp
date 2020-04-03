<!DOCTYPE html>
<head>
<%@include file="headsection.jsp"%>
</head>
<body onLoad="alignment()">
	<c:if test="${sessionScope.login eq null }">
		<jsp:forward page="/"></jsp:forward>
	</c:if>
	<c:if test="${sessionScope.login.user.isAdmin eq true}">
		<jsp:forward page="/"></jsp:forward>
	</c:if>
	<div id="wrapper">
		<!-- header starts-->
		<%@include file="Headeruser.jsp"%>
		<!-- header ends -->
		<section>
			<%@include file="bookcategories.jsp"%>
			<div id="mainContent">
				<h2>Your Wishlist</h2>
				<c:if test="${blist.size() eq 0}">
					<div style="color: red; text-align: center">
						<b>Your wishlist is empty</b>
					</div>
				</c:if>

				<ul class="pagination">
					<li><c:if test="${currpg gt 1}">
							<a href="${pgurl}pgno=${currpg-1}" title="previous"><b>&lt;&lt;</b></a>
						</c:if></li>
					<c:forEach items="${plist}" var="i">
						<c:if test="${i eq currpg}">
							<div id="activepage">
							<c:if test="${totpgs ne 1}">
								<li><a href="${pgurl}pgno=${i}"><b><u>${i}</u></b></a></li>
							</c:if></div>
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
				<div id="wishlist">
					<c:if test="${blist.size() ne 0}">
						<div class="rTable" style="width: 98%">
							<div class="rTableRow">
								<div class="rTableCell itemhead">
									<strong>ITEM(S)</strong>
								</div>
								<div class="rTableCell titlehead"></div>
								<div class="rTableCell qtyhead">
									<span style="font-weight: bold;">QTY.</span>
								</div>
								<div class="rTableCell availhead">
									<span style="font-weight: bold;">AVAILABLE</span>
								</div>
								<div class="rTableCell pricehead">
									<span style="font-weight: bold;">PRICE</span>
								</div>
								<div class="rTableCell actionhead1">
									<span style="font-weight: bold;"></span>
								</div>
								<div class="rTableCell actionhead2">
									<span style="font-weight: bold;"></span>
								</div>

								<br />
							</div>
							<br />
							<hr />
							<c:forEach items="${blist}" var="w">

								<div class="rTableRow" style="height: 220px;">
									<div class="rTableCell itemhead">
										<span><img src="img?bookimg=${w.book.isbn}thumb.jpg"
											style="height: 150px; width: 100px;"
											alt="${w.book.bookTitle}"></span>
									</div>
									<div class="rTableCell titlehead">
										<span style="font-size: 12px"><a
											href="viewdetails?isbn=${w.book.isbn}"><b id="wbook">${w.book.bookTitle}</b></a></span>
									</div>
									<div class="rTableCell qtyhead">
										<span style="font-size: 12px"><b>1</b></span>
									</div>
									<div class="rTableCell availhead">
										<span style="font-size: 12px"><b>YES</b></span>
									</div>
									<div class="rTableCell pricehead">
										<span style="font-size: 12px"><b>&dollar;
												${w.book.sellPrice}</b></span>

									</div>
									<div class="rTableCell actionhead1">
										<span><c:if test="${sessionScope.login eq null }">
												<a href="#login" title="Add To Cart" class="inline"
													style="margin-top: 0px"><img src="img/add_cart.jpg"
													width="15" height="13" alt="add to cart"></a>
											</c:if> <c:if
												test="${sessionScope.login ne null and sessionScope.login.isVerified() eq false}">
												<a class="addCart" href="#"
													onclick="showBanner('verificationerrormsg')"
													title="Add To Cart" class="addCart"><img
													src="img/add_cart.jpg" width="15" height="13"
													alt="add to cart"></a>
											</c:if>
											 <c:if
												test="${sessionScope.login ne null and sessionScope.login.isVerified() eq true }">
												<c:if test="${w.book.inventory.purchaseQuantity le 0}">
													<a href="javascript:void(0)" title="Add To Cart" onclick="showBanner('outofstock')" class="addCart">
													<img src="img/add_cart.jpg" width="15" height="13" alt="add to cart"></a>
												</c:if>
												<c:if test="${w.book.inventory.purchaseQuantity gt 0}">
													<a href="javascript:void(0)" title="Add To Cart" onclick="addcart(${w.book.isbn})" class="addCart">
													<img src="img/add_cart.jpg" width="15" height="13" alt="add to cart"></a>
												</c:if>
											</c:if></span>
									</div>
									<div class="rTableCell actionhead2">
										<span><a
											href="removefromwishlist?pgno=${currpg}&wishItemId=${w.wishItemId}&userId=${sessionScope.login.user.userId}"
											title="Remove from wishlist" style="margin-top: 0px"><img
												src="img/close.png" width="25" height="25" alt="remove"></a></span>
									</div>
								</div>

								<hr />
							</c:forEach>
						</div>
					</c:if>
				</div>
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