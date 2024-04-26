package com.VeryFAST.web;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.VeryFAST.web.dao.ScheduleDao;
import com.VeryFAST.web.model.Schedule;

/**
 * Servlet implementation class getScheduleController
 */
@WebServlet("/newScheduleController")
public class newScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newScheduleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("\n\n\n\nOOOGA BOOGA\n\n\n\n");
		
		System.out.println("Before data");
		int scheduleID = Integer.parseInt(request.getParameter("ScheduleID"));
		int cinemaID = Integer.parseInt(request.getParameter("CinemaID"));
		int movieID = Integer.parseInt(request.getParameter("MovieID"));
		LocalTime time = LocalTime.parse(request.getParameter("Time"));
		LocalDate date = LocalDate.parse(request.getParameter("Date"));
		
		try {
			if((ScheduleDao.scheduleExists(scheduleID))) {
				System.out.println("Schedule ID already exists");
				response.sendRedirect("AdminHome.jsp");
				return;
			}
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Schedule scd = new Schedule(scheduleID, cinemaID, movieID, time, date);

		try {
			ScheduleDao.addNewSchedule(scd);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("After data");
		response.sendRedirect("AdminHome.jsp");
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}