<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@page import="com.VeryFAST.web.model.*"%>
<%@page import="com.VeryFAST.web.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.*"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Movie Schedule</title>
</head>
<body bgcolor="#363636" style="text-align:center; font-family:verdana; color:#E8175D;">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%
	ArrayList<Schedule> list = ScheduleDao.getLatestSchedule();
	ArrayList<Movie> MovieList = new ArrayList<Movie>();
	ArrayList<Cinema> CinemaList = new ArrayList<Cinema>();
	ArrayList<String> CinemaNameList = new ArrayList<String>();
	ArrayList<Branch> BranchList = new ArrayList<Branch>();
	ArrayList<String> CityList = new ArrayList<String>();
	ArrayList<TypeDetails> TypeDetailsList = new ArrayList<TypeDetails>();
	ArrayList<LocalTime> TimeList = new ArrayList<LocalTime>();
	ArrayList<LocalDate> DateList = new ArrayList<LocalDate>();
	ArrayList<String> GenreList = new ArrayList<String>();
	boolean found;
	
	////Movies
	for(int i=0; i<list.size(); i++){
		found = false;
		for(int j=0; j<MovieList.size(); j++){
			if(list.get(i).getMovieID()==MovieList.get(j).getMovieID())
				found=true;
		}
		if(!found)
			MovieList.add(MovieDao.getMovie(list.get(i).getMovieID()));
	}
	
	////Cinemas
	for(int i=0; i<list.size(); i++){
		found = false;
		for(int j=0; j<CinemaList.size(); j++){
			if(list.get(i).getCinemaID()==CinemaList.get(j).getCinemaID())
				found=true;
		}
		if(!found)
			CinemaList.add(CinemaDao.getCinema(list.get(i).getCinemaID()));
	}
	
	////Cinema Names
	for(int i=0; i<CinemaList.size(); i++){
		found = false;
		for(int j=0; j<CinemaNameList.size(); j++){
			if(CinemaList.get(i).getCinemaName().equals(CinemaNameList.get(j)))
				found=true;
		}
		if(!found)
			CinemaNameList.add(CinemaList.get(i).getCinemaName());
	}
	
	////Branches
	for(int i=0; i<CinemaList.size(); i++){
		found = false;
		for(int j=0; j<BranchList.size(); j++){
			if(CinemaList.get(i).getBranchID()==BranchList.get(j).getBranchID())
				found=true;
		}
		if(!found)
			BranchList.add(BranchDao.getBranch(CinemaList.get(i).getBranchID()));
	}
	
	////Cities
	for(int i=0; i<BranchList.size(); i++){
		found = false;
		for(int j=0; j<CityList.size(); j++){
			if(BranchList.get(i).getCity().equals(CityList.get(j)))
				found=true;
		}
		if(!found)
			CityList.add(BranchList.get(i).getCity());
	}
	
	////TypeDetails
	for(int i=0; i<CinemaList.size(); i++){
		found = false;
		for(int j=0; j<TypeDetailsList.size(); j++){
			if(CinemaList.get(i).getTypeID()==TypeDetailsList.get(j).getTypeID())
				found=true;
		}
		if(!found)
			TypeDetailsList.add(TypeDetailsDao.getTypeDetail(CinemaList.get(i).getTypeID()));
	}
	
	////Times
	for(int i=0; i<list.size(); i++){
		found = false;
		for(int j=0; j<TimeList.size(); j++){
			if(list.get(i).getTime()==TimeList.get(j))
				found=true;
		}
		if(!found)
			TimeList.add(list.get(i).getTime());
	}
	
	////Dates
	for(int i=0; i<list.size(); i++){
		found = false;
		for(int j=0; j<DateList.size(); j++){
			if(list.get(i).getDate().isEqual(DateList.get(j)))
				found=true;
		}
		if(!found)
			DateList.add(list.get(i).getDate());
	}
	
	////Cinema Names
	for(int i=0; i<MovieList.size(); i++){
		found = false;
		for(int j=0; j<GenreList.size(); j++){
			if(MovieList.get(i).getGenre().equals(GenreList.get(j)))
				found=true;
		}
		if(!found)
			GenreList.add(MovieList.get(i).getGenre());
	}
%>
<a href="index.jsp"><button>Home</button></a>

<br>
<br>
<a href="LogIn.jsp"><button>Log In</button></a>
<a href="SignUp.jsp"><button>Sign Up</button></a>

<br>
<br>
<form action = "getMovieController" method = "get" id="form">
	<select name="Cities" class="targ">
	<option value="all">All Cities</option>
	<%
	for(String i:CityList){%>
			<option value="<%=i%>"><%=i%></option>
	<%}%>	
	</select>
	<select name="Branches" class="targ">
	<option value="all">All Branches</option>
	<%
	for(Branch i:BranchList){%>
			<option value="<%=i.getBranchID()%>"><%=i.getArea()%></option>
	<%}%>	
	</select>
	<select name="Cinemas" class="targ">
	<option value="all">All Cinemas</option>
	<%
	for(String i:CinemaNameList){%>
	<option value="<%=i%>"><%=i%></option>
	<%}%>
	</select>
	<select name="Movies" class="targ">
	<option value="all">All Movies</option>
	<%
	for(Movie i:MovieList){%>
			<option value="<%=i.getMovieID()%>"><%=i.getMovieName()%></option>
	<%}%>	
	</select>
	<select name="Times" class="targ">
	<option value="all">All Times</option>
	<%
	for(LocalTime i:TimeList){%>
			<option value="<%=i%>"><%=i%></option>
	<%}%>	
	</select>
	<select name="Dates" class="targ">
	<option value="all">All Dates</option>
	<%
	for(LocalDate i:DateList){%>
			<option value="<%=i%>"><%=i%></option>
	<%}%>	
	</select>
	<select name="Prices" class="targ">
	<option value="all">All Prices</option>
	<%
	for(TypeDetails i:TypeDetailsList){%>
			<option value="<%=i.getTypeID()%>"><%=i.getPrice()%></option>
	<%}%>	
	</select>
	<select name="Genres" class="targ">
	<option value="all">All Genres</option>
	<%
	for(String i:GenreList){%>
			<option value="<%=i%>"><%=i%></option>
	<%}%>	
	</select><br><br>
	<button type = "submit" id="btSearch">Search</button> 
</form>

------------------------------------------------------------<br>

<br><form action = "showMovieController" method = "get">
<br><button type = "submit" id="btSearchMovie">View Movie</button><br><br>
<% ArrayList<Schedule> ans = (ArrayList<Schedule>)session.getAttribute("sched");
	if(!(ans==null)){		
		for(Schedule s:ans){
				Movie m = MovieDao.getMovie(s.getMovieID());
				Cinema c = CinemaDao.getCinema(s.getCinemaID());
				Branch b=BranchDao.getBranch(c.getBranchID());
				TypeDetails t=TypeDetailsDao.getTypeDetail(c.getTypeID());
				%>------------------------------------------------------------<br>
				<input type = "radio" name="choice" value="<%=s.getScheduleID()%>">Select This Movie<br>
				<%="City : " + b.getCity() + ", Area : " + b.getArea()%><br>
				<%="Starting " +s.getTime() + " sharp,"%><br> 
				<%=t.getType() + " " + c.getCinemaName()%><br>
				<%="Showing : " + m.getMovieName() + ", starring : " + m.getMainChar()%><br>
				Price : Rs.<%=t.getPrice()%><br>
	<%}
	}%>
</form>					

<script src="app.js">	
</script>
</body>
</html>