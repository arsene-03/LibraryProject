package com.library.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.libray.dao.LibraryDAO;

public class IdChk_action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "login/idCheck.jsp";
		String member_id = request.getParameter("member_id");
		
		LibraryDAO dao = LibraryDAO.getInsetance();
		int result = dao.confirmID(member_id);
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
