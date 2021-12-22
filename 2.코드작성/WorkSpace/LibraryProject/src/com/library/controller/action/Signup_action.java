package com.library.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.vo.MemberVO;
import com.libray.dao.LibraryDAO;

public class Signup_action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "script/alert.jsp";
		
		String member_id = request.getParameter("member_id");
		String member_pwd = request.getParameter("member_pwd");
		String member_name = request.getParameter("member_name");
		String member_jumin = request.getParameter("jumin_1")+"-"+request.getParameter("jumin_2");
		String member_address = request.getParameter("member_address");
		String member_email = request.getParameter("member_email");
		String member_tel = request.getParameter("member_tel_1")+"-"+request.getParameter("member_tel_2")+"-"+request.getParameter("member_tel_3");
		String member_type = request.getParameter("member_type");
		
		LibraryDAO dao = LibraryDAO.getInsetance();
		String member_pwd_code = dao.transeCode(member_pwd);
		
		MemberVO mVo = new MemberVO();
		mVo.setMember_id(member_id);
		mVo.setMember_pwd(member_pwd_code);
		mVo.setMember_name(member_name);
		mVo.setMember_jumin(member_jumin);
		mVo.setMember_address(member_address);
		mVo.setMember_email(member_email);
		mVo.setMember_tel(member_tel);
		mVo.setMember_type(member_type);
		
		dao.insertMember(mVo);
		
		request.setAttribute("result", "signup");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
