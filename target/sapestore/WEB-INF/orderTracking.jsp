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

<body>
	<div id="wrapper">
		<!-- header starts-->
		<%@include file="header.jsp"%>
		<!-- header ends -->
		<section>
			<div class="leftCol">
				<h2>Account</h2>
				<nav>
					<!-- left navigation -->
					<ul>
						<li><a href="editprofile" title="Personal Information">Personal
								Information</a></li>
						<li><a href="gettransactionhistory" title="Transaction History">Transaction
								History</a></li>
						<li><a href="ordertrack" title="Order Status">Order
								Status</a></li>
					</ul>
				</nav>
			</div>
			</section>
		<section>
			
			<div id="mainContent" class="addAddress">
				<h1 style="font-size:15px;font:SapientSansMedium;color:black; font-weight:Regular; ">Order Tracking</h1>
			
			
			<form action="javascript:void(0)" method="POST" id="addAddress">
					
						<div class="formrelative" style="padding: 0px;">
							<input type="text"
								name="trackName" placeholder="Track Id" id="orderId" autofocus
								required="required" title="Please fill in your track id." 
								 style="float:left" style="color:black;font-size:15px;font:SapientSansRegular;font-weight:Regular;"/>
							<div class="error track" id="errortrack" ></div>
							</div>
					<button type="submit" class="formbutton" id="trackbtn" style="margin-top: 0px; left:15px;"onclick="checkOrderStatus()">Get Order
						</button>
						<div id="orderdisplay" style="margin-top: 25px;">
							<!-- <b id="ordertrackid"></b> &nbsp;&nbsp;<b id="status"></b> -->
						</div>
				</form>
			
			
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
