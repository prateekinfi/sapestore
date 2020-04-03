<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js">
<%@include file="headsection.jsp"%>
<body>
	<div id="wrapper" class="homeAdmin">
		<%@include file="headerAdmin.jsp"%>
		<section>

			<div id="mainContent" class="addAddress">
				<h2>Add Book to Store</h2>
				<div class="clearfix"></div>
				<form:form method="post" action="add" id="addAddress" modelAttribute="bookbean" enctype="multipart/form-data" onsubmit="return validateForm()">
					<fieldset>
						<div>
							<label for="book">Book Thumbnail Image <span class="required">*</span></label> 
							<input type="file" class="lightButton" name="thumb" required="required"/>
						</div>
						<div>
							<label for="book">Book Detail Image <span class="required">*</span></label> 
							<input type="file" class="lightButton" name="image" required="required"/>
						</div>
						<div>
							<label for="name">Book Title <span class="required">*</span></label>
							<form:input path="bookTitle" type="text" id="bTitle" maxlength="51" placeholder="Name" required="required"
							onkeyup="checkLength('bTitle','errortitle')" onfocusout="removespaces('bTitle')" name="name" />
						</div>
						<div id="errortitle" style="color: red"></div> 
						<div>
							<label for="name">Book Author <span class="required">*</span></label>
							<form:input path="author" type="text" placeholder="Author" required="required" 
								name="author" id="author" maxlength="51" onkeyup="checkAuthor('author','errorauthor')"  onfocusout="removespaces('author')"  />
								
						</div>
						<div id="errorauthor" style="color: red"></div> 
						<div>
							<label for="name">Publisher <span class="required">*</span></label>
							<form:input path="publisher" maxlength="51" type="text" placeholder="Publisher" id="publisher"
							required="required" onkeyup="checkLength('publisher','errorpublisher')" name="name" />
						</div>
						<div id="errorpublisher" style="color: red"></div> 
						<div>
							<label for="number">ISBN <span class="required">*</span></label>
							<form:input path="isbn" id="isbn" type="text" placeholder="ISBN" required="required"
								name="name" onkeyup="checkISBN('isbn','errorisbn')" onfocusout="checkISBN('isbn','errorisbn')"/>
						</div>
						<div id="errorisbn" style="color: red"></div> 
						<div>
							<label for="name">Book Category <span class="required">*</span></label>
							<select name="catId" required="required">
								<option select="selected" value="">---Select a Category---</option>
								<c:forEach items="${clist}" var="c">
									<option value="${c.categoryId}">${c.categoryName}</option>
								</c:forEach>
							</select>
						</div>
						<div></div>
						<div>
							<label for="number">Selling Price(in $) <span
								class="required">*</span></label>
							<form:input path="sellPrice" type="number" id="sellPrice" placeholder="Selling Price"
								required="required" name="name" step="any" onkeyup="checkRent()" onclick="checkRent()"/>
								<div id="errorSPrice" style="color: red"></div> 
						</div>
						
						<div>
							<label for="number">Rent Price(in $) <span
								class="required">*</span></label>
							<form:input path="rentPrice" type="number" id="rentPrice" placeholder="Rent Price"
								required="required" name="name" step="any" onkeyup="checkRent()" onclick="checkRent()"/>
								<div id="errorRPrice" style="color: red"></div> 
						</div>
						
						
						
						<div>
							<label for="number">Late Fees(in $)<span class="required">*</span></label>
							<form:input path="lateFees" type="number" id="latefee" placeholder="Late Fees" required="required"
								name="latefee" onkeyup="checkNum('latefee','errorlatefee')" onclick="checkNum('latefee','errorlatefee')"/>
						</div>
						<div id="errorlatefee" style="color: red"></div> 
						
						
						
						
					<div>
							<label for="number">Number of Books for Sale<span
								class="required">*</span></label>
							<input path="" type="number" placeholder="Number" id="sell" required="required"
								name="sell"  onkeyup="checkNum('sell','errorsell')" onclick="checkNum('sell','errorsell')" />
						</div>
						<div id="errorsell" style="color: red"></div> 

					<div>
							<label for="number">Number of Books for Rent<span
								class="required">*</span></label>
							<input path="" type="number" placeholder="Number" id="rent" required="required"
								name="rent"  onkeyup="checkNum('rent','errorrent')" onclick="checkNum('rent','errorrent')"/>
						</div>
						<div id="errorrent" style="color: red"></div> 

						<div>
							<label for="desc">Short Description <span
								class="required">*</span></label>
							<textarea cols="25" rows="3" type="text"
								placeholder="Short Description" id="desc" required="required" name="desc" onkeyup="removespaces('desc')"></textarea>
						</div>
						
					<div>
							<label for="desc">Detail Description <span class="required">*</span></label>
							<textarea cols="25" rows="6" type="text"
								placeholder="Detail Description" id="longdesc" required="required" name="longdesc" onkeyup="removespaces('longdesc')"></textarea>
						</div>


						<input type="submit" id="submitbtn"  value="Add to Store"
							class="lightButton addtoStore"> 
				<button type="cancel" class="lightButton addtoStore" onclick="javascript:window.location='/sapestore/admin?pgno=${pgno}';">Cancel</button>



					</fieldset>
				</form:form>

			</div>
		</section>
		<div class="clearfix"></div>
		<%@include file="footer.jsp"%>
	</div>
	<%@include file="scripts.jsp"%>
</body>
</html>