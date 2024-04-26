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
<table id="pending">
		<tr bgcolor='#949494'>
			<th>Email</th>
			<th>Pass</th>
			<th>AccountName</th>
			<th>DOB</th>
			<th>Phone</th>
			<th>Type</th>
			<th>Verify</th>
		</tr>
		<%
		Account pendingTemp;
		for (int i = 0; i < pending.size(); i++) {
			pendingTemp = pending.get(i);
			out.println("<tr>");
			out.println("<td>" + pendingTemp.getEmail() + "</td>");
			out.println("<td>" + pendingTemp.getPass() + "</td>");
			out.println("<td>" + pendingTemp.getAccountName() + "</td>");
			out.println("<td>" + pendingTemp.getDOB() + "</td>");
			out.println("<td>" + pendingTemp.getPhone() + "</td>");
			out.println("<td>" + pendingTemp.getType() + "</td>");
//			out.println("<td><form action=\"showMovieController\" method = "get"></form>);
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