<%@ page import="com.VeryFAST.web.model.*"%>
<%@ page import="com.VeryFAST.web.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Admin Portal</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body class="bg-dark">
	<!-- Navigation-->
	<!-- 	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<!-- <a class="navbar-brand" href="#page-top"><img src="assets/img/navbar-logo.svg" alt="..." /></a> -->
	<!-- 			<button class="navbar-toggler" type="button" -->
	<!-- 				data-bs-toggle="collapse" data-bs-target="#navbarResponsive" -->
	<!-- 				aria-controls="navbarResponsive" aria-expanded="false" -->
	<!-- 				aria-label="Toggle navigation"> -->
	<!-- 				Menu <i class="fas fa-bars ms-1"></i> -->
	<!-- 			</button> -->
	<!-- 			<div class="navbar-dark" id="navbarResponsive"> -->
	<!-- 				<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0"> -->
	<!-- 					<li class="nav-item"><a class="nav-link" href="index.jsp">Home -->
	<!-- 							Page</a></li> -->
	<!-- 					<li class="nav-item"><a class="nav-link" -->
	<!-- 						href="newSchedule.jsp">New Schedule</a></li> -->
	<!-- 					<li class="nav-item"><a class="nav-link" -->
	<!-- 						href="editSchedule.jsp">Edit Schedule</a></li> -->
	<!-- 					<li class="nav-item"><a class="nav-link" href="newMovie.jsp">New -->
	<!-- 							Movie</a></li> -->
	<!-- 					<li class="nav-item"><a class="nav-link" href="editMovie.jsp">Edit -->
	<!-- 							Movie</a></li> -->
	<!-- 					<li class="nav-item"><a class="nav-link" href="newType.jsp">New -->
	<!-- 							Type</a></li> -->
	<!-- 					<li class="nav-item"><a class="nav-link" href="editType.jsp">Edit -->
	<!-- 							Type</a></li> -->
	<!-- 				</ul> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</nav> -->

	<nav class="navbar navbar-expand-lg bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand text-white" href="index.jsp">Home</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarScroll">
				<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
					style="-bs-scroll-height: 100px;">
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="newSchedule.jsp">Add New Schedule</a></li>
						
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="editSchedule.jsp">Edit Schedule</a></li>	
						
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="newMovie.jsp">Add New Movie</a></li>
						
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="editMovie.jsp">Edit Movie</a></li>	
						
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="newType.jsp">Add New Type</a></li>
						
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="editType.jsp">Edit Type</a></li>	
				</ul>
			</div>
		</div>
	</nav>
	<% Account a1 = AccountDao.getAdminName(); %>
	<br><br><br><br>
	<div class="container">
		<p class="h1 font-monospace text-white text-center">Welcome Mr <%out.println(a1);%></p>
		<br><br><br>
		<p class="h1 font-monospace text-white text-center">Admin Portal</p>
	</div>
	<script type="text/javascript" href="js/jquery-3.6.1.js"></script>
	<script src="js/bootstrap.bundle.js"></script>

</body>
</html>
