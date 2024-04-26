<%@page import="com.VeryFAST.web.dao.HistoryDao"%>
<%@page import="com.VeryFAST.web.model.History"%>
<%@page import="com.VeryFAST.web.dao.ReservationDao"%>
<%@page import="com.VeryFAST.web.model.Reservation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.VeryFAST.web.model.Account"%>
<%@page import="com.VeryFAST.web.dao.AccountDao"%>
<%@page import="com.VeryFAST.web.model.Schedule"%>
<%@page import="com.VeryFAST.web.dao.ScheduleDao"%>
<%@page import="com.VeryFAST.web.getAccountForLoginController"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CEO Portal</title>
</head>
<link href="css/bootstrap.css" rel="stylesheet" />
<body class="bg-dark">

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
						aria-current="page" href="currentSchedule.jsp">View Current Schedule</a></li>

					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="oldReservations.jsp">View History of Bookings</a></li>

					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="currentReservations.jsp">View Current Bookings</a></li>

					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="validateAdminAccounts.jsp">View Account Validation Requests</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<br><br><br><br>
	<% Account a1 = AccountDao.getCeoName();%>
	<div class="container">
		<p class="h1 font-monospace text-white text-center">Welcome Mr <%out.println(a1);%></p>
		<br><br><br>
		<p class="h1 font-monospace text-white text-center">CEO Portal</p>
	</div>
	
	<% int revenue = HistoryDao.getRevenue();%>
	
	<div class="container" id="revenue">
		<p class="h1 font-monospace text-white text-center">Revenue: <%out.println(revenue);%></p>
		<br><br><br>
		<p class="h1 font-monospace text-white text-center"></p>
	</div>

	<script type="text/javascript" href="js/jquery-3.6.1.js"></script>
	<script src="js/bootstrap.bundle.js"></script>

	<script>
		function changeVisibility(elementId) {
			var element = document.getElementById(elementId);
			console.log(element);
			if (element.style.display === "none") {
				element.style.display = 'block';
			} else {
				element.style.display = 'none';
			}
		}

		function getRevenue() {
			var tbl = document.getElementById("revenue").childNodes;
			console.log(tbl);
		}
	</script>
</body>
</html>