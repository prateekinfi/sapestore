<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js">
<%@include file="headsection.jsp"%>
<body>
	<c:if
		test="${sessionScope.login eq null or sessionScope.login.user.isAdmin eq false }">
		<jsp:forward page="/"></jsp:forward>
	</c:if>

	<div id="wrapper" class="homeAdmin">
		<%@include file="headerAdmin.jsp"%>
		<section>

			<div id="mainContent">
				<h> <b>Inventory Summary </b>
				<div style="color: red; text-align: center">
					<b>${msg}</b>
				</div>
				<p>
					<a href="addbook?pgno=${currpg}"><input type="submit"
						value="Add Books" class="addButton"></a>
				</p>
				</h>

				<div class="divTable">
					<div class="divTableHeading">
						<div class="divTableRow">
							<div class="divTableHead">CATEGORY</div>
							<div class="divTableHead">BOOK NAME</div>
							<div class="divTableHead">AUTHOR</div>
							<div class="divTableHead">PUBLISHER</div>
							<div class="divTableHead">FOR RENT</div>
							<div class="divTableHead">FOR SALE</div>
							<div class="divTableHead">ACTION</div>
						</div>
					</div>

					<div class="divTableBody">
						<c:forEach items="${blist}" var="c">
							<div class="divTableRow">
								<div class="divTableCell">${c.category.categoryName }</div>
								<div class="divTableCell">${c.bookTitle }</div>
								<div class="divTableCell">${c.author }</div>
								<div class="divTableCell">${c.publisher }</div>

								<c:if test="${c.inventory.rentQuantity gt 5}">
									<div class="divTableCell">${c.inventory.rentQuantity}</div>
								</c:if>

								<c:if test="${c.inventory.rentQuantity le 5}">
									<div class="divTableCell">
										<font color="red">${c.inventory.rentQuantity}</font>
									</div>
								</c:if>




								<c:if test="${c.inventory.purchaseQuantity gt 5}">
									<div class="divTableCell">${c.inventory.purchaseQuantity}</div>
								</c:if>

								<c:if test="${c.inventory.purchaseQuantity le 5}">
									<div class="divTableCell">
										<font color="red">${c.inventory.purchaseQuantity}</font>
									</div>
								</c:if>


								<div class="divTableCell">
									<a href="editu?isbn=${c.isbn}&pgno=${currpg}"> <img
										src="img/edit.png" width="25" height="25" alt="edit"></a> <a
										href="delete?isbn=${c.isbn}&pgno=${currpg}"><img
										src="img/delete.png" width="25" height="25" alt="edit"
										onclick=""> </a>

								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<ul class="pagination">
					<li><c:if test="${currpg gt 1}">
							<a href="${pgurl}pgno=${currpg-1}" title="previous"><b>&lt;&lt;</b></a>
						</c:if></li>
					<c:forEach items="${plist}" var="i">
						<c:if test="${i eq currpg}">
					<div id="activepage">
					<c:if test="${totpgs ne 1}">
						<li><a href="${pgurl}pgno=${i}" ><b><u>${i}</u></b></a></li>
					</c:if>	</div>
					</c:if>
					<c:if test="${i ne currpg }">
					<div id="nonactivepage">
					<li><a href="${pgurl}pgno=${i}"><b>${i}</b></a></li>
					</div>
					</c:if>
					</c:forEach>
					<li><c:if test="${currpg lt totpgs}">
							<a href="${pgurl}pgno=${currpg+1}"><b>&gt;&gt;</b></a>
						</c:if></li>
				</ul>
			</div>
		</section>
		<div class="clearfix"></div>

		<%@include file="footer.jsp"%>
	</div>
	<%@include file="deletePopup.jsp"%>
	<%@include file="scripts.jsp"%>
</body>
</html>