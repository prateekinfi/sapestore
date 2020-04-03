<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div style="display: none;" id="mycartview">
	<div id="shoppingCart" class="popup">
		<!-- <div id="cartScreen" class="cartdialogue" align="center"> -->
		<div class="yourcart">
			<img src="img/icon_cart.jpg" />Your Cart
		</div>
		<hr />
		<c:choose>
			<c:when test="${not empty sessionScope.cartitems}">
				<div class="scroller" id="itemsofcart">
					<div class="rTableRow">
						<div class="rTableHead itemhead">ITEM(S)</div>
						<div class="rTableHead qtyhead">QTY.</div>
						<div class="rTableHead tranhead">TRANSACTION TYPE</div>
						<div class="rTableHead pricehead">PRICE (IN $)</div>
						<div class="rTableHead subhead">SUBTOTAL (IN $)</div>
						<div class="rTableHead buttonhead"></div>
					</div>

					<c:forEach items="${sessionScope.cartitems}" var="items">
						<div style="display: block" id="bookrow${items.isbn}">
							<div class="rTableRow" id="row${items.isbn}">

								<input type="hidden" name="isbn" value="${items.isbn}">
								<div class="rTableCell itemhead">
									<div id="bookimage">
										<img src="img?bookimg=${items.isbn}thumb.jpg" width="81"
											height="112" alt="${items.bookTitle}">
									</div>
									<div id="booktitle">
										<a href="viewdetails?isbn=${items.isbn}"><b>${items.bookTitle}</b></a>
									</div>
								</div>
								<div class="rTableCell qtyhead">
									<input name="quantity" id="quantity${items.isbn}" type="number"
										value="${sessionScope.quantityMap[items.isbn]}" min="1"
										onchange="toDoQuantity(${items.rentPrice},${items.sellPrice},${items.isbn})"
										onkeyup="toDoQuantity(${items.rentPrice},${items.sellPrice},${items.isbn})" />
								</div>
								<c:if test="${sessionScope.purchaseMap[items.isbn] eq 1}">
									<div class="rTableCell tranhead">
										<select name="transactiontype"
											id="transactiontype${items.isbn}" type="text"
											onchange="toDoTransaction(${items.rentPrice},${items.sellPrice}, ${items.isbn})"
											onkeyup="toDoTransaction(${items.rentPrice},${items.sellPrice}, ${items.isbn})">
											<option selected="selected">Purchase</option>
											<option>Rent</option>
										</select>

									</div>
									<div class="rTableCell subhead" id="price${items.isbn}">${items.sellPrice}</div>
									<div class="rTableCell subhead" id="finalprice${items.isbn}"
										name="finalprice">${items.sellPrice*sessionScope.quantityMap[items.isbn]}</div>
								</c:if>
								<c:if test="${sessionScope.purchaseMap[items.isbn] eq 0}">
									<div class="rTableCell tranhead">
										<select name="transactiontype"
											id="transactiontype${items.isbn}" type="text"
											onchange="toDoTransaction(${items.rentPrice},${items.sellPrice},${items.isbn})"
											onkeyup="toDoTransaction(${items.rentPrice},${items.sellPrice},${items.isbn})">
											<option>Purchase</option>
											<option selected="selected">Rent</option>
										</select>
									</div>
									<div class="rTableCell subhead" id="price${items.isbn}">${items.rentPrice}</div>
									<div class="rTableCell subhead" id="finalprice${items.isbn}"
										name="finalprice">${items.rentPrice*sessionScope.quantityMap[items.isbn]}</div>
								</c:if>
								<div class="rTableCell buttonhead">
									<a href="javascript:void(0);"
										onclick="removecart(${items.isbn})">
										<button id="buttonhead" name="remove" type="text">Remove</button>
									</a>
								</div>
								<div id="quantitymessage${items.isbn}"></div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id="totalamtpay">
					<div id="totalamtfloat">
						Total Amount Payable: $<span id="total"></span>
					</div>
					<hr />
					<a href="/sapestore/"><input type="submit"
						value="Close &amp; Continue Shopping" class="lightButton"></a>
					<a href="cartcheckout"><input type="submit" value="Checkout"
						class="lightButton checkout"></a>
				</div>
			</c:when>
			<c:otherwise>
				<div style="position: absolute; left: 320px; top: 200px">Your
					cart is empty</div>
				<div id="carthr">
					<hr />
				</div>
				<a href="/sapestore/"><input type="submit"
					value="Close &amp; Continue Shopping" class="lightButton"
					style="position: absolute; left: 20px; bottom: 30px"></a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
