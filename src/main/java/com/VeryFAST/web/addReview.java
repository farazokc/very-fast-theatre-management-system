package com.VeryFAST.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.VeryFAST.web.dao.MovieDao;
import com.VeryFAST.web.dao.ReviewDao;





@SuppressWarnings("serial")
@WebServlet("/Addreview")
public class addReview extends HttpServlet
{

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		String star = (String) request.getParameter("Star");
		String comment = (String) request.getParameter("comment");
		String movie =  (String) request.getParameter("movie");
		String name = (String)  session.getAttribute("Name");
		
		
		
		try 
		{
			ReviewDao.addReview(name,MovieDao.getMovieId(movie),star,comment);
			response.sendRedirect("AddReviews.jsp");
		} catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}
}