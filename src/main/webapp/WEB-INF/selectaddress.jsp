<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="headsection.jsp"%>
<title>Order shipping Address</title>
</head>
<body onload="homecheck('${home1}')">
<div id="home" class="errorBanner">Home Address cannot be deleted</div>
<div id="nothome" class="successBanner">Address deleted</div>


	<div id="wrapper">
		<%@include file="Headeruser.jsp"%>

		<%@include file="common.jsp"%>
		<div id="mainContent">



			<form action="ordershippingaddresssubmit" method="post">

				<div class="rTable">
					<div class="rTableCell headingship"><strong>Select Address:</strong></div>

					<div class="rTableBody">

						<div class="rTableRow">
							<hr />
							<input type="radio" name="addr" value="-1"
								checked="checked" />${home} <br>
							
							<c:forEach items="${shipping}" var="s">
								<input type="radio" name="addr" value="${s.key}" />${s.value}
							<br>
							</c:forEach>



						</div>
						<p>
							<c:if test="${number eq 3}">
								<a href="addaddress"><input type="button" value="Add Address" disabled
									class="sbt"/></a> 
							</c:if>
							
							<c:if test="${number ne 3}">
								<a href="addaddress"><input type="button" value="Add Address"
									class="sbt"/></a> 
							</c:if>
									<button type="submit"
									class="sbt" formaction="removeaddress">Remove Address</button>
							<button type="submit" value="Submit" class="sbt">Place Order</button>
						</p>


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
		<%@include file="review.jsp"%>
		<%@include file="scripts.jsp"%>
		<script type="text/javascript">
			function homecheck(home){
				if(home == 'yes'){
					$("#home").fadeIn('slow', function(){
					       $("#home").delay(5000).fadeOut(); 
					    });
				}
				else if(home == 'no'){
					$("#nothome").fadeIn('slow', function(){
					       $("#nothome").delay(5000).fadeOut(); 
					    });
				}
				
			}
			
		</script>
</body>
</html>
