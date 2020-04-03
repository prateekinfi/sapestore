
<!DOCTYPE html>
<head>
<%@include file="headsection.jsp"%>
</head>
<body onLoad="alignment()">
	<div id="wrapper">
		<!-- header starts-->
		<%@include file="header.jsp"%>
		<!-- header ends -->
		<section>
			<%@include file="bookcategories.jsp"%>
			<div id="mainContent">

				<div class="clearfix"></div>
				<h2>Contact Us</h2>

				<pre>

Tower C, Oxygen Business Park SEZ
Plot No. 7, Sector 144
Noida Uttar Pradesh 201304

Tel: +91 (120) 479 5000
Fax: +91 (120) 479 5001
      </pre>
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