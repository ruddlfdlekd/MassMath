package com.math.myNote;

public class MyNoteDTO {
	private String id;
	private int pnum;
	private int my_answer;
	private String reason;
	private String reg_date;
	
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getMy_answer() {
		return my_answer;
	}
	public void setMy_answer(int my_answer) {
		this.my_answer = my_answer;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	

}
