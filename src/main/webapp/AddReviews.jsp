<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.VeryFAST.web.dao.*"%>
<%@page import="com.VeryFAST.web.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Review Movie</title>

	<style>
	
		.navbar
	{
		background-color: black;
		border-radius: 25px;
	}
	.navbar ul
	{
		overflow: auto;
	}
	.navbar li
	{
		float: left;
		list-style: none;
		margin: 13px 20px;'
	}
	.navbar li a
	{	
		padding: 5px 5px;
		color: white;
		text-decoration: none;
	}	
	
	#gapp
	{	
		padding-left: 60px;
	}
	</style>
	
</head>

<body>
	
	<% if((session.getAttribute("logged"))==null)
	{
		response.sendRedirect("LogIn.jsp");
	}
		%>
	<header>
		<nav class="navbar">
		<ul>
  			<li><a href="index.jsp">Home</a></li>
			
		</ul>	
		</nav>
	</header>
	
	<h3><%=session.getAttribute("Name") %></h3>
	<% 
		String email = (String)session.getAttribute("Name");
		ArrayList<String> movies = ReviewDao.getWatchedMoviesOfUser(email);
		%>
		<table id="schedule" style="text-align: center;">
		<tr bgcolor='#949494'>
			<th>Number</th>
			<th>Movie Name</th>
		</tr>
		<% for(int i=0;i<movies.size();i++)
		{
			out.println("<form action=\"Addreview\" method=\"post\"> ");
			out.println("<tr>");
			out.println("<td>" + (i+1)+ "</td>");
			out.println("<td id=\"gap\">" + movies.get(i)+ "</td>");
			out.println("<td id=\"gapp\"><span>Enter Rating: <span><select name=\"Star\" class=\"targ\"><option value=\"1\">1</option><option value=\"2\">2</option><option value=\"3\">3</option><option value=\"4\">4</option><option value=\"5\">5</option></select></td>");
			out.println("<td id=\"gapp\"><span>Comments: </span><input type=\"text\" name=\"comment\" ></td>");
			out.println("<td><input type=\"hidden\" value=\""+movies.get(i)+"\" name=\"movie\"></td>");
			out.println("<td id=\"gapp\"><input type=\"submit\" value=\"Submit Review\"></td>");
			out.println("</tr>");
		}
		out.println("</table>");
		
		out.println("</form>");
		%>
	</table>
	

</body>
</html>