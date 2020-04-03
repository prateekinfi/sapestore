<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:if test="${sessionScope.login.user.isAdmin eq true}">
		<%@include file="headerAdmin.jsp"%>
</c:if>
<c:if test="${sessionScope.login eq null or sessionScope.login.user.isAdmin eq false}">
		<%@include file="Headeruser.jsp"%>
</c:if>