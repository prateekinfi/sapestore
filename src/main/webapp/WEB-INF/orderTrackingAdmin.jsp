<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@include file="headsection.jsp"%>

<body>
 <c:if test="${sessionScope.login eq null or sessionScope.login.user.isAdmin eq false }">
		<jsp:forward page="/"></jsp:forward>
</c:if> 

	<div id="wrapper"  class="homeAdmin">
		<!-- header starts-->
		<%@include file="headerAdmin.jsp"%>
		<!-- header ends -->
		<section>
			
			<div id="mainContent">
				<h1 style="font-size:15px;font:SapientSansMedium;color:black; font-weight:Regular; ">Order Tracking</h1>
			
			
			<form action="javascript:void(0)" method="POST" id="addAddress">
					
						<div class="formrelative">
							<input type="text"
								name="trackName" placeholder="Track Id" id="orderId" autofocus
								required="required" title="Please fill in your track id." 
								 style="float:left" style="color:black;font-size:15px;font:SapientSansRegular;font-weight:Regular;"/>
							<div class="error track" id="errortrack" ></div>
							</div>
				
				
						
				
					<button type="submit" class="formbutton" id="trackbtn" style="margin-top: 0px; left:15px;"onclick="checkOrderStatus()">Get Order
						</button>
						<div style="margin-top: 25px;">
							<b id="ordertrackid"></b> &nbsp;&nbsp;<b id="status"></b>
						</div>
				</form>
			
			
			</div>
		</section>
		<div class="clearfix"></div>
		<%@include file="footer.jsp"%>
	</div>

	<!-- This contains the hidden content for login popup -->
	<!-- Forgot password-->

	<%@include file="scripts.jsp"%>
</body>
</html>
