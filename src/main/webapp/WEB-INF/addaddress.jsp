<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@include file="headsection.jsp"%>

<body onLoad="alignment()">
	<div id="wrapper">
		<!-- header starts-->
		<%@include file="header.jsp"%>
		<!-- header ends -->
		<section>
			<%@include file="bookcategories.jsp"%>
			<div id="mainContent" class="addAddress">
				<h1>Add Address</h1>
				<div class="clearfix"></div>
				<form action="" method="post" id="addAddressAgain">
					<fieldset>
						<div class="formrelative">
							<label>Address Line 1 <span class="required">*</span></label> <input
								name="addressLine1" id="addressLine1"  
								placeholder="Address Line 1" required="required" 
								onkeyup="check_address('addressLine1', 'erroradd1')" />
							<div class="forgotPassword formabsolute" id="erroradd1"></div>
						</div>
						<div class="formrelative">
							<label>Address Line 2</label> <input name="addressLine2"
								id="addressLine2" placeholder="Address Line 2" />
							<div class="forgotPassword formabsolute" id="erroradd2"></div>
						</div>
						<div class="formrelative">
							<label>Country <span class="required">*</span></label> <select
								required id="country" name="country" onchange="setState()"
								style="margin: 8px 0 16px 0">
								<option value="">--Select a Country--</option>
								<c:forEach items="${countries}" var="country">
									<option value="${country.countryId}">${country.countryName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="formrelative">
							<label>State <span class="required">*</span></label> <select
								name="state" onchange="setCity()" id="state"
								style="margin: 8px 0 16px 0" required>
								<option value="">--Select a State--</option>

							</select>
						</div>
						<div class="formrelative">
							<label>City <span class="required">*</span></label> <select
								name="city" id="city" style="margin: 8px 0 16px 0" required
								onchange="setPostal()">
								<option value="">--Select a City--</option>

							</select>
						</div>
						<div class="formrelative">
							<label>Postal Code<span class="required">*</span></label> <input
								name="postal" placeholder="Postal Code" id="postal" required
								disabled="disabled" />
						</div>
					</fieldset>
					<button type="submit" class="formbutton" id="submitbtn1" >Add Address</button>
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
