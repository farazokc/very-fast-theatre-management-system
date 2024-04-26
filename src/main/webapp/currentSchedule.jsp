<%@page import="java.util.ArrayList"%>
<%@page import="com.VeryFAST.web.dao.*"%>
<%@page import="com.VeryFAST.web.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Account a1 = AccountDao.getCeoName();
	ArrayList<Schedule> schedules = ScheduleDao.getLatestSchedule();
	ArrayList<History> history = HistoryDao.getHistory();
	ArrayList<Reservation> reservations = ReservationDao.getReservations();
	int revenue = HistoryDao.getRevenue();
	ArrayList<Account> pending = AccountDao.getPendingAccounts();
	%>
<table id="schedule">
		<tr bgcolor='#949494'>
			<th>ScheduleID</th>
			<th>CinemaID</th>
			<th>MovieID</th>
			<th>Time</th>
			<th>Date</th>
		</tr>
		<%
		Schedule scheduleTemp;
		for (int i = 0; i < schedules.size(); i++) {
			scheduleTemp = schedules.get(i);
			out.println("<tr>");
			out.println("<td>" + scheduleTemp.getScheduleID() + "</td>");
			out.println("<td>" + scheduleTemp.getCinemaID() + "</td>");
			out.println("<td>" + scheduleTemp.getMovieID() + "</td>");
			out.println("<td>" + scheduleTemp.getTime() + "</td>");
			out.println("<td>" + scheduleTemp.getDate() + "</td>");
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