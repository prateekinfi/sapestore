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
				<h1>Customer Registration</h1>
				<div class="clearfix"></div>
				<form action="getregister" method="post" id="addAddress" onsubmit="sendverificationmail()">
					<fieldset>
						<div class="formrelative">
							<label>First Name <span class="required">*</span></label> <input
								name="firstName" placeholder="First Name" id="firstName"
								required="required" title="Please fill in your first name." 
								onkeyup="check_Alpha('firstName', 'errorfirstname')" onfocusout="removespaces('firstName')"  />
							<div class="forgotPassword formabsolute" id="errorfirstname"></div>
						</div>
						<div class="formrelative">
							<label>Last Name <span class="required">*</span></label> <input
								name="lastName" placeholder="Last Name" id="lastName"
								required="required" title="Please fill in your last name."
								onkeyup="check_Alpha('lastName', 'errorlastname')" onfocusout="removespaces('lastName')"  />
							<div class="forgotPassword formabsolute" id="errorlastname"></div>
						</div>
						<div class="formrelative">
							<label>User Name <span class="required">*</span></label> <input
								id="userName" name="userName" placeholder="Preferred Login Name"
								required="required" onkeyup="validUsername('userName','errorusername')" />
							<div class="forgotPassword formabsolute" id="errorusername"></div>
						</div>
						<div class="formrelative">
							<label>Password <span class="required">*</span></label> <input
								type="password" name="userPassword" placeholder="Login Password"
								title="Minimum length 8 and atleast 1 digit."
								required="required" id="pwd" onkeyup="checkMatch('pwd','cpwd','errorpassword','passwarn')" />
							<div class="forgotPassword formabsolute" id="errorpassword"></div>
						</div>
						<div class="formrelative">
							<label>Retype Password <span class="required">*</span></label> <input
								type="password" name="confirmpassword" id="cpwd"
								placeholder="Retype Password" required="required"
								onkeyup="checkMatch('pwd','cpwd','errorpassword','passwarn')" />
							<div id="passwarn" class="forgotPassword formabsolute"></div>
						</div>
						<div class="formrelative">
							<label>Email Address <span class="required">*</span></label> <input
								 name="mail" placeholder="Email" required="required"
								id="mail" onkeyup="verifyUserEmail('mail','erroremail')" />
							<div class="forgotPassword formabsolute" id="erroremail"></div>
						</div>
						<div class="formrelative">
							<label>Gender <span class="required">*</span></label> <select
								style="margin: 8px 0 16px 0" name="gender" required>
								<option value="">--Select a Gender--</option>
								<option value="1">Male</option>
								<option value="0">Female</option>
							</select>
							<div class="forgotPassword formabsolute" id="errorgender"></div>
						</div>
						<div class="formrelative">
							<label>Mobile No. <span class="required">*</span></label> <input
								type="tel" name="mobile" placeholder="Mobile No." id="mobile"
								required title="Fill in only digits without space,-,(),."
								onkeyup="check_Phone('mobile', 'errormobile')" />
							<div class="forgotPassword formabsolute" id="errormobile"></div>
						</div>
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
					<button type="submit" class="formbutton" id="submitbtn" >Create
						Profile</button>
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
