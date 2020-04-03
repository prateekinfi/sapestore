<!-- This contains the hidden content for login popup -->
<div id="loginscreen" style="display: none">
	<form method="post" action="" id="login" >
		<fieldset id="loginfieldset">
			<label for="name">User Name <span class="required">*</span></label> <input
				type="text" placeholder="Name" required name="name" id="username"  onclick="return false;">
			<div id="errorusernamelogin" style="color:red"></div>
			<label for="password">Password <span class="required">*</span>
				<a class="forgotPassword inline"
				href="#forgotPassword">Forgot password?</a></label> <input type="password"
				placeholder="password" required="" name="password" id="password" autofocus />
			<div id="errorpasswordlogin" style="color:red"></div>
			<input type="button" value="Login" class="lightButton"
				onclick="login()" id="loginbutton">
			<div id="errorlogin" style="color:red"></div>
			<p>Don't have an account yet?</p>
			<a href="register"><input type="button" value="Register"
				class="darkButton"></a>
		</fieldset>
	</form>
</div>
<!-- Forgot password-->
<div style="display: none">
	<form method="post" action="" id="forgotPassword">
		<fieldset>
			<label for="email">Enter your email id<span class="required">*</span></label>
			<input type="email" placeholder="Email ID" required name="name"
				id="forgotEmail"> <input type="submit" value="Submit"
				class="lightButton" onclick="verifyEmail('forgotEmail','someHiddenDiv');">
			<div id="someHiddenDiv" style="display: none"></div>
		</fieldset>
	</form>
</div>

