package com.library.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.vo.Member_logVO;
import com.libray.dao.LibraryDAO;

public class admin_member_log_action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url ="adminPage/member_log.jsp";
		
		LibraryDAO dao = LibraryDAO.getInsetance();
		
		List<Member_logVO> mVoL = dao.selectAllMemberLog();
		
		request.setAttribute("memberLpog", mVoL);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
