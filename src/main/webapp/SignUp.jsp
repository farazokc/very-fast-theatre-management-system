<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VFTMS Sign UP</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/styles.css">
</head>
<body>

	<input type="hidden" id="status" value="<%= session.getAttribute("status")%>">
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
			
			<a href="index.jsp" id="homepageS">Home Page</a>
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="SignUp" class="register-form" id="register-form">
							<div class="form-group">
								<label for="name"><i 
								class="zmdi zmdi-account material-icons-name"></i></label> 
								<input type="text" name="name" id="name" placeholder="Your Name" required/>
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> 
								<input	type="email" name="email" id="email" placeholder="Your Email" 
								pattern="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" required/>
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" required/>
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" required/>
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact" 
								 pattern="[0-9]{4}-[0-9]{7}" placeholder="Contact no (Format: 0312-3456789)" required/>
							</div>
							<div class="form-group">
								<label for="DOB"><i class="zmdi zmdi-lock-outline"></i></label>
								<input class = "textbox-n" type = "text" onfocus = "(this.type = 'date')" id = "date" name="dob" placeholder = "Date of Birth" required max="<%= Date.valueOf(LocalDate.now())%>"/>
							</div>
							
							
							<div >
								<label for="m"></label>
					                <select name="type" id="m" required>
					                    <option value="" disabled selected>Account Type</option>
					                    <option value="Customer">Customer</option>
					                    <option value="Admin">Admin</option>
					                </select>
							</div>
							
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/vftms-logo.jpg" alt="sing up image">
						</figure>
						<a href="LogIn.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status !=='null')
		{
			swal(status);
		}
	</script>

</body>
</html>