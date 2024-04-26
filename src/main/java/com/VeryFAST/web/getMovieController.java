package com.VeryFAST.web;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.VeryFAST.web.dao.ScheduleDao;
import com.VeryFAST.web.model.Schedule;

@SuppressWarnings("serial")
@WebServlet("/getMovieController")
public class getMovieController extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{	

		String[][] arr = new String[8][2];
		
		int field = -1;
		
		arr[0][0] = "b.City";
		arr[1][0] = "c.BranchID";
		arr[2][0] = "c.CinemaName";
		arr[3][0] = "s.MovieID";
		arr[4][0] = "s.Time";
		arr[5][0] = "s.Date";
		arr[6][0] = "c.TypeID";
		arr[7][0] = "m.Genre";
			
		arr[0][1] = req.getParameter("Cities");
		arr[1][1] = req.getParameter("Branches");
		arr[2][1] = req.getParameter("Cinemas");
		arr[3][1] = req.getParameter("Movies");
		arr[4][1] = req.getParameter("Times");
		arr[5][1] = req.getParameter("Dates");
		arr[6][1] = req.getParameter("Prices");
		arr[7][1] = req.getParameter("Genres");
		
		for(int count=0;count<8; count++) {
			if(!(arr[count][1]==null)) {
				if(!(arr[count][1].equals("all")))
					field=count;
				break;
			}
		}
		
		if(field==4) {
			arr[4][1] = Time.valueOf(LocalTime.parse(arr[4][1])).toString();
		}
		
		ArrayList<Schedule> sched = new ArrayList<Schedule>();
		
		try {
			if(field==-1) {
				sched = ScheduleDao.getSchedule();
			}
			else {
				sched = ScheduleDao.getScheduleConditional(arr[field][0], arr[field][1]);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        req.getSession().setAttribute("sched", sched);
		res.sendRedirect("BrowseMovies.jsp");
	}

}
