package com.library.vo;

import java.sql.Timestamp;

public class BoardVO {
	private int board_idx;
	private String board_title;
    private String member_id;
    private String member_pwd;	
    private String board_content;
    private Timestamp board_time;
    private String board_type;
    private int board_count;	
    private String board_picture;
    private String board_picture2;
    private String board_picture3;
    private String board_picture4;
    private String board_picture5;
    private String board_picture6;
    
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Timestamp getBoard_time() {
		return board_time;
	}
	public void setBoard_time(java.sql.Timestamp timestamp) {
		this.board_time = timestamp;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public String getBoard_picture() {
		return board_picture;
	}
	public void setBoard_picture(String board_picture) {
		this.board_picture = board_picture;
	}
	public String getBoard_picture2() {
		return board_picture2;
	}
	public void setBoard_picture2(String board_picture2) {
		this.board_picture2 = board_picture2;
	}
	public String getBoard_picture3() {
		return board_picture3;
	}
	public void setBoard_picture3(String board_picture3) {
		this.board_picture3 = board_picture3;
	}
	public String getBoard_picture4() {
		return board_picture4;
	}
	public void setBoard_picture4(String board_picture4) {
		this.board_picture4 = board_picture4;
	}
	public String getBoard_picture5() {
		return board_picture5;
	}
	public void setBoard_picture5(String board_picture5) {
		this.board_picture5 = board_picture5;
	}
	public String getBoard_picture6() {
		return board_picture6;
	}
	public void setBoard_picture6(String board_picture6) {
		this.board_picture6 = board_picture6;
	}
    
    
}
