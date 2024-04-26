<%@page import="com.VeryFAST.web.model.Movie"%>
<%@page import="com.VeryFAST.web.dao.MovieDao"%>
<%@page import= "java.util.ArrayList"%>
<%@page import= "com.VeryFAST.web.getLogOut" %>
<%@ page import= "javax.servlet.http.HttpSession" %>

<html>
<head>
<meta charset="ISO-8859-1">
<title>VeryFAST Theatres Home</title>
	
	<style>
	.navbar
	{
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
	#logoutB
	{	
		position: absolute;
		left: 85%;
	}
	
	</style>
	
	
</head>
<body bgcolor="#363636" style="text-align:center; font-family:verdana; color:#E8175D;">
<h1>Welcome to VeryFAST Theatres!</h1>

<% 
	String account = request.getParameter("accountType");	
	Movie m1 = MovieDao.getLatestMovie();
	
	ArrayList<Movie> arr = new ArrayList<Movie>();
	arr= MovieDao.getMovies();
	


%>	
	
			<nav class="navbar">
				<ul>
					<li><a href="BrowseMovies.jsp"><button>Search Movies</button></a></li>
					<li><a href="SearchBooking.jsp"><button>Search Booking</button></a></li>
					<li ><a href="AddReviews.jsp" id="reviewA"><button id="reviewB">Add Review</button></a></li>
					<li><a href="LogIn.jsp"><button>Log In</button></a></li>
					<li><a href="SignUp.jsp"><button>Sign Up</button></a></li>
			
			<% if(session.getAttribute("statuss") != null)
				{
				%>
					<li id="logoutB"><form action="logOut" method="post"><input type="submit" value="LogOut"></form></li>
					</ul>	
				</nav>
		
					<h3><%= session.getAttribute("Name") %> <%= session.getAttribute("statuss") %></h3>

				<%
					if((session.getAttribute("Log_In") != null)&&(session.getAttribute("Log_In").equals("CEO") || session.getAttribute("Log_In").equals("Manager")))
					{
						System.out.println("eheh");
					%>
				
						<script>
							var elem = document.getElementById("reviewB");
							elem.disabled =true;
							var elemm = document.getElementById("reviewA");
							elemm.disabled=true;
						</script>
					<% 	
					}
					session.setAttribute("logged","yes"); 
				}
		
if(account=="CEO"){%>
	<a href="FastHome.jsp"><button>CEO Home</button></a>
<%}else if(account=="Admin"){%>
	<a href="Admin.jsp"><button>Admin Home</button></a>
<%}%>
<br>
<br><h1>Latest Movie</h1><br>
<iframe width="800" height="400" src="<%= m1.getLink() %>"></iframe><br>
<h2><%= m1.getMovieName()%> </h2>
<h3>starring <%= m1.getMainChar() %> </h3>

<br><h1>Other Movies</h1><br>
<%for ( int i = 0; i < arr.size()-1; i++){ 
	m1 = arr.get(i);%>
	
	<iframe width="800" height="400" src="<%= m1.getLink() %>"></iframe><br>
	<h2><%= m1.getMovieName()%> </h2>
	<h3>starring <%= m1.getMainChar() %> </h3>
	
<%}%>
</body>
</html>
