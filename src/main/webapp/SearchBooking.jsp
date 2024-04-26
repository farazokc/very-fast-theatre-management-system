<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.VeryFAST.web.model.*"%>
<%@page import="com.VeryFAST.web.dao.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Booking</title>
</head>
<body bgcolor="#363636" style="text-align:center; font-family:verdana; color:#E8175D;">


<a href="index.jsp"><button>Home</button></a>

<br>
<br>
<a href="LogIn.jsp"><button>Log In</button></a>
<a href="SignUp.jsp"><button>Sign Up</button></a>

<br>
<br>

<form action = "getBookingInfo" method = "get" id="form">
 Enter E-Ticket: <input type = "text" name = "e_ticket">
<button type = "submit" id="btBookingSearch">Search Booking</button> 
</form>

<% Reservation r = (Reservation)session.getAttribute("booking");
	if(!(r==null)){
		Seat seats = SeatDao.getSeat(r.getSeatID()); 
		ArrayList<Schedule> as = ScheduleDao.getScheduleConditional("s.ScheduleID", Integer.toString(r.getScheduleID()));
		if(!(as==null || as.size()==0)){
			Schedule s = as.get(0);
			Cinema c = CinemaDao.getCinema(s.getCinemaID());
			Branch b = BranchDao.getBranch(c.getBranchID());
			Movie m = MovieDao.getMovie(s.getMovieID());
			%><h1>"Ticket Found!"</h1><br>
			<%="Ticket details : " + r.getReservationID()%><br>
			<%="Movie Name : " + m.getMovieName()%><br>
			<%="Cinema : " + b.getArea() + ", " + b.getCity()%><br>
			<%="Time : " + s.getTime() + " on " + s.getDate()%><br>
			<%="Seat : " + seats.getColumn() + seats.getRow()%><br>
		<%}
		else{%>
			<h1><%="Ticket Not Found, please try again"%></h1><br>
		<%}}
		else{%>
		<h1><%="Ticket Not Found, please try again"%></h1><br><%		
		}
		 %>
		
</body>
</html>