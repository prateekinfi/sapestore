<!DOCTYPE html>
<head>
<%@include file="headsection.jsp"%>
</head>
<body` onLoad="alignment()">
	<div id="wrapper">
		<!-- header starts-->
		<%@include file="header.jsp"%>
		<!-- header ends -->
		<section>
			<%@include file="bookcategories.jsp"%>
			<div id="mainContent">

				<div class="clearfix"></div>
				<h2>Privacy Policy</h2>
				<br/>
				<div id="just">
				<p>
				 SapeStore strives to collect, use and disclose user data in a manner 
consistent with the privacy and data security laws of the countries 
in which it does business.  Because of the differences among these 
jurisdictions, SapeStore has adopted a Privacy Policy which creates 
a common core of values, policies and procedures intended to achieve 
nearly universal compliance, supplemented with alternative or additional 
policies or implementation procedures applicable in those jurisdictions 
with unique requirements.This Privacy Policy establishes a minimum 
global standard for collecting, using and protecting information 
that SapeStore collects from users of <a href="${domain}">www.SapeStore.com</a> 
      </p>

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

	<%@include file="scripts.jsp"%>

</body>
</html>