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
		<%@ include file="header.jsp"%>
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
					<h1>Customer Profile</h1>
					<div class="clearfix"></div>
					<form action="updateprofile" method="post" id="addAddress">
						<fieldset>
							<div class="formrelative">
								<label>First Name <span class="required">*</span></label> <input
									name="firstName" id="firstName" placeholder="First Name"
									required="required" title="Please fill in your first name."
									onkeyup="check_Alpha('firstName', 'errorfirstname')" onfocusout="removespaces('firstName')" 
									value='${sessionScope.login.user.firstName}' readonly />
									<div class="forgotPassword formabsolute" id="errorfirstname"></div>
							</div>
							<div class="formrelative">
								<label>Last Name <span class="required">*</span></label> <input
									name="lastName" id="lastName" placeholder="Last Name" title="Please fill in your last name."
									required="required" value='${sessionScope.login.user.lastName}'
									onkeyup="check_Alpha('lastName', 'errorlastname')" onfocusout="removespaces('lastName')" readonly />
									<div class="forgotPassword formabsolute" id="errorlastname"></div>
							</div>
							<div class="formrelative">
								<label>User Name <span class="required">*</span></label> <input
									id="userName" name="userName" id="userName"
									placeholder="Preferred Login Name" required="required"
									value='${sessionScope.login.userName}' readonly />
									<div class="forgotPassword formabsolute" id="errorusername"></div>
							</div>
							
							<div class="forgotPassword formabsolute" id="errorpassword"></div>
							<div id="passwarn" class="forgotPassword formabsolute"></div>
							<div class="formrelative">
								<label>Email Address <span class="required">*</span></label> <input
									type="text" name="mail" id="mail" placeholder="Email" required="required"
									value='${sessionScope.login.user.mail}' readonly />
									<c:if test="${sessionScope.login.isVerified() eq true}"><img src="img/greentick.png" width="45" height="45"></c:if>
									<c:if test="${sessionScope.login.isVerified() eq false}"><input type="button" id="verifyemail" style="background-color: #9e9e9ee3;border: #9e9e9ee3;" value="Verify Email" onclick="sendverificationmail()">
									<div id="someHiddenDiv" style="display: none"></div>
									</c:if>
								<div class="forgotPassword formabsolute" id="erroremail"></div>
							</div>
							<div class="formrelative">
								<label>Gender <span class="required">*</span></label> <select
									style="margin: 8px 0 16px 0" name="gender" id="gender"
									disabled="disabled" >
									<c:if test="${sessionScope.login.user.gender eq true}">
										<option value='${sessionScope.login.user.gender}'>Male</option>
									</c:if>
									<c:if test="${sessionScope.login.user.gender eq false}">
										<option value='${sessionScope.login.user.gender}'>Female</option>
									</c:if>
									<option value="1">Male</option>
									<option value="0">Female</option>
								</select>
								<div class="forgotPassword formabsolute" id="errorgender"></div>
							</div>
							<div class="formrelative">
								<label>Mobile No. <span class="required">*</span></label> <input
									type="tel" name="mobile" id="mobile" placeholder="Mobile No."
									required="required" value='${sessionScope.login.user.mobile}'
									title="Fill in only digits without space,-,(),."
									onkeyup="check_Phone('mobile', 'errormobile')" readonly />
									<div class="forgotPassword formabsolute" id="errormobile"></div>
							</div>
							<div class="formrelative">
								<label>Address Line 1 <span class="required">*</span></label> <input
									name="addressLine1" id="addressLine1"
									placeholder="Address Line 1" required="required"
									onkeyup="check_address('addressLine1', 'erroradd1')"
									value='${sessionScope.login.user.addressLine1}' readonly />
									<div class="forgotPassword formabsolute" id="erroradd1"></div>
							</div>
							<div class="formrelative">
								<label>Address Line 2</label> <input name="addressLine2"
									id="addressLine2" placeholder="Address Line 2"
									onkeyup="check_address('addressLine2', 'erroradd2')" 
									value='${sessionScope.login.user.addressLine2}' readonly />
									<div class="forgotPassword formabsolute" id="erroradd2"></div>
							</div>
							<div class="formrelative">
								<label>Country <span class="required">*</span></label> <select
									name="country" id="country" onclick="setState()"
									style="margin: 8px 0 16px 0" disabled="disabled" required>
									<option value="${sessionScope.login.user.country.countryId}">${sessionScope.login.user.country.countryName}</option>
									<c:forEach items="${countries}" var="country">
										<option value="${country.countryId}">${country.countryName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="formrelative">
								<label>State <span class="required">*</span></label> <select
									name="state" id="state" onchange="setCity()"
									style="margin: 8px 0 16px 0" disabled="disabled"  required>
									<option value="${sessionScope.login.user.state.stateId}">${sessionScope.login.user.state.stateName}</option>
								</select>
							</div>
							<div class="formrelative">
								<label>City <span class="required">*</span></label> <select
									name="city" id="city" style="margin: 8px 0 16px 0"
									disabled="disabled" onclick="setPostal()"  required>
									<option value="${sessionScope.login.user.city.cityId}">${sessionScope.login.user.city.cityName}</option>
								</select>
							</div>
							<div class="formrelative">
							<label>Postal Code<span class="required">*</span></label> <input
								name="postal" placeholder="Postal Code" id="postal" value="${sessionScope.login.user.city.postalCode}"required
								disabled="disabled"   />
						</div>
						</fieldset>
						<div id="block1" style="display: block">
							<input type="button" class="formbutton" value="Edit Profile"
								onclick="EnableForm()"> <a class="formbutton" href="changepassword">Reset Password</a>
						</div>
						<div id="block2" style="display: none">
							<input type="submit" id="submitbtn" class="formbutton"
								value="Update" /> <input type="button" value="Cancel"
								class="formbutton" onclick="DisableForm()" />
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
