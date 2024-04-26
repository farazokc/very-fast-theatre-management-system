package com.VeryFAST.web;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.VeryFAST.web.dao.*;
import com.VeryFAST.web.model.*;

@SuppressWarnings("serial")
@WebServlet("/selectSeatController")
public class SelectSeatController extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{	
		
		HttpSession session = request.getSession();
		
		ArrayList<String> ticketArr = new ArrayList<String>();
		
//		sesh.setAttribute("person", 'G');
//		sesh.setAttribute("uname", 3);
		
		if((session.getAttribute("Person"))==null || (session.getAttribute("Name")) == null) 
		{
			System.out.println("oye");
			RequestDispatcher rd = null;
			rd= request.getRequestDispatcher("LogIn.jsp");
			rd.forward(request,response);
			System.out.println("oye");
			
		}
		String uname = (String) session.getAttribute("Name"); /// yani email ya guestid
		String id = (String) session.getAttribute("Person");  /// yani kon he, G (guest) ya C(custoemr)
		
//		String uname = "3";
//		String id = "G";
		
		System.out.println(uname + " before " + id);
		
		
		
		System.out.println(uname + " after " + id);
		
		ArrayList<Schedule> as = (ArrayList<Schedule>)session.getAttribute("selection");
		Schedule s = as.get(0);
		
		Enumeration paramNames = request.getParameterNames();
        while(paramNames.hasMoreElements()) {
           String paramName = (String)paramNames.nextElement();
           try {
			ticketArr.add(ReservationDao.addReservation(s.getScheduleID(), Integer.parseInt(paramName), uname, id));
			} catch (NumberFormatException e) {	e.printStackTrace();
			} catch (ClassNotFoundException e) {e.printStackTrace();
			} catch (SQLException e) {e.printStackTrace();}       
           }
        
        session.setAttribute("tickets", ticketArr);

        response.sendRedirect("SeatBooking.jsp");
	}

}
