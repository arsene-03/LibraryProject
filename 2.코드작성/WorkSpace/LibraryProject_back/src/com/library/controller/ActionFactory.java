package com.library.controller;

import com.library.controller.action.Action;
import com.library.controller.action.DeleteBoard_action;
import com.library.controller.action.Forest_action;
import com.library.controller.action.IdChk_action;
import com.library.controller.action.Main_action;
import com.library.controller.action.UpdateBoard_form_action;
import com.library.controller.action.SelectBoardList_action;
import com.library.controller.action.Signup_action;
import com.library.controller.action.Signup_form_action;
import com.library.controller.action.ImgBoardList_info_action;
import com.library.controller.action.ImgDelete_action;
import com.library.controller.action.InsertBoard_form_action;
import com.library.controller.action.Login_action;
import com.library.controller.action.Login_form_action;
import com.library.controller.action.Logout_action;


public class ActionFactory {
	private ActionFactory( ) {};
	private static ActionFactory af = new ActionFactory();
	public static ActionFactory getInsetance(){
		return af;
	}
	
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("main")) {
			action = new Main_action();
		}else if(command.equals("forest")) {
			action = new Forest_action();
		}else if(command.equals("SelectBoardList")) {
			action = new SelectBoardList_action();
		}else if(command.equals("imgBoardList_info")) {
			action = new ImgBoardList_info_action();
		}else if(command.equals("insertBoard_form_action")) {
			action = new InsertBoard_form_action();
		}else if(command.equals("deleteBoard_action")) {
			action = new DeleteBoard_action();
		}else if(command.equals("updateBoard_form_action")) {
			action = new UpdateBoard_form_action();
		}else if(command.equals("imgDelete_action")) {
			action = new ImgDelete_action();
		}else if(command.equals("login_action")) {
			action = new Login_action();
		}else if(command.equals("login_form_action")) {
			action = new Login_form_action();
		}else if(command.equals("logout_action")) {
			action = new Logout_action();
		}else if(command.equals("signup_form_action")) {
			action = new Signup_form_action();
		}else if(command.equals("idChk_action")) {
			action = new IdChk_action();
		}else if(command.equals("signup_action")) {
			action = new Signup_action();
		}
		
		return action;
	}
}
