package com.VeryFAST.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.VeryFAST.web.dao.MovieDao;
import com.VeryFAST.web.dao.TypeDetailsDao;
import com.VeryFAST.web.model.Movie;

@WebServlet("/editMovieController")
public class editMovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editMovieController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int OldMID = Integer.parseInt(request.getParameter("oldMID"));
		String MovieName = request.getParameter("MovieName");
		String Genre = request.getParameter("Genre");
		String Link = request.getParameter("Link");
		float Duration = Float.parseFloat(request.getParameter("Duration"));
		String MainChar = request.getParameter("MainChar");
		String Description = request.getParameter("Description");
		
		try {
			if((!MovieDao.movieExists(OldMID))) {
				System.out.println("Movie id does not exist");
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
		
		Movie scd = new Movie(OldMID, MovieName, Genre, Link, Duration, MainChar, Description);

		try {
			MovieDao.editMovie(scd, OldMID);
		} catch (ClassNotFoundException e) {
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