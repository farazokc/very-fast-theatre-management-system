package com.VeryFAST.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.VeryFAST.web.dao.ScheduleDao;
import com.VeryFAST.web.model.Schedule;

@SuppressWarnings("serial")
@WebServlet("/showMovieController")
public class ShowMovieController extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{	
		
		String sID = req.getParameter("choice");
		if(sID==null) {
			res.sendRedirect("BrowseMovies.jsp");
		}
		else {
			ArrayList<Schedule> s = new ArrayList<Schedule>();
			try {
				s = ScheduleDao.getScheduleConditional("s.ScheduleID", sID);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.getSession().setAttribute("selection", s);
			res.sendRedirect("MovieInfo.jsp");
		}
	}

}
