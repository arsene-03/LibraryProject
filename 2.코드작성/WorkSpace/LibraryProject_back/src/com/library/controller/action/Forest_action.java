package com.library.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Forest_action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//�Ұ� �������� �̵�
		String url = "intro/Forest.jsp";
		response.sendRedirect(url);
	}

}
