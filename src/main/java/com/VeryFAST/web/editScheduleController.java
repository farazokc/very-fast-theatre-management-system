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
 * Servlet implementation class editScheduleController
 */
@WebServlet("/editScheduleController")
public class editScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editScheduleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int cinemaID = Integer.parseInt(request.getParameter("CinemaID"));
		int movieID = Integer.parseInt(request.getParameter("MovieID"));
		LocalTime time = LocalTime.parse(request.getParameter("Time"));
		LocalDate date = LocalDate.parse(request.getParameter("Date"));
		
		int oldSID = Integer.parseInt(request.getParameter("oldSID"));
		
		try {
			if(!(ScheduleDao.scheduleExists(oldSID))) {
				System.out.println("Schedule ID does not exist");
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
		
		Schedule scd = new Schedule(oldSID, cinemaID, movieID, time, date);

		try {
			ScheduleDao.editSchedule(scd, oldSID);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

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