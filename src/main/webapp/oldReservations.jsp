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
<table id="history">
		<tr bgcolor='#949494'>
			<th>RecordID</th>
			<th>ScheduleID</th>
			<th>SeatID</th>
			<th>Email</th>
			<th>GuestID</th>
			<th>Price</th>
		</tr>
		<%
		History historyTemp;
		for (int i = 0; i < history.size(); i++) {
			historyTemp = history.get(i);
			out.println("<tr>");
			out.println("<td>" + historyTemp.getRecordID() + "</td>");
			out.println("<td>" + historyTemp.getScheduleID() + "</td>");
			out.println("<td>" + historyTemp.getSeatID() + "</td>");
			out.println("<td>" + historyTemp.getEmail() + "</td>");
			out.println("<td>" + historyTemp.getGuestID() + "</td>");
			out.println("<td>" + historyTemp.getPrice() + "</td>");
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