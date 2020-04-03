
<div class="leftCol" id="leftColId">
	<h2>Book Categories</h2>
	<nav>
		<!-- left navigation -->
		<ul>
		 <c:forEach items="${catlist}" var="catl" >
			<li><a href="viewBooksbyCategory?categoryId=${catl.categoryId}"
				title="${catl.categoryName}">${catl.categoryName}</a></li>
		</c:forEach>
		</ul>
	</nav>
</div>