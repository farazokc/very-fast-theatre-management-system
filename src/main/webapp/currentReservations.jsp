<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.VeryFAST.web.dao.*"%>
<%@page import="com.VeryFAST.web.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Account a1 = AccountDao.getCeoName();
	ArrayList<Schedule> schedules = ScheduleDao.getSchedule();
	ArrayList<History> history = HistoryDao.getHistory();
	ArrayList<Reservation> reservations = ReservationDao.getReservations();
	int revenue = HistoryDao.getRevenue();
	ArrayList<Account> pending = AccountDao.getPendingAccounts();
	%>
	<table id="reservation">
		<tr bgcolor='#949494'>
			<th>ReservationID</th>
			<th>ScheduleID</th>
			<th>SeatID</th>
			<th>Email</th>
			<th>GuestID</th>
			<th>MovieName</th>
			<th>Genre</th>
		</tr>
		<%
		Reservation reservationTemp;
		for (int i = 0; i < reservations.size(); i++) {
			reservationTemp = reservations.get(i);
			ArrayList<Schedule> as = ScheduleDao.getScheduleConditional("s.ScheduleID", Integer.toString(reservationTemp.getScheduleID()));
			Schedule s = as.get(0);
			Movie m = MovieDao.getMovie(s.getMovieID());
			out.println("<tr>");
			out.println("<td>" + reservationTemp.getReservationID() + "</td>");
			out.println("<td>" + reservationTemp.getScheduleID() + "</td>");
			out.println("<td>" + reservationTemp.getSeatID() + "</td>");
			out.println("<td>" + reservationTemp.getEmail() + "</td>");
			out.println("<td>" + reservationTemp.getGuestID() + "</td>");
			out.println("<td>" + m.getMovieName() + "</td>");
			out.println("<td>" + m.getGenre() + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		%>
	</table>
	<div>
        <a href="FastHome.jsp">
            <button type="button">CEO Home</button>
        </a>
    </div>
</body>
</html>