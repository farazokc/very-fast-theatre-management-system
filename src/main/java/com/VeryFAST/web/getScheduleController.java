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

@SuppressWarnings("serial")
@WebServlet("/getScheduleController")
public class getScheduleController extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("formName") == "newSchedule") {
			newSchedule(request, response);
		}

		else if (request.getParameter("formName") == "editSchedule") {
			editSchedule(request, response);
		}
	}

	public void newSchedule(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Before data");
		int scheduleID = Integer.parseInt(request.getParameter("ScheduleID"));
		int cinemaID = Integer.parseInt(request.getParameter("CinemaID"));
		int movieID = Integer.parseInt(request.getParameter("MovieID"));
		LocalTime time = LocalTime.parse(request.getParameter("Time"));
		LocalDate date = LocalDate.parse(request.getParameter("Date"));

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
//		response.sendRedirect(request.getContextPath() + "/AdminHome.jsp");
		return;

	}

	public void editSchedule(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int scheduleID = Integer.parseInt(request.getParameter("ScheduleID"));
		int cinemaID = Integer.parseInt(request.getParameter("CinemaID"));
		int movieID = Integer.parseInt(request.getParameter("MovieID"));
		LocalTime time = LocalTime.parse(request.getParameter("Time"));
		LocalDate date = LocalDate.parse(request.getParameter("Date"));
		
		int oldSID = Integer.parseInt(request.getParameter("oldSID"));
		
		Schedule scd = new Schedule(scheduleID, cinemaID, movieID, time, date);

		try {
			ScheduleDao.editSchedule(scd, oldSID);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

//		response.sendRedirect(request.getContextPath() + "/AdminHome.jsp");
		return;
	}
}
