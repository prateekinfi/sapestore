<div id="reviewbox" style="display: none">
	<form method="post" action="addreview" id="reviewscreen"
		style="height: 400px;">

		<div>
			<div style="padding: 20px;">
				<b>Write a Review</b>
				<%-- <c:if test="${ownrating eq null}">
				    <h1>hi</h1>
				</c:if> --%>
			</div>
			<div style="padding-left: 225px; font-weight: bold;">Your
				Comments</div>
			<div>
				<span style="padding-left: 20px;"> <img
					src="img?bookimg=${book.isbn}full.jpg"
					style="width: 152px; height: 222px;" />
				</span> <span style="padding-left: 20px;"> <textarea name="review"
						rows=12 cols=70>${ownreview}</textarea>
				</span>
			</div>
			<div>



				<div style="padding-left: 20px;">
					<div
						style="text-align: center; font-weight: bold; width: 150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; display: inline-block;">
						${book.bookTitle}</div>
					<span style="margin-left: 40px; font-weight: bold;">Your
						Reviews</span>
				</div>
				<fieldset class="rating"
					style="padding-left: 212px; padding-right: 70px;">
					<input type="radio" id="star5" name="rating" value="5" checked/> 
					<label class="full" for="star5"title="Awesome - 5 stars"></label>
					<input type="radio"	id="star4half" name="rating" value="4.5" /> 
					<label class="half"	for="star4half" title="Pretty good - 4.5 stars"></label> 
					<input type="radio" id="star4" name="rating" value="4" /> 
					<label class="full" for="star4" title="Very nice - 4 stars"></label> 
					<input type="radio" id="star3half" name="rating" value="3.5" />
					<label class="half" for="star3half" title="Nice - 3.5 stars"></label>
					<input type="radio" id="star3" name="rating" value="3" /> 
					<label class="full" for="star3" title="Good - 3 stars"></label> 
					<input type="radio" id="star2half" name="rating" value="2.5" /> 
					<label class="half" for="star2half" title="Average - 2.5 stars"></label>
					<input type="radio" id="star2" name="rating" value="2" /> 
					<label class="full" for="star2" title="Kinda bad - 2 stars"></label> 
					<input type="radio" id="star1half" name="rating" value="1.5" /> 
					<label class="half" for="star1half" title="Poor - 1.5 stars"></label> 
					<input type="radio" id="star1" name="rating" value="1" /> 
					<label class="full" for="star1" title="Bad - 1 star"></label> 
					<input type="radio" id="starhalf" name="rating" value="0.5" /> 
					<label class="half" for="starhalf" title="Very bad - 0.5 stars"></label>
					<input type="hidden" name="isbn" value="${book.isbn}" /> <input
						type="hidden" name="username"
						value="${sessionScope.login.userName }" />
				</fieldset>
				<span> <input type="submit" value="Post Comment"
					class="postcomment" />
				</span> <span> <a href="javascript:window.location.reload(true)"
					style="color: red; padding-left: 20px;">Cancel Post</a>
				</span>
			</div>

		</div>


	</form>
</div>
