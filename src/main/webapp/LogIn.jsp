<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	
	<title>VFTMS Login Page</title>
	
	<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

	<!-- Main css -->
	<link rel="stylesheet" href="css/styles.css">
	
</head>

<body>
	
	<input type="hidden" id="statusL" value="<%= session.getAttribute("statuss")%>">
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
			<a href="index.jsp" id="homepage">Home Page</a>
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/vftms-logo.jpg" alt="sign up image">
						</figure>
						<a href="SignUp.jsp" class="signup-image-link">Create an account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign In</h2>
						
						<form method="post" action="LogIn" class="register-form" id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username"
									placeholder="Your Email" 
									pattern="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" required/>
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" required />
							</div>
							
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<br>

	</div>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type="text/javascript">
	    
		var status = document.getElementById("statusL").value;
		if(status !=='null')
		{
			swal(status);
		}
	</script>
	
</body>
</html>