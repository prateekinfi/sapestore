<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<%@include file="headsection.jsp"%>
<link rel="stylesheet" href="css/comm.css">
<link rel="stylesheet" href="css/selectadd.css">
<link rel="stylesheet" href="css/order.css">
<link rel="stylesheet" href="css/main.css">

</head>
<body onLoad="alignment()">
	<div id="wrapper">
		<!-- header starts-->
		<%@include file="Headeruser.jsp"%>
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
 <div id="mainContent">
    <form action="/sapestore/">

      <h2>YOUR ORDER</h2> Order Id:  ${sessionScope.order.orderId}<br/>
     <!--  <hr style="border: none; border-top: 1px dashed #b7bcbd;  height:0;" /> -->
      <h3>SHIPPING ADDRESS</h3>
       <hr style="border: none; border-top: 1px dashed #b7bcbd;  height:0;" />
       ${sessionScope.login.user.firstName} ${sessionScope.login.user.lastName} <br />
      ${sessionScope.shipaddress.addressLine1} <br />
      ${sessionScope.shipaddress.addressLine2} <br />
      ${sessionScope.shipaddress.city.cityName},${sessionScope.shipaddress.state.stateName} <br />
      ${sessionScope.shipaddress.postalCode} <br /> ${sessionScope.login.user.mobile} <br />
           
<br/>
          <%--   <b style="margin-left:-10px">ORDER SUMMARY</b>
      <div class="rTable">
        <div class="rTableBody">
          <div class="rTableRow">
          <hr style="border: none; border-top: 1px dashed #b7bcbd;  height:0;" />
             <div class="rTableHead">S.NO.</div>
            <div class="rTableHead"></div> 
            <div class="rTableHead">BOOK NAME</div>
             <div class="rTableHead">QUANTITY</div>
            <div class="rTableHead">PRICE</div>
            <div class="rTableHead">SUB TOTAL</div> 
          </div>
          <c:forEach items="${sessionScope.cartitems}" var="p" varStatus="i">
            <div class="rTableRow">
            <hr style="border: none; border-top: 1px dashed #b7bcbd;  height:0;" />
               <div class="rTableCell">${i}</div> 
              <div class="rTableCell">${p.img}</div> 
              <div class="rTableCell">${p.bookTitle}</div>
              <div class="rTableCell">${p.qty}</div>
              <div class="rTableCell">${p.price}</div>
              <div class="rTableCell">${p.qty*p.price}</div> 
            </div>
          </c:forEach>
        </div>
      </div>
      
      <div style="padding-top: 20px;padding-bottom:20px">

       <br/> Thanks a lot for shopping. We have received your request. You can
      check the order. <br />
      <!-- <input type="submit"
		value="Shop More" class="lightButton"
		style="position: absolute; left: 20px; bottom: 30px"></a> -->
      <a href="/sapestore/" ><button type="submit" class="sbt">Shop More</button></a>
      </div>
    </form>
    </div> --%>
  </section>
 <div class="clearfix"></div>
  <footer>
    <div id="footer">Powered by <img src="img/sapient_nitro.jpg" width="78" height="14" alt="sapient nitro"></div>
  </footer>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> 
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script> 
<script src="js/plugins.js"></script> 
<script src="js/main.js"></script> 
</body>
</html>