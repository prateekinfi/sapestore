<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js">
<%@include file="headsection.jsp"%>
<body onload="tabchange('${tab}')">
	 <c:if
		test="${sessionScope.login eq null or sessionScope.login.user.isAdmin eq false }">
		<jsp:forward page="/"></jsp:forward>
	</c:if> 
	<div id="wrapper" class="homeAdmin">
		<%@include file="headerAdmin.jsp"%>
		<section>
			<div id="mainContent">
				<div class="tab">
					<button class="tablinks" onclick="openOrder(event, 'Purchased');displaycolourtabs(this.id);"
						id="defaultOpen">Active Orders</button>
					<button class="tablinks" id="rented1" onclick="openOrder(event, 'Rented');displaycolourtabs(this.id);">Rented Books</button>
				</div>

				<!-- Tab content -->
				

					<div id="Purchased" class="tabcontent">
						<form id="form1" method="post">
						<div class="divTableOrder" style="background-color: #f5f5f5;">
							<div class="divTableHeading">
								<div class="divTableRow">
									<div class="divTableHead">ORDER NUMBER</div>
									<div class="divTableHead">ORDER ITEM NUMBER</div>
									<div class="divTableHead">ITEMS</div>
									<div class="divTableHead">ORDER TYPE</div>
									<div class="divTableHead">AMOUNT</div>
									<div class="divTableHead">DISPATCH ORDER(S)</div>
									<div class="divTableHead">PAYMENT RECEIVED</div>
								</div>
							</div>

							<c:forEach items="${orderList}" var="u">

								<div class="divTableBody">
									<div class="divTableRow">
										<div class="divTableCell divUserOrder">
											<span>${u.orderId}</span>
										</div>
										<div class="divTableCell divUserOrder">
											<span>-</span>
										</div>
										<div class="divTableCell divUserOrder">
											<span>-</span>
										</div>
										<div class="divTableCell divUserOrder">
											<span>-</span>
										</div>
										<div class="divTableCell divUserOrder">
											<span>&dollar;${u.price}</span>
										</div>
										<c:if test="${u.status eq 'dispatched'}">
										<div class="divTableCell divUserOrder">
											<span>Dispatched <input id="checkBox" type="checkbox"
												name="dlist" value="${u.orderId}" onclick="valthisform('dlist','plist')" checked="checked"  disabled="disabled"></span>
										</div>
										<div class="divTableCell divUserOrder">
											<span><input  id="checkBox" type="checkbox"
												name="plist" value="${u.orderId}"></span>
										</div>
										</c:if>
										<c:if test="${u.status ne 'dispatched'}">
										<div class="divTableCell divUserOrder">
											<span><input id="checkBox" type="checkbox"
												name="dlist" value="${u.orderId}" onclick="valthisform('dlist','plist')"></span>
										</div>
										<div class="divTableCell divUserOrder">
											<span><input disabled  id="checkBox" type="checkbox"
												name="plist" value="${u.orderId}"></span>
										</div>
										</c:if>
										
										
									</div>
								</div>


								<c:forEach items="${u.orderDetails}" var="d">
									<div class="divTableBody">
										<div class="divTableRow" id="rtr">
											<div class="divTableCell" style="text-align: center">
												<span></span>
											</div>
											<div class="divTableCell " style="text-align: center">
												<span>${d.orderDetailId}</span>
											</div>
											<div class="divTableCell " style="text-align: center">
												<span>${d.getBook().bookTitle}</span>
											</div>
											<c:if test="${d.purchaseType}">
												<div class="divTableCell " style="text-align: center">
													<span>PURCHASED</span>
												</div>
											</c:if>
											<c:if test="${not d.purchaseType}">
												<div class="divTableCell " style="text-align: center">
													<span>RENTED</span>
												</div>
											</c:if>
											<div class="divTableCell " style="text-align: center">
												<span>&dollar;${d.itemPrice}</span>
											</div>
											<div class="divTableCell " style="text-align: center">
												<span></span>
											</div>
											<div class="divTableCell " style="text-align: center">
												<span></span>
											</div>

										</div>
									</div>
								</c:forEach>
							</c:forEach>
						</div>
						<br/>
						<input type="button" value="Dispatch Orders" onclick="setDispatch()" class="tabButton"/> 
						<input type="button" value="Payment Received" onclick="setPayment()" class="tabButton"/>
					</form>
					<ul class="pagination">
					<li><c:if test="${currpg1 gt 1}">
							<a href="manageOrders?type=active&pgno=${currpg1-1}" title="previous"><b>&lt;&lt;</b></a>
						</c:if></li>
						<c:forEach var="i" begin="1" end="${totpgs1}">
							<%-- <li><a href="manageOrders?type=active&pgno=${i}"><b>${i}</b></a></li> --%>
							<c:if test="${i eq currpg1}">
					<div id="activepage">
					<c:if test="${totpgs1 ne 1}">
						<li><a href="manageOrders?type=active&pgno=${i}" ><b><u>${i}</u></b></a></li>
						</c:if></div>
					</c:if>
					<c:if test="${i ne currpg1 }">
					<div id="nonactivepage">
					<li><a href="manageOrders?type=active&pgno=${i}"><b>${i}</b></a></li>
					</div>
					</c:if>
						</c:forEach>
					<%-- <c:forEach items="${plist}" var="i">
						<li><a href="${pgurl}pgno=${i}"><b>${i}</b></a></li>
					</c:forEach> --%>
					<li><c:if test="${currpg1 lt totpgs1}">
							<a href="manageOrders?type=active&pgno=${currpg1+1}"><b>&gt;&gt;</b></a>
						</c:if></li>
				</ul>
				<br>
					</div>

					


				
					<div id="Rented" class="tabcontent">
						<form id="form2" method="post">
						<div class="divTableOrder" style="background-color: #f5f5f5;">
							<div class="divTableHeading">
								<div class="divTableRow">
									<div class="divTableHead">ORDER NUMBER</div>
									<div class="divTableHead">BOOK NAME</div>
									<!-- <div class="divTableHead">LATE FEE</div> -->
									<div class="divTableHead">RETURN DATE</div>
									<div class="divTableHead">BOOK RETURNED</div>
									<div class="divTableHead">LATE FEE PAID</div>
								</div>
							</div>

							<c:forEach items="${rentMap}" var="def">

								<div class="divTableBody">
									<div class="divTableRow">
										<div class="divTableCell divUserOrder">
											<span>${def.key.getUserOrder().orderId}</span>
										</div>
										<div class="divTableCell divUserOrder">
											<span>${def.key.getBook().bookTitle}</span>
										</div>
										<%-- <div class="divTableCell divUserOrder">
											<span>${def.value}</span>
										</div> --%>
										<div class="divTableCell divUserOrder">
											<span>${def.key.returnDate}</span>
										</div>
										<c:if test="${def.key.isReturned()}">
										<div class="divTableCell divUserOrder">
											<span>Received <input id="checkBox" type="checkbox"
												name="rlist" value="${def.key.bookRentId}" checked="checked" onclick="valthisform('rlist','flist')" disabled="disabled"></span>
										</div>
										<div class="divTableCell divUserOrder">
											<span><input  id="checkBox" type="checkbox"
												name="flist" value="${def.key.bookRentId}"></span>
										</div>
										</c:if>
										<c:if test="${not def.key.isReturned()}">
										<div class="divTableCell divUserOrder">
											<span><input id="checkBox" type="checkbox"
												name="rlist" value="${def.key.bookRentId}" onclick="valthisform('rlist','flist')"></span>
										</div>
										<div class="divTableCell divUserOrder">
											<span><input disabled  id="checkBox" type="checkbox"
												name="flist" value="${def.key.bookRentId}"></span>
										</div>
										</c:if>
										
									</div>
								</div>
							</c:forEach>
						</div>
						 <br />
					<input type="button" value="Book Received" onclick="setReturned()" class="tabButton"/> 
					<input type="button" value="Late Fine Received" onclick="setLatefee()" class="tabButton"/>
					</form>
					<ul class="pagination">
					<li><c:if test="${currpg2 gt 1}">
							<a href="manageOrders?type=rented&pgno=${currpg2-1}" title="previous"><b>&lt;&lt;</b></a>
						</c:if></li>
						<c:forEach var="i" begin="1" end="${totpgs2}">
							<%-- <li><a href="manageOrders?type=rented&pgno=${i}"><b>${i}</b></a></li> --%>
							<c:if test="${i eq currpg2}">
					<div id="activepage">
					<c:if test="${totpgs2 ne 1}">
						<li><a href="manageOrders?type=rented&pgno=${i}" ><b><u>${i}</u></b></a></li>
					</c:if>	</div>
					</c:if>
					<c:if test="${i ne currpg2 }">
					<div id="nonactivepage">
					<li><a href="manageOrders?type=rented&pgno=${i}"><b>${i}</b></a></li>
					</div>
					</c:if>
						</c:forEach>
					<%-- <c:forEach items="${plist}" var="i">
						<li><a href="${pgurl}pgno=${i}"><b>${i}</b></a></li>
					</c:forEach> --%>
					<li><c:if test="${currpg2 lt totpgs2}">
							<a href="manageOrders?type=rented&pgno=${currpg2+1}"><b>&gt;&gt;</b></a>
						</c:if></li>
				</ul>
				<br>
					</div>

					
						
				
			</div>
		
		</section>
		<div class="clearfix"></div>
		<!-- <div id="payment2" class="successBanner">Payment of following orders have been received.</div>
		<div id="latefee2" class="successBanner">Late fee information of following books have been updated.</div> -->
		<div id="dispatch" class="errorBanner">Please select atleast one
			order to dispatch.</div>
		<div id="payment" class="errorBanner">Please select atleast one
			order to update payment information.</div>
		<div id="returned" class="errorBanner">Please select atleast one
			book that is returned.</div>
		<div id="latefee" class="errorBanner">Please select atleast one
			book to update late fine.</div>
		
		<%@include file="footer.jsp"%>
		
	</div>
	<%@include file="scripts.jsp"%>
	<script>
	document.getElementById("defaultOpen").click();

	function openOrder(evt, orderTypeName) {
	    // Declare all variables
	    var i, tabcontent, tablinks;

	    // Get all elements with class="tabcontent" and hide them
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }

	    // Get all elements with class="tablinks" and remove the class "active"
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }

	    // Show the current tab, and add an "active" class to the button that opened the tab
	    document.getElementById(orderTypeName).style.display = "block";
	    evt.currentTarget.className += " active";
	}
	function displaycolourtabs(id){
		
		if(id=="rented1"){
				document.getElementById("rented1").style.backgroundColor="#f5f5f5";
			document.getElementById("defaultOpen").style.backgroundColor="#e0e0e0";
		}else if(id=="defaultOpen"){
				document.getElementById("rented1").style.backgroundColor="#e0e0e0";
			document.getElementById("defaultOpen").style.backgroundColor="#f5f5f5";
		}
 } 
	
	function setDispatch() {
	    
	    $('#form1').attr('action','dispatchList')
	    var dispatchList=document.getElementsByName("dlist");
	   	var flag = false;
	    for(var i=0,l=dispatchList.length;i<l;i++)
	    {
	        if(dispatchList[i].checked && dispatchList[i].disabled==false)
	        {
	        	flag=true;
	            $('#form1').submit();
	            break;
	        }
	    }
	    if(flag==false){
	    	$("#dispatch").fadeIn('slow', function(){
			       $("#dispatch").delay(2000).fadeOut(); 
			    });
	    }
	    
	}

	function setPayment() {
	   
	    $('#form1').attr('action','paymentList')
	    var payList=document.getElementsByName("plist");
	    //var dispatchList=document.getElementsByName("dlist");
		var flag = false;
	    
	    for(var i=0,l=payList.length;i<l;i++)
	    {
	        if(payList[i].checked)
	        {
	        	flag=true;
	        	
	            $('#form1').submit();
	            break;
	        }
	    }
	    if(flag==false){
	    	$("#payment").fadeIn('slow', function(){
			       $("#payment").delay(2000).fadeOut(); 
			    });
	    }
	}
	
	function setReturned() {
	    
	    $('#form2').attr('action','returnedList')
	    var returnList=document.getElementsByName("rlist");
	   	var flag = false;
	    for(var i=0,l=returnList.length;i<l;i++)
	    {
	        if(returnList[i].checked && returnList[i].disabled==false)
	        {
	        	flag=true;
	            $('#form2').submit();
	            break;
	        }
	    }
	    if(flag==false){
	    	$("#returned").fadeIn('slow', function(){
			       $("#returned").delay(2000).fadeOut(); 
			    });
	    }
	}

	function setLatefee() {
	   
	    $('#form2').attr('action','lateFeeList')
	    var lateList=document.getElementsByName("flist");
	    var flag = false;
	    
	    for(var i=0,l=lateList.length;i<l;i++)
	    {
	        if(lateList[i].checked)
	        {
	        	flag=true;
	            $('#form2').submit();
	            break;
	        }
	    }
	    if(flag==false){
	    	$("#latefee").fadeIn('slow', function(){
			       $("#latefee").delay(2000).fadeOut(); 
			    });
	    }
	}
	
	
	function tabchange(id){
		if(id=="r"){
			
			displaycolourtabs("rented1");
			openOrder(event, 'Rented');
			
		}
		else {
			displaycolourtabs("defaultOpen");
			openOrder(event, 'Purchased');
		}
	} 
	
	</script>

</body>
</html>