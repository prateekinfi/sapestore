<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<%@include file="headsection.jsp"%>
<!-- <<link href="css/bookdetails.css" rel="stylesheet" type="text/css" /> -->


</head>
<body onLoad="alignment()">

	<i class="fa fa-pencil-square-o"></i>
	<div id="wrapper">
		<!-- header starts-->
		<%@include file="header.jsp"%>
		<!-- header ends -->
		<section>
			<%@include file="bookcategories.jsp"%>
			<div style="color: red; text-align: center">
				<strong>${msg}</strong>
			</div>
			<div id="mainContent">
				<div class="flex-container1">
					<div class="flex-item1">
						<img src="img?bookimg=${book.isbn}full.jpg" />
					</div>

					<div class="flex-container2">
						<div class="flex-item2">
							<strong> ${book.bookTitle} </strong>
						</div>

						<div class="flex-container3">
							<div class="flex-item3">
								<span><strong>${book.author}</strong></span>
							</div>

							<div class="flex-item4">
								<span> <c:if test="${sessionScope.login eq null}">
										<span><a href="#login" class='inline' title="1"
											style="padding: 10px; font-size: 13px; color: red">+ Add
												to WishList</a></span>
									</c:if> <c:if
										test="${sessionScope.login ne null and sessionScope.login.user.isAdmin eq false}">
										<span><a
											href="wishlist?isbn=${book.isbn}&userId=${sessionScope.login.user.userId}"
											title="add to wishlist" 
											style="padding: 10px; font-size: 13px; color: red">+ Add
												to WishList</a></span>
									</c:if> <c:if test="${sessionScope.login eq null}">

										<span><a href="#login" class='inline' title="review"
											style="padding: 10px; font-size: 13px; color: red"><i
												class="icon-pencil"></i> Write a review </a></span>
									</c:if> <c:if
										test="${sessionScope.login ne null and sessionScope.login.user.isAdmin eq false}">
										<span><a href="#reviewscreen" class="inline"
											title="review"
											style="padding: 10px; font-size: 13px; color: red"
											onclick="retainRating(${ownrating})"> <i
												class="icon-pencil"></i> <c:if test="${flag eq 1 }">Edit review</c:if>
												<c:if test="${flag ne 1}">Write a review </c:if>
										</a></span>
									</c:if>
								</span>
							</div>
						</div>
						<div class="flex-item5">
							<figure>

								<c:choose>
									<c:when test="${book.averageRating eq 0 }">
										<strong><img src="img/ratings-0.jpg" width="98"
											height="14" alt="ratings"></strong>
									</c:when>
									<c:when test="${book.averageRating le 0.5}">
										<strong><img src="img/ratings-0.5.jpg" width="98"
											height="14" alt="ratings"></strong>
									</c:when>
									<c:when test="${book.averageRating le 1}">
										<strong><img src="img/ratings-1.jpg" width="98"
											height="14" alt="ratings"></strong>
									</c:when>
									<c:when test="${book.averageRating le 1.5}">
										<strong><img src="img/ratings-1.5.jpg" width="98"
											height="14" alt="ratings"></strong>
									</c:when>
									<c:when test="${book.averageRating le 2}">
										<strong><img src="img/ratings-2.jpg" width="98"
											height="14" alt="ratings"></strong>
									</c:when>
									<c:when test="${book.averageRating le 2.5}">
										<strong><img src="img/ratings-2.5.jpg" width="98"
											height="14" alt="ratings"></strong>
									</c:when>
									<c:when test="${book.averageRating le 3 }">
										<strong><img src="img/ratings-3.jpg" width="98"
											height="14" alt="ratings"></strong>
									</c:when>
									<c:when test="${book.averageRating le 3.5}">
										<strong><img src="img/ratings-3.5.jpg" width="98"
											height="14" alt="ratings"></strong>
									</c:when>
									<c:when test="${book.averageRating le 4 }">
										<strong><img src="img/ratings-4.jpg" width="98"
											height="14" alt="ratings"></strong>
									</c:when>
									<c:when test="${book.averageRating le 4.5}">
										<strong><img src="img/ratings-4.5.jpg" width="98"
											height="14" alt="ratings"></strong>
									</c:when>
									<c:otherwise>
										<strong><img src="img/ratings-5.jpg" width="98"
											height="14" alt="ratings"></strong>
									</c:otherwise>

								</c:choose>

								<span style="font-size: 12px; padding-left: 1em">
									${book.averageRating} Ratings| </span>
								<span style="color: red; font-size: 12px;">${review_count}
									Reviews</span>

							</figure>
						</div>
						<div class="flex-item6">
							<span><strong>Publisher: ${book.publisher}</strong></span>
						</div>
						<div class="flex-item7">
							<ul>
								<li style="width: 200px; padding: 0px 1px 13px 0;">
									<div class="price" style="width: 130px">Buy for
										&dollar;${book.sellPrice}</div> <c:if
										test="${sessionScope.login eq null }">
										<a href="#login" title="Add To Cart" class="inline addCart"
											style="margin-top: 0px"><img src="img/add_cart.jpg"
											width="15" height="13" alt="add to cart"></a>
									</c:if> <c:if
										test="${sessionScope.login ne null and sessionScope.login.isVerified() eq false}">
										<a class="addCart" href="javascript:void(0)"
											onclick="showBanner('verificationerrormsg')"
											title="Add To Cart" class="addCart" style="margin-top: 0px"><img
											src="img/add_cart.jpg" width="15" height="13"
											alt="add to cart"></a>
									</c:if> <c:if
										test="${sessionScope.login ne null and sessionScope.login.isVerified() eq true }">
										<c:if test="${purQuan le 0}">
											<a href="javascript:void(0)" id="Sub"
												onclick="addSubscriber('${sessionScope.login.user.userId}','${book.isbn}')"
												class="email" style="margin-top: 0px">
												<!-- <img src="img/mail_icon.png"
											width="15" height="13" alt="add to cart"> -->
												<i class="icon-envelope-alt"
												style="font-size: 21px; color: white;"></i>
											</a>
										</c:if>
										<c:if test="${purQuan gt 0}">
											<a href="javascript:void(0)" title="Add To Cart"
												onclick="addcart(${book.isbn})" class="addCart"
												style="margin-top: 0px"><img src="img/add_cart.jpg"
												width="15" height="13" alt="add to cart"></a>
										</c:if>
									</c:if>
								</li>
							</ul>
						</div>
						<div class="flex-item8">
							<ul>
								<li style="width: 200px;">
									<div class="price" style="width: 130px">Rent for
										&dollar;${book.rentPrice}</div> <c:if
										test="${sessionScope.login eq null }">
										<a href="#login" title="Add To Cart" class="inline addCart"
											style="margin-top: 0px"><img src="img/add_cart.jpg"
											width="15" height="13" alt="add to cart"></a>

									</c:if> 
									<c:if
										test="${sessionScope.login ne null and sessionScope.login.isVerified() eq false}">
										<a class="addCart" href="javascript:void(0)"
											onclick="showBanner('verificationerrormsg')"
											title="Add To Cart" class="addCart" style="margin-top: 0px"><img
											src="img/add_cart.jpg" width="15" height="13"
											alt="add to cart"></a>
									</c:if> 
									<c:if
										test="${sessionScope.login ne null and sessionScope.login.isVerified() eq true }">
										<c:if test="${rentQuan le 0}">
											<a href="javascript:void(0)" id="Sub"
												onclick="addSubscriber('${sessionScope.login.user.userId}','${book.isbn}')"
												class="email" style="margin-top: 0px"> <i class="icon-envelope-alt"
												style="font-size: 21px; color: white;"></i></a>
										</c:if>
										<c:if test="${rentQuan gt 0}">
											<a href="javascript:void(0)" title="Add To Cart"
												onclick="addcartrent(${book.isbn})" class="addCart"
												style="margin-top: 0px"> <img src="img/add_cart.jpg"
												width="15" height="13" alt="add to cart"></a>
										</c:if>
									</c:if>
								</li>
							</ul>
						</div>

					</div>
				</div>

				<br />
				<div class="explain">
					<h3>
						<strong>Description</strong>
					</h3>
					<br>
					<div id="just">
					<p>${description}</p>
					</div>


				</div>
				<div class="explain2">
					<h3>
						<strong>Customer Reviews</strong>
					</h3>
					<span style="font-size: 15px;"></span></span> <br> <br>

					<c:forEach items="${reviews}" var="review" varStatus="ridx">
						<strong>${review.userName}</strong>


						<c:choose>
							<c:when test="${review.rating eq 0.5}">
								<strong><img src="img/ratings-0.5.jpg" width="98"
									height="14" alt="ratings"></strong>
							</c:when>
							<c:when test="${review.rating eq 0 }">
								<strong><img src="img/ratings-0.jpg" width="98"
									height="14" alt="ratings"></strong>
							</c:when>
							<c:when test="${review.rating eq 1}">
								<strong><img src="img/ratings-1.jpg" width="98"
									height="14" alt="ratings"></strong>
							</c:when>
							<c:when test="${review.rating eq 1.5}">
								<strong><img src="img/ratings-1.5.jpg" width="98"
									height="14" alt="ratings"></strong>
							</c:when>
							<c:when test="${review.rating eq 2}">
								<strong><img src="img/ratings-2.jpg" width="98"
									height="14" alt="ratings"></strong>
							</c:when>
							<c:when test="${review.rating eq 2.5}">
								<strong><img src="img/ratings-2.5.jpg" width="98"
									height="14" alt="ratings"></strong>
							</c:when>
							<c:when test="${review.rating eq 3 }">
								<strong><img src="img/ratings-3.jpg" width="98"
									height="14" alt="ratings"></strong>
							</c:when>
							<c:when test="${review.rating eq 3.5}">
								<strong><img src="img/ratings-3.5.jpg" width="98"
									height="14" alt="ratings"></strong>
							</c:when>
							<c:when test="${review.rating eq 4 }">
								<strong><img src="img/ratings-4.jpg" width="98"
									height="14" alt="ratings"></strong>
							</c:when>
							<c:when test="${review.rating eq 4.5}">
								<strong><img src="img/ratings-4.5.jpg" width="98"
									height="14" alt="ratings"></strong>
							</c:when>
							<c:otherwise>
								<strong><img src="img/ratings-5.jpg" width="98"
									height="14" alt="ratings"></strong>
							</c:otherwise>

						</c:choose>
						<strong>${review.date}</strong>
						<br>
						<p>${review.review}</p>
						<br>
					</c:forEach>



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
	<%@include file="review.jsp"%>
	<%@include file="scripts.jsp"%>


	<script>
	
	//Function to add the user to the subscriber list for a particular book
	function addSubscriber(userId, isbn){
		
		console.log("in subscriber ajax");
		
		var divis = document.getElementById("Sub");
		var ajax=new XMLHttpRequest();
		ajax.open("GET","addSubscription?isbn="+isbn+"&userId="+userId, true);
		ajax.send();
		ajax.onreadystatechange=function(){
			var res=ajax.responseText;
			if(ajax.readyState==4 && ajax.status==200){
				/* updateDiv(); */

				 if(res=="invalid"){
					$('#subscribererrormsg').fadeIn('slow', function(){
						$('#subscribererrormsg').delay(5000).fadeOut(); 
					});

					return;
					}
				 else{
					 $('#subscribmsg').fadeIn('slow', function(){
							$('#subscribmsg').delay(5000).fadeOut(); 
						});
					 
				 }
 


				}
			} 
		
		}
	</script>
</body>
</html>