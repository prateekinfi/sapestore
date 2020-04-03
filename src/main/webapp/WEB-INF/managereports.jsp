<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/pages.css">
<script>

function minval(e) {
    // alert("dsadass");
    //yyy- mm - dd
    var mindate = e.target.value;
  //  alert(mindate);
    var x = mindate.toString();
    var minday = new Date(mindate);
    var yyyy = minday.getFullYear();
    var dd = minday.getDate();
    var mm = minday.getMonth() + 1;
    //alert(yyyy);
    //=2565201

    var today = new Date();
    var yyyy2 = today.getFullYear();
    var dd2 = today.getDate();
   var mm2 = today.getMonth() + 1;

    if(yyyy==yyyy2 ){
        if(mm==mm2  && dd>=dd2){
            var t= new Date();
        t.setFullYear(2017, 0, 1);
        //alert(today);
        e.target.value = t.toISOString().split('T')[0];
        }else if(mm > mm2){
            var t= new Date();
        t.setFullYear(2017, 0, 1);
        //alert(today);
        e.target.value = t.toISOString().split('T')[0];
        }else{

        }
    }
    if (yyyy > yyyy2 ) {

        var t= new Date();
        t.setFullYear(2017, 0, 1);
        //alert(today);
        e.target.value = t.toISOString().split('T')[0];
         }
         var t1= new Date();
        t1.setFullYear(2017, 0, 1);
         e.target.setAttribute("min",t1.toISOString().split('T')[0]);
   //      e.target.setAttribute("defaultDate",t1.toISOString().split('T')[0]);
        e.target.setAttribute("max",today.toISOString().split('T')[0]);
}
function maxval(e) {
    // alert("dsadass");
    //yyy- mm - dd
    var mindate = e.target.value;
  //  alert(mindate);
    var x = mindate.toString();
    var minday = new Date(mindate);
    var yyyy = minday.getFullYear();
    var dd = minday.getDate();
    var mm = minday.getMonth() + 1;
    //alert(yyyy);
    //=2565201

    var today = new Date();
    var yyyy2 = today.getFullYear();
    var dd2 = today.getDate();
   var mm2 = today.getMonth() + 1;

    if(yyyy==yyyy2 ){
        if(mm==mm2  && dd>dd2){
            var t= new Date();
        t.setFullYear(2017, 0, 1);
        //alert(today);
        e.target.value = t.toISOString().split('T')[0];
        }else if(mm > mm2){
            var t= new Date();
        t.setFullYear(2017, 0, 1);
        //alert(today);
        e.target.value = t.toISOString().split('T')[0];
        }else{

        }
    }
    if (yyyy > yyyy2 ) {

        var t= new Date();
        t.setFullYear(2017, 0, 1);
        //alert(today);
        e.target.value = t.toISOString().split('T')[0];
         }
         var t1= new Date();
        t1.setFullYear(2017, 0, 1);
         e.target.setAttribute("min",t1.toISOString().split('T')[0]);
   //      e.target.setAttribute("defaultDate",t1.toISOString().split('T')[0]);
        e.target.setAttribute("max",today.toISOString().split('T')[0]);
}
	function displaytabs(myid) {
		var id = document.getElementById(myid).id;
		document.getElementById('d1').style.background = "#f5f5f5";
		document.getElementById('r1').style.background = "#f5f5f5";
		document.getElementById('p1').style.background = "#f5f5f5";

		if (id == "p1") {
			setblock("purchasedrented");
			setnone("defaulterslist");
			setnone("revenuelist");
			document.getElementById('d1').style.background = "#e0e0e0";
			document.getElementById('r1').style.background = "#e0e0e0";
			document.getElementById("e1").style.display = "none";

		} else if (id == "d1") {
			setblock("defaulterslist");
			setnone("revenuelist");
			setnone("purchasedrented");
			document.getElementById('r1').style.background = "#e0e0e0";
			document.getElementById('p1').style.background = "#e0e0e0";
			document.getElementById('e1').style.display = "block";

		} else {
			setblock("revenuelist");
			setnone("purchasedrented");
			setnone("defaulterslist");
			document.getElementById('p1').style.background = "#e0e0e0";
			document.getElementById('d1').style.background = "#e0e0e0";
			document.getElementById("e1").style.display = "none";
		}

	}

	function setblock(str) {
		document.getElementById(str).style.display = "block";
	}
	function setnone(str) {
		document.getElementById(str).style.display = "none";
	}
	function retaintab(flag) {
		if (flag == "def") {
			setblock("defaulterslist");
			setnone("revenuelist");
			setnone("purchasedrented");
			document.getElementById('d1').style.background = "#f5f5f5";
			document.getElementById('r1').style.background = "#e0e0e0";
			document.getElementById('p1').style.background = "#e0e0e0";
			document.getElementById('e1').style.display = "block";
		} else if (flag == "rev") {
			setblock("revenuelist");
			setnone("purchasedrented");
			setnone("defaulterslist");
			document.getElementById('p1').style.background = "#e0e0e0";
			document.getElementById('r1').style.background = "#f5f5f5";
			document.getElementById('d1').style.background = "#e0e0e0";
			document.getElementById("e1").style.display = "none";

		}

	}
</script>


<style>

</style>
</head>
<h1></h1>
<body onload="retaintab('${flag}')">
	<c:if
		test="${sessionScope.login eq null or sessionScope.login.user.isAdmin eq false }">
		<jsp:forward page="/"></jsp:forward>
	</c:if>
	<div id="wrapper" class="homeAdmin">

		<%@include file="headerAdmin.jsp"%>
		<section>
			<div id="mainContent">
				<div id="tabs">
					<button type="button" class="button1" id="p1"
						onclick="displaytabs(this.id)">Purchased/Rented</button>
					<button type="button" class="button1 dl" id="d1"
						onclick="displaytabs(this.id)">Defaulter's List</button>
					<button type="button" class="button1 rev" id="r1"
						onclick="displaytabs(this.id)">Revenue</button>

					<!-- <button type="submit" class="sumbitandcontinue sub email" id="e1" >Email</button> -->
					<button type="submit" id="e1" form="myForm" value="Email"
						class="sumbitandcontinue sub email">Email</button>
				</div>




				<div id="boxes">
						<div id="purchasedrented">

				<div class="divTableOrder" style="background-color: #f5f5f5;">
					<div class="divTableHeading">
						<div class="divTableRow">
							<div class="divTableHead">CATEGORY</div>
							<div class="divTableHead">BOOK NAME</div>
							<div class="divTableHead">AUTHOR</div>
							<div class="divTableHead">PUBLISHER</div>
							<div class="divTableHead">ORDER TYPE</div>
							<div class="divTableHead">QTY</div>
							<div class="divTableHead">PRICE (In $)</div>
 						</div>
					</div>

					 <c:forEach items="${itemlist}" var="d">
						<div class="divTableBody">
						

<%-- 	 				  <c:forEach items="${m.orderDetails}" var="d">
 --%>						 		<div class="divTableRow">
									<div class="divTableCell">${d.getBook().getCategory().categoryName}</div>
									<div class="divTableCell">${d.getBook().bookTitle}</div>
									<div class="divTableCell">${d.getBook().author}</div>
									<div class="divTableCell">${d.getBook().publisher}</div>
									<div class="divTableCell">
										<c:choose>
											<c:when test="${d.purchaseType eq true}">
                        PURCHASED
                        </c:when>
											<c:otherwise>
                        RENTED
                        </c:otherwise>
										</c:choose>
									</div>
									<div class="divTableCell">${d.quantity}</div>
									
									<div class="divTableCell"><c:choose>
											<c:when test="${d.purchaseType eq true}">
                        ${d.getBook().sellPrice}
                        </c:when>
											<c:otherwise>
                        ${d.getBook().rentPrice}
                        </c:otherwise>
										</c:choose></div>
 								</div>

 

<%-- 							</c:forEach>  
 --%>						</div>
					</c:forEach>
				</div>

			</div>
			<form id="myForm" action="sendemailtodefaulters">
			<div id="defaulterslist">
				<div class="divTableOrder" style="background-color: #f5f5f5;">
					<div class="divTableHeading">
						<div class="divTableRow">
							<div class="divTableHead">CUSTOMER NAME</div>
							<div class="divTableHead">ORDER NO</div>
 							<div class="divTableHead">BOOK NAME</div>
							<div class="divTableHead">DUE DATE</div>
							<div class="divTableHead">RETURN DATE</div>
							<div class="divTableHead">RETURN STATUS</div>
							<div class="divTableHead">RENT PRICE (In $)</div>
							<div class="divTableHead">LATE FEE (In $)</div>
							<div class="divTableHead">EMAIL</div>
						</div>
					</div>

					

						

							<div class="divTableBody">
							<c:forEach items="${defmap}" var="def">
								<div class="divTableRow">


									<div class="divTableCell">${def.key.getUser().firstName}</div>

									<div class="divTableCell">${def.key.getUserOrder().orderId}</div>


 									<div class="divTableCell">${def.key.getBook().bookTitle}</div>

									<div class="divTableCell">${def.key.returnDate}</div>
									<div class="divTableCell"><c:choose>
											<c:when test="${def.key.isReturned() eq false}">
                                                       -
                                            </c:when>
											<c:otherwise>
                                                       ${def.key.lastModifiedDate}
                                            </c:otherwise>
										</c:choose></div>
									<div class="divTableCell">
										<c:choose>
											<c:when test="${def.key.isReturned() eq false}">
                                                       Not Returned
                                            </c:when>
											<c:otherwise>
                                                       Returned
                                            </c:otherwise>
										</c:choose>
									</div>
									<div class="divTableCell">${def.key.getBook().rentPrice}</div>
									<div class="divTableCell">${ def.value }</div>
									<div class="divTableCell">
										<input type="checkbox" name="checkbox"
											value="${def.key.bookRentId}"/>
									</div>




								</div>
								</c:forEach>
							</div>
							<!-- def list end -->
						
					<!-- </form> -->
				</div>


			</div>
			</form>
					<div id="revenuelist">
						<form action="revenuereport" method="post">

							<div class="rTable pp">
								<div class="headingship">
									<span style="font-weight: bold">Revenue Report</span>
								</div>

								<div class="rTableRow">
									<hr
										style="border: none;" />
									<span style="font-weight: bold">From</span> <span
										style="color: red;">*</span> <input name="dateFrom"
										id="dateFrom" type="date" min="2017-01-01"
										onchange="minval(event)" onfocus="minval(event)" required />
									<span style="font-weight: bold; margin-left: 60px">To</span> <span
										style="color: red;">*</span> 
										<input id="dateTo" name="dateTo"
										type='date' min="2017-01-01" onchange="maxval(event)"
										onfocus="minval(event)" required />
										 <input type="submit"
										value="Submit" class="tabButton" value="Submit" />
									<br /> <br />

									<c:if test="${checkEntries eq null}">
										<div class="rTableRow">
											<div class="noData">There are no Records for the
												Selected dates</div>
										</div>
									</c:if>
									<c:if test="${checkEntries ne null}">
										<div class="rTableRow">
											<div class="renthead">Total Rented Books</div>
											<div class="renttotalhead">Rented Books Revenue</div>
											<div class="purchasehead">Total Purchased Books</div>
											<div class="purchasetotalhead">Purchased Books Revenue</div>
											<div class="total">Total Revenue</div>
										</div>
										<br />
										<br />
										<div class="rTableRow">
											<div class="renthead">${totalRentOrders}</div>
											<div class="renttotalhead">$${totalRentRevenue}</div>
											<div class="purchasehead">${totalPurchasedOrders}</div>
											<div class="purchasetotalhead">$${totalPurchaseRevenue}</div>
											<div class="total">$${totalRevenue}</div>
										</div>
									</c:if>
								</div>

							</div>
						</form>

					</div>
				</div>
			</div>
		</section>
		<div class="clearfix"></div>
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>