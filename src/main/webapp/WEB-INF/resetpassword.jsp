<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@include file="headsection.jsp"%>

<body>
	<div id="wrapper">
		<%@ include file="header.jsp"%>
		<section style="min-height: 582px">
			<div id="mainContent" class="addAddress">
				<h1>Reset Password</h1>
				<div class="clearfix"></div>
				<c:if test="${sessionScope.login ne null }">
					<c:if test="${tokenVerified eq true }">
						<form action="changepasswordedit" method="post" id="addAddress">
							<fieldset>
								<%-- <input type="hidden" name="mail" value="${mail}"> --%>
								<input type="hidden" id="uname" name="userName" value="${sessionScope.login.userName}">
								<div class="formrelative">
									<label>Please retype old password <span class="required">*</span></label> <input
										type="password" name="oldPassword"
										placeholder="Old Login Password"
										title="Minimum length 8 and atleast 1 digit."
										required="required" id="opwd"
										onkeyup="validUserPassword()" />
									<div class="forgotPassword formabsolute" id="erroroldpassword"></div>
								</div>
								<div class="formrelative">
									<label>New Password <span class="required">*</span></label> <input
										type="password" name="userPassword"
										placeholder="Login Password"
										title="Minimum length 8 and atleast 1 digit."
										required="required" id="pwd"
										onkeyup="changePassCheck('pwd','cpwd','errorpassword','passwarn')" />
									<div class="forgotPassword formabsolute" id="errorpassword"></div>
								</div>
								<div class="formrelative">
									<label>Confirm Password <span class="required">*</span></label>
									<input type="password" name="confirmpassword" id="cpwd"
										placeholder="Retype Password" required="required"
										onkeyup="changePassCheck('pwd','cpwd','errorpassword','passwarn')" />
									<div id="passwarn" class="forgotPassword formabsolute"></div>
								</div>
								<button type="submit" class="lightButton addtoStore"
									id="submitbtn">Reset Password</button>
							</fieldset>
						</form>
					</c:if>
					<c:if test="${tokenVerified eq false}">
						<div class="forgotPassword inline">This Link is Expired.</div>
						<p>
							Click <a class="forgotPassword inline" href="#forgotPassword">here
							</a>to get reset link
						</p>
					</c:if>
				</c:if>
				<c:if test="${sessionScope.login eq null }">
					<c:if test="${tokenVerified eq true }">
						<form action="updatepassword" method="post" id="addAddress">
							<fieldset>
								<input type="hidden" name="mail" value="${mail}"> 
								<div class="formrelative">
									<label>New Password <span class="required">*</span></label> <input
										type="password" name="userPassword"
										placeholder="Login Password"
										title="Minimum length 8 and atleast 1 digit."
										required="required" id="pwd"
										onkeyup="resetPassCheck('pwd','cpwd','errorpassword','passwarn')" />
									<div class="forgotPassword formabsolute" id="errorpassword"></div>
								</div>
								<div class="formrelative">
									<label>Confirm Password <span class="required">*</span></label>
									<input type="password" name="confirmpassword" id="cpwd"
										placeholder="Retype Password" required="required"
										onkeyup="resetPassCheck('pwd','cpwd','errorpassword','passwarn')" />
									<div id="passwarn" class="forgotPassword formabsolute"></div>
								</div>
								<button type="submit" class="lightButton addtoStore"
									id="submitbtn">Reset Password</button>
							</fieldset>
						</form>
					</c:if>
					<c:if test="${tokenVerified eq false}">
						<div class="forgotPassword inline">This Link is Expired.</div>
						<p>
							Click <a class="forgotPassword inline" href="#forgotPassword">here
							</a>to get reset link
						</p>
					</c:if>
				</c:if>
			</div>
		</section>
		<div class="clearfix"></div>
		<%@include file="footer.jsp"%>
	</div>

	<!-- This contains the hidden content for shopping cart popup -->
	<%@include file="cart.jsp"%>
	<!-- This contains the hidden content for login popup -->
	<%@include file="login.jsp"%>
	<!-- Forgot password-->

	<%@include file="scripts.jsp"%>
</body>
</html>
