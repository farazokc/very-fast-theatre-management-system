package com.VeryFAST.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.VeryFAST.web.dao.TypeDetailsDao;
import com.VeryFAST.web.model.TypeDetails;

@SuppressWarnings("serial")
@WebServlet("/getTypeController")
public class getTypeController extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("formName") == "newType") {
			newTypeDetail(request, response);
		}

		else if (request.getParameter("formName") == "editType") {
			editTypeDetail(request, response);
		}
	}

	public void newTypeDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int TypeID = Integer.parseInt(request.getParameter("TypeID"));
		String Type = request.getParameter("Type");
		int Price = Integer.parseInt(request.getParameter("Price"));
		
		TypeDetails scd = new TypeDetails(TypeID, Type, Price);

		try {
			TypeDetailsDao.addNewType(scd);
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

	public void editTypeDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int oldTID = Integer.parseInt(request.getParameter("oldTID"));
		int TypeID = Integer.parseInt(request.getParameter("TypeID"));
		String Type = request.getParameter("Type");
		int Price = Integer.parseInt(request.getParameter("Price"));
		
		TypeDetails scd = new TypeDetails(TypeID, Type, Price);

		try {
			TypeDetailsDao.editType(scd, oldTID);
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
