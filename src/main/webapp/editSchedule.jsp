<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="com.VeryFAST.web.dao.MovieDao"%>
<%@page import="com.VeryFAST.web.dao.CinemaDao"%>
<%@page import="java.time.LocalTime"%>
<%@page import="com.VeryFAST.web.model.Cinema"%>
<%@page import="com.VeryFAST.web.model.Movie"%>
<%@page import="com.VeryFAST.web.model.Schedule"%>
<%@page import="com.VeryFAST.web.dao.ScheduleDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Schedule</title>
</head>
<link href="css/bootstrap.css" rel="stylesheet" />
<body class="bg-dark">
<div class="text-center">
        <a href="AdminHome.jsp">
            <button type="button" class="btn btn-light" >Admin Home</button>
        </a>
    </div>
	<%
	ArrayList<Schedule> list = ScheduleDao.getSchedule(); //jitne schedule exist karte wo agaye
	// 	ArrayList<Movie> movieList = MovieDao.getMovieList();
	// 	ArrayList<TypeDetails> typeList = TypeDetailsDao.getTypeDetails();

	ArrayList<Movie> MovieList = new ArrayList<Movie>();
	ArrayList<Cinema> CinemaList = new ArrayList<Cinema>();
	ArrayList<LocalTime> TimeList = new ArrayList<LocalTime>();

	boolean found = false;

	////Movies
	for (int i = 0; i < list.size(); i++) {
		found = false;
		for (int j = 0; j < MovieList.size(); j++) {
			if (list.get(i).getMovieID() == MovieList.get(j).getMovieID())
		found = true;
		}
		if (!found)
			MovieList.add(MovieDao.getMovie(list.get(i).getMovieID()));
	}

	////Cinemas
	for (int i = 0; i < list.size(); i++) {
		found = false;
		for (int j = 0; j < CinemaList.size(); j++) {
			if (list.get(i).getCinemaID() == CinemaList.get(j).getCinemaID())
		found = true;
		}
		if (!found)
			CinemaList.add(CinemaDao.getCinema(list.get(i).getCinemaID()));
	}

	////Times
	for (int i = 0; i < list.size(); i++) {
		found = false;
		for (int j = 0; j < TimeList.size(); j++) {
			if (list.get(i).getTime().equals(TimeList.get(j)))
		found = true;
		}
		if (!found)
			TimeList.add(list.get(i).getTime());
	}
	%>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<br> <br> <br>
		<p class="h1 font-monospace text-white text-center">Edit Schedule</p>
	</div>
	<div class="container">
		<form class="form-horizontal" name="editSchedule"
			action="editScheduleController" method="get" display="none">
			<input type="hidden" name="formName" value="editSchedule">
			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Old Schedule ID:</label>
				<div class="col-sm-2">
					<input class="form-control" type="number"
						placeholder=" Old Schedule ID" name="oldSID" required min="0">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Cinema ID:</label>
				<div class="col-sm-2">
					<select class="form-select" name="CinemaID" required>
						<%
						for (Cinema i : CinemaList) {
						%>
						<option value="<%=i.getCinemaID()%>" selected><%=i.getCinemaName()%></option>
						<%
						}
						%>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Movie ID:</label>
				<div class="col-sm-2">
					<select class="form-select" name="MovieID" required>
						<%
						for (Movie i : MovieList) {
						%>
						<option value="<%=i.getMovieID()%>" selected><%=i.getMovieName()%></option>
						<%
						}
						%>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Time:</label>
				<div class="col-sm-2">
					<select class="form-select" name="Time" required>
						<%
						for (LocalTime i : TimeList) {
						%>
						<option value="<%=i%>" selected><%=i%></option>
						<%
						}
						%>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Date:</label>
				<div class="col-sm-2">
					<input class = "textbox-n" type="date" id = "date" name="Date" placeholder = "Date of Birth" required min="<%=Date.valueOf(LocalDate.now())%>"/>
				</div>
			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-2">
					<input type="submit">
				</div>
			</div>
		</form>
	</div>
	<hr>
	<script type="text/javascript" href="js/jquery-3.6.1.js"></script>
	<script src="js/bootstrap.bundle.js"></script>
</body>
</html>