package com.VeryFAST.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logOut")
public class getLogOut  extends HttpServlet
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		
		session.removeAttribute("Log_In");
		session.removeAttribute("statuss");
		session.removeAttribute("Name");
		session.invalidate();
		response.sendRedirect("index.jsp");
		
		
	}
}
