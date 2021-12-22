package com.library.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.libray.dao.LibraryDAO;

public class DeleteBoard_action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "script/alert.jsp";
		
		String idx = request.getParameter("idx");
		String type = request.getParameter("type");
		LibraryDAO dao = LibraryDAO.getInsetance();
		boolean result = dao.deleteBoard(idx);
		request.setAttribute("result", "delete");
		request.setAttribute("result_condi", result);
		request.setAttribute("type", type);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
