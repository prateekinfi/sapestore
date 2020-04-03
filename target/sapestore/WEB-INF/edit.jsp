<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js">
<%@include file="headsection.jsp"%>
<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}

function readURL2(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah2')
                .attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}

function me()
{
	document.getElementById('test').style.display='block';	
}

function pe()
{
	document.getElementById('test2').style.display='block';	
}

</script>
<body>
	<div id="wrapper" class="homeAdmin">
		<%@include file="headerAdmin.jsp"%>
		<section>

			<div id="mainContent" class="addAddress">
				<h2>Edit Book</h2>
				<div class="clearfix"></div>
				<form method="post" action="editprod?pgno=${pgno }" id="addAddress" enctype="multipart/form-data">
					<fieldset>
						
						
						
						<div>
							<label for="book">Book Thumbnail Image</label> <a
								href="javascript:void(0)" onclick="pe()"><img id="blah"
								src="img?bookimg=${myBook.isbn}thumb.jpg"></a>
						</div>
						<div id="test2" style="display: none">

							<label for="book"></label> <input type='file'
								onchange="readURL(this);" class="lightButton" name="txtthimg" />
						</div>
						<br />
						<div>
							<label for="book">Book Detail Image</label> <a
								href="javascript:void(0)" onclick="me()"><img id="blah2"
								src="img?bookimg=${myBook.isbn}full.jpg"></a>
						</div>
						<div id="test" style="display: none">
							<label for="book"></label> <input type="file"
								onchange="readURL2(this);" class="lightButton" name="txtdimg">
						</div>
						<br/>
						
						
						
						
						<div>
							<label for="name">Book Title <span class="required">*</span></label>
							<input type="text" value="${myBook.bookTitle}" id="bTitle" maxlength="51" required="required"
							onkeyup="checkLength('bTitle','errortitle')" onfocusout="removespaces('bTitle')" name="txttitle">
						</div>
						<div id="errortitle" style="color: red"></div> 
						<div>
							<label for="name">Book Author <span class="required">*</span></label>
							<input type="text" id="author" value="${myBook.author}"
							required="required" name="txtauthor" maxlength="51" onkeyup="checkAuthor('author','errorauthor')" onfocusout="removespaces('author')">
						</div>
						<div id="errorauthor" style="color: red"></div>
						<div>
							<label for="number">ISBN <span class="required">*</span></label>
							<input type="number" value="${myBook.isbn}" required="required"
								name="txtisbn"  readonly="readonly">
						</div>
						<div id="errorisbn" style="color: red"></div> 
						<div>
							<label for="number">Publisher <span class="required">*</span></label>
							<input type="text" maxlength="51" value="${myBook.publisher}" required="required"
								id="publisher" onkeyup="checkLength('publisher','errorpublisher')" name="txtpublish">
						</div>
						<div id="errorpublisher" style="color: red"></div> 
						<div>
							<label for="name">Book Category <span class="required">*</span></label>

							<select name="catId" required="required">
								<option select="selected" value="${myBook.category.categoryId}">${myBook.category.categoryName}</option>
								<c:forEach items="${catlist}" var="c">
									<option value="${c.categoryId}">${c.categoryName}</option>
								</c:forEach>
							</select>
						</div>
						<div></div>
						<div>
							<label for="number">Selling Price(in $) <span
								class="required">*</span></label> <input type="number" id="sellPrice"
								value="${myBook.sellPrice }" required="required" name="txtsell"  step="any" onkeyup="checkRent()" onclick="checkRent()"/>
								<div id="errorSPrice" style="color: red"></div> 
						<div>
							<label for="number">Rent Price(in $) <span
								class="required">*</span></label> <input type="number" id="rentPrice"
								value="${myBook.rentPrice }" required="required" name="txtrent" step="any"
								onkeyup="checkRent()" onclick="checkRent()"/>
							<div id="errorRPrice" style="color: red"></div>
						</div>



						<div>
							<label for="number">Late Fees(in $)<span class="required">*</span></label>
							<input path="lateFees" type="number" placeholder="Late Fees" id="latefee"
								required="required" value="${myBook.lateFees}" name="latefee" onkeyup="checkNum('latefee','errorlatefee')" onclick="checkNum('latefee','errorlatefee')"/>
						</div>
						<div id="errorlatefee" style="color: red"></div> 






						<div>
							<label for="number">Number of Books for Sale<span
								class="required">*</span></label> <input path="" type="number"
								value="${myBook.inventory.purchaseQuantity }" required="required" name="tsell" id="sell" onkeyup="checkNum('sell','errorsell')" onclick="checkNum('sell','errorsell')" />
						</div>
						<div id="errorsell" style="color: red"></div> 


						<div>
							<label for="number">Number of Books for Rent<span
								class="required">*</span></label> <input path="" type="number"
								value="${myBook.inventory.rentQuantity }"  id="rent"  required="required" name="trent"onkeyup="checkNum('rent','errorrent')" onclick="checkNum('rent','errorrent')"/>
						</div>
						<div id="errorrent" style="color: red"></div> 

						<div>
							<label for="desc">Short Description <span
								class="required">*</span></label>
							<textarea cols="25" rows="3" type="text" required="required"
								name="txtdesc">${myBook.shortDesc }</textarea>
						</div>
						<div>
							<label for="desc">Detail Description</label>
							<textarea cols="25" rows="6" type="text" required="required" name="desc"> ${desc }</textarea>
						</div>


						<input type="submit" id="submitbtn" value="Update" class="lightButton addtoStore">
						<input type="button" class="lightButton addtoStore" value="Cancel" onclick="javascript:window.location='/sapestore/admin?pgno=${pgno}';"/>
					</fieldset>
				</form>

			</div>
		</section>
		<div class="clearfix"></div>
		<%@include file="footer.jsp"%>
	</div>
	<%@include file="scripts.jsp"%>
</body>
</html>