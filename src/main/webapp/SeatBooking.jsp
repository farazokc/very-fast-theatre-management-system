<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.VeryFAST.web.model.*"%>
<%@page import="com.VeryFAST.web.dao.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seat Booking</title>
</head>
<body bgcolor="#363636" style="text-align:center; font-family:verdana; color:#E8175D;">

<%
	ArrayList<Schedule> as = (ArrayList<Schedule>)session.getAttribute("selection");
	Schedule s = as.get(0);
	Movie m = MovieDao.getMovie(s.getMovieID());
	
	ArrayList<String> ticketList = (ArrayList<String>)session.getAttribute("tickets");
%>
<h1>Congratulations!</h1><br>
<h2><%= ticketList.size() + " tickets purchased for :"%></h2><br>
<h2><%= m.getMovieName()%> </h2>
<h3>starring <%= m.getMainChar() %> </h3><br><br>

<h2>Your tickets are :</h2><br>
<h3><%for(int i=0; i<ticketList.size(); i++){ %>
<%=ticketList.get(i) %>
<br><%}%>
</h3>

<br><br>
<a href="index.jsp"><button>Continue</button></a>

</body>
</html>