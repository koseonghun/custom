package com.CusTomSoft.demo.VO;

import java.util.Date;

public class BoardVO {
	
	public int board_seq;
	public String board_title;
	public String board_text;
	public String board_writer;
	public Date board_reg_date;
	public Date board_mod_date;
	public String board_img_path;
	public String board_del_yn;
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_text() {
		return board_text;
	}
	public void setBoard_text(String board_text) {
		this.board_text = board_text;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public Date getBoard_reg_date() {
		return board_reg_date;
	}
	public void setBoard_reg_date(Date board_reg_date) {
		this.board_reg_date = board_reg_date;
	}
	public Date getBoard_mod_date() {
		return board_mod_date;
	}
	public void setBoard_mod_date(Date board_mod_date) {
		this.board_mod_date = board_mod_date;
	}
	public String getBoard_img_path() {
		return board_img_path;
	}
	public void setBoard_img_path(String board_img_path) {
		this.board_img_path = board_img_path;
	}
	public String getBoard_del_yn() {
		return board_del_yn;
	}
	public void setBoard_del_yn(String board_del_yn) {
		this.board_del_yn = board_del_yn;
	}
	
	
	
	
}
