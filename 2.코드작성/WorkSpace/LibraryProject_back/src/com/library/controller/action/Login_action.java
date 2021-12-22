package com.library.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.vo.MemberVO;
import com.libray.dao.LibraryDAO;

public class Login_action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "script/alert.jsp";
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String log_method = request.getParameter("log_method");
		HttpSession session = request.getSession();
		
		LibraryDAO dao = LibraryDAO.getInsetance();
		String userPwd_code = dao.transeCode(userPwd);
		MemberVO mVo = new MemberVO();
		mVo = dao.selectMember(userId);
		
		request.setAttribute("result", "login");
		
		if(mVo.getMember_id() != null) {
			if(mVo.getMember_id().equals(userId)&&mVo.getMember_pwd().equals(userPwd_code)) {
				session.setAttribute("member", mVo);
				request.setAttribute("msg", "로그인 성공했습니다");
				request.setAttribute("login_method", log_method);
			}else {
				request.setAttribute("msg", "로그인 실패했습니다. \n 아이디 또는 비밀번호를 확인해주세요.");
				request.setAttribute("login_method", "fail");
			}
		}else {
			request.setAttribute("msg", "로그인 실패했습니다. \n 아이디 또는 비밀번호를 확인해주세요.");
			request.setAttribute("login_method", "fail");
		}
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
