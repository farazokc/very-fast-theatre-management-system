package com.VeryFAST.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.VeryFAST.web.dao.AccountDao;


@SuppressWarnings("serial")
@WebServlet("/SignUp")

public class getAccountController extends HttpServlet
{
public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
{
		
//		RequestDispatcher dispatcher = null;
		String name = (String) request.getParameter("name");
		String email = (String) request.getParameter("email");
		String password = (String) request.getParameter("pass");
		String re_password = (String) request.getParameter("re_pass");
		String contact = (String) request.getParameter("contact");
		String dOB = (String) request.getParameter("dob");
		String type = (String) request.getParameter("type");
		HttpSession session=request.getSession();
		
		try 
		{
			if((AccountDao.checkAccountsForNewEntry(email))&&(re_password.equals(password)))
			{
				if(type.equals("Admin"))
				{
					type = "Pending";
				}
				session.setAttribute("status","success");
				AccountDao.addNewAccount(name,email,password,contact,dOB,type);
				response.sendRedirect("SignUp.jsp");
			}
			else if(AccountDao.checkAccountsForNewEntry(email))
			{
				session.setAttribute("status","Unmatched Password");
				response.sendRedirect("SignUp.jsp");
			}
			else
			{
				session.setAttribute("status","Email Already Exist");
				response.sendRedirect("SignUp.jsp");
			}
		} 
		catch (ClassNotFoundException e) 
		{
			System.out.println("Exception");
			e.printStackTrace();
		}
	}
}
