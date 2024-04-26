package com.VeryFAST.web;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.VeryFAST.web.dao.*;
import com.VeryFAST.web.model.*;

@SuppressWarnings("serial")
@WebServlet("/getBookingInfo")
public class GetBookngController extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{	
		
		HttpSession sesh = req.getSession();
        
		String tick = req.getParameter("e_ticket");
		
		Reservation reser = new Reservation();
		try {
			reser = ReservationDao.findReservationID(tick);
		} catch (ClassNotFoundException e) {e.printStackTrace();
		} catch (SQLException e) {e.printStackTrace();
		}
		
        sesh.setAttribute("booking", reser);

        res.sendRedirect("SearchBooking.jsp");
	}

}
