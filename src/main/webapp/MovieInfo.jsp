<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="com.VeryFAST.web.model.*"%>
<%@page import="com.VeryFAST.web.dao.*"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Results</title>
</head>
<body bgcolor="#363636" style="text-align:center; font-family:verdana; color:#E8175D;">
<a href="index.jsp"><button>Home</button></a>

<a href="BrowseMovies.jsp"><button>Back</button></a>

<%
	ArrayList<Schedule> as = (ArrayList<Schedule>)session.getAttribute("selection");
	Schedule s = as.get(0);
	Movie m = MovieDao.getMovie(s.getMovieID());
	ArrayList<Review> arrR = new ArrayList<Review>();
	arrR = ReviewDao.getMovieReviews(m.getMovieID());
	ArrayList<Seat> arrS = new ArrayList<Seat>();
	arrS = SeatDao.getFreeSeats(s.getScheduleID());
%><br>
<iframe width="800" height="400" src="<%= m.getLink() %>"></iframe><br>
<h2><%= m.getMovieName()%> </h2>
<h3>starring <%= m.getMainChar() %> </h3>
<h4><%=m.getGenre() + " Film, Duration : " + m.getDuration() + " hours"%><br><br>
Synopsis: <%=m.getDescription()%><br><br><br><br>
Reviews:<br></h4>
<h4><%if(arrR.size()!=0){
	for(Review r:arrR){
	%>
		<%=r.getEmail() + "( "+ r.getStars() +" stars out of 5 ): " + r.getText() %><br>
	<%}}
	else{
	%> No Reviews Yet <br>
	<% }%>
	</h4><br><br>
	<h2>Seats Available :</h2><br>
	
	<form action = "selectSeatController" method = "get"><h4>
	<br><button type = "submit" id="btBookMovie">Book Seat(s)</button><br><br>
	
	<%for(int i=0; i<arrS.size(); i++){%>
	<%="Seat " + arrS.get(i).getColumn() + "-" + arrS.get(i).getRow() + "-------"%>
		<input type="checkbox" name="<%=(arrS.get(i)).getSeatID()%>"><br>
	<%}%>
	</h4></form>


</body>
</html>