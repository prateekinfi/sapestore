<!DOCTYPE html>
<html class="no-js">
<%@include file="headsection.jsp"%>
<body onload="showmsg()">
	<div id="wrapper" class="homeAdmin">
	<%@include file="header.jsp"%>
		<section>
			<div id="mainContent">
				<h> <b>Dispatch Orders</b> </h>

				<div class="divTable">
					<div class="divTableHeading">
						<div class="divTableRow">
							<div class="divTableHead2">ORDER NUMBER</div>
							<div class="divTableHead2">CUSTOMER NAME</div>
							<div class="divTableHead2">AMOUNT PAYABLE </div>
							<div class="divTableHead2">SHIPPING ADDRESS</div>
						</div>
					</div>
					<div class="divTableBody">
						<c:forEach items="${user}" var="c">
							<div class="divTableRow">
								<div class="divTableCell2">${c.orderId }</div>
								<div class="divTableCell2">${c.getUser().firstName } ${c.getUser().lastName}</div>
								<div class="divTableCell2">${c.price}</div>
								<c:if test="${c.getUser().addressLine2.length() eq 0}">
								<div class="divTableCell2">${c.getUser().addressLine1},${c.getUser().city.getCityName()},${c.getUser().state.getStateName()}</div>
								</c:if>
								<c:if test="${c.getUser().addressLine2.length() gt 0}">
								<div class="divTableCell2">${c.getUser().addressLine1},${c.getUser().addressLine2},${c.getUser().city.getCityName()},${c.getUser().state.getStateName()}</div>
								</c:if>
							</div>
						</c:forEach>
					</div>
				</div>

			</div>
		</section>
		<div class="clearfix"></div>
		<%@include file="footer.jsp"%>
	</div>
	<%@include file="scripts.jsp"%>
	<script >
		function showmsg(){
			
				$('#dispatchmsg').fadeIn('slow', function(){
					$('#dispatchmsg').delay(5000).fadeOut(); 
				});

				return;
		}
	</script>
</body>
</html>