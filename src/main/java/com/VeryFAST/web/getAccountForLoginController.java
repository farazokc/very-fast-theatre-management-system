package com.VeryFAST.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.VeryFAST.web.dao.AccountDao;


@SuppressWarnings("serial")
@WebServlet("/LogIn")
public class getAccountForLoginController extends HttpServlet
{

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String email = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");
		
		HttpSession session=request.getSession();
		
//		RequestDispatcher dispatcher = null;
		
		try 
		{
			if(AccountDao.checkAccountForLogin(email,password)==5)
			{
				session.setAttribute("statuss","Logged In");
				session.setAttribute("Log_In","CEO");
				session.setAttribute("Person","P");
				session.setAttribute("Name",email);
				response.sendRedirect("FastHome.jsp");
//				dispatcher.forward(request,response);
			}
			else if(AccountDao.checkAccountForLogin(email,password)==4)
			{
				session.setAttribute("statuss","Logged In");
				session.setAttribute("Log_In","Manager");
				session.setAttribute("Person","M");
				session.setAttribute("Name",email);
				response.sendRedirect("AdminHome.jsp");
//				dispatcher.forward(request,response);
			}
			else if(AccountDao.checkAccountForLogin(email,password)==3)
			{
				session.setAttribute("statuss","Account not activated");
				response.sendRedirect("LogIn.jsp");
//				dispatcher.forward(request,response);
			}
			else if(AccountDao.checkAccountForLogin(email,password)==2)
			{
				session.setAttribute("statuss","Logged In");
				session.setAttribute("Log_In","Customer");
				session.setAttribute("Person","C");
				session.setAttribute("Name",email);
				response.sendRedirect("index.jsp");
//				dispatcher.forward(request,response);
			}
			else if(AccountDao.checkAccountForLogin(email,password)==1)
			{
				session.setAttribute("statuss","Wrong Password");
				response.sendRedirect("LogIn.jsp");
//				dispatcher.forward(request,response);
			}
			else
			{
				session.setAttribute("statuss","User Not Exist, Kindly Register");
				response.sendRedirect("LogIn.jsp");
//				dispatcher.forward(request,response);
			}
		} 
		catch (ClassNotFoundException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}