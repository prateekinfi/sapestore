<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.login eq null }">
	<jsp:forward page="/">
		<jsp:param value="Please Login" name="msg" />
	</jsp:forward>
</c:if>
<!DOCTYPE html>
<html>
<%@include file="headsection.jsp"%>
<%@include file="scripts.jsp"%>
<body onLoad="alignment() ">
	<c:if test="${customerorderlen eq 0 }">
		<div id="norderbanner" class="errorBanner">No orders to show</div>
		<script type="text/javascript"> 
			showBanner("norderbanner");
		</script>
	</c:if>
	<div id="wrapper">
		<%@ include file="header.jsp"%>
		<section>
			<div class="leftCol" id="leftColId">
				<h2>Account</h2>
				<nav>
					<!-- left navigation -->
					<ul>
						<li><a href="editprofile" title="Personal Information">Personal
								Information</a></li>
						<li><a href="gettransactionhistory"
							title="Transaction History">Transaction History</a></li>
						<li><a href="ordertrack" title="Order Status">Order
								Status</a></li>
					</ul>
				</nav>
			</div>
		</section>
		<section>
			<div id="mainContent" class="addAddress">
				<h1>Customer Transaction History</h1>
				<div class="clearfix"></div>
				<c:if test="${customerorderlen ne 0 }">
					<div style="height: 600px;">
						<fieldset>
							<div class="orderheading" style="background-color: transparent;">
								<div class="ordercol">Order Id #</div>
								<div class="ordercol">Created Date</div>
								<div class="ordercol">Price</div>
								<div class="ordercol">Payment Mode</div>
								<div class="ordercol">Status</div>
								<!-- <div class="ordercol">Shipping Address</div> -->
							</div>
							<c:forEach items="${customerorder}" var="order" varStatus="ord">
								<div class="ordermain"
									onclick="displaytransaction('${ord.index}', '${customerorderlen}', 'orderbody${ord.index}');">
									<div class="orderbody" id="orderbody${ord.index}"
										style="text-align: center; text-decoration: none; display: block;">
										<div class="ordercol">${order.orderId}</div>
										<div class="ordercol">${order.createdDate}</div>
										<div class="ordercol">&dollar;${order.price}</div>
										<div class="ordercol">${order.paymentMode}</div>
										<div class="ordercol">${order.status}</div>
										<%-- <div class="ordercol">${order.shippingAddress}</div> --%>
									</div>
									<div id="${ord.index}" class="orderbody"
										style="text-align: center; text-decoration: none; display: none; background-color: #ffffff">
										<div class="ordercol">ISBN #</div>
										<!-- <div class="ordercol">Image</div> -->
										<div class="ordercol" style="width:30%">Book Title</div>
										<div class="ordercol">Purchase Type</div>
										<div class="ordercol">Item Price</div>
										<div class="ordercol" style="width:10%">Quantity</div>
										<hr style="color: black" />
										<c:forEach items="${order.orderDetails}" var="orderdet"
											varStatus="ord">
											<div class="ordercol">${orderdet.book.isbn}</div>
											<%-- 	<div class="ordercol">
											<img src="img?bookimg=${orderdet.book.thumbImage}img/book.jpg" width="131"
								height="180" alt="${orderdet.book.bookTitle}">
										</div> --%>
											<div class="ordercol" style="width:30%">${orderdet.book.bookTitle}</div>
											<div class="ordercol">
												<c:if test="${orderdet.purchaseType eq false}">
													Rent
												</c:if>
												<c:if test="${orderdet.purchaseType eq true}">
													Purchase
												</c:if>
											</div>
											<div class="ordercol">&dollar;${orderdet.itemPrice}</div>
											<div class="ordercol" style="width:10%">${orderdet.quantity}</div>
										</c:forEach>
									</div>
								</div>
							</c:forEach>
							
						</fieldset>
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
				</c:if>
				
			</div>
		</section>
		<div class="clearfix"></div>
		<%@include file="footer.jsp"%>
	</div>

	<!-- This contains the hidden content for shopping cart popup -->
	<%@include file="cart.jsp"%>
	<!-- This contains the hidden content for login popup -->
	<%@include file="login.jsp"%>



</body>
</html>