<header>
	<div id="dispatchmsg" class="successBanner">The following orders have been dispatched.</div>
	<div id="header">
		<a href="/sapestore/" title="SapeStore" class="logo"><img
			src="img/logo.jpg" alt="SapeStore"></a>
		<nav>
			<ul class="nav">
				<li class=" "><a href="admin" title="Manage Inventory">Manage
						Inventory</a></li>
				<li><a href="manageOrders?type=active" title="Manage Orders">Manage
						Orders</a></li>
				<li><a href="manageReports" title="Manage Reports">Manage
						Reports</a></li>
				<li><c:if test="${sessionScope.login eq null}">
						<a href="#login" class='inline'>Login</a>
					</c:if> <c:if test="${sessionScope.login ne null}">
						<a href="logout" title="Logout">Logout</a>
					</c:if>
				</li>
			</ul>
		</nav>
	</div>
</header>