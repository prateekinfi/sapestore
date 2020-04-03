<!DOCTYPE html>
<html>
<head>

<%@include file="headsection.jsp" %>
<title>Order shipping Address</title>

<link rel="stylesheet" href="css/pages.css">
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/main.css">
</head>
<body>

<div id="wrapper">
<%@include file="Headeruser.jsp" %>
	
	<%@include file="common.jsp" %>
	<div id="mainContent">



		<form action="submitaddress" method="get">

			<div class="rTable">
	    <div class="rTableCell headingship">Shipping Address</div>
	  
	      <div class="rTableBody">
					
	        <hr/>
	        		<div class="formrelative">
						<label for="nametext" class="rTableCell smalltext">Customer Name </label>
						<%-- <div class="rTableCell">
							<div class="nametext" id="nametext">${sessionScope.login.userName }</div>
						</div> --%>
						<%-- <input type="text" id="nametext" value="${sessionScope.login.userName}" readonly="readonly"/> --%>
						<label id="nametext">${sessionScope.login.userName}</label>
							
					</div>
					<br>
					<div class="formrelative">
							<label>Mobile No. <span class="required">*</span></label> 
							<input
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
					
					
					
					
					
					
					
					
					
					
					
	        <div class="rTableRow">
	    			<div class="rTableCell smalltext"></div>
						<div class="rTableCell">
						<button type="submit" value="Submit" id="submitbtn" class="sbt">Save
	  						&amp; Continue</button>
						</div>
					</div>
	        
				</div>
			</div>
		</form>
</div>
<div class="clearfix"></div>

		<%@include file="footer.jsp"%>
	</div>
<!-- This contains the hidden content for shopping cart popup -->
	<%@include file="cart.jsp"%>
	<!-- This contains the hidden content for login popup -->
	<%@include file="login.jsp"%>
	<!-- Forgot password-->

	<%@include file="scripts.jsp"%>
</html>