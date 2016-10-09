package com.onlineStudy.entity;
public class Task {
	private int t_id;
	private String u_id;
	private String t_name;
	private String t_content;
	private String t_sDate;
	private String t_eDate;
	private String t_note;
	private int t_finished;
	
	public Task(){}
	public Task(String u_id,String t_name,String t_content,String t_sDate,String t_eDate,String t_note,int t_finished){
		this.u_id = u_id;
		this.t_name = t_name;
		this.t_content = t_content;
		this.t_sDate = t_sDate;
		this.t_eDate = t_eDate;
		this.t_note = t_note;
		this.t_finished = t_finished;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int tId) {
		t_id = tId;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String uId) {
		u_id = uId;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String tName) {
		t_name = tName;
	}
	public String getT_content() {
		return t_content;
	}
	public void setT_content(String tContent) {
		t_content = tContent;
	}
	public int getT_finished() {
		return t_finished;
	}
	public void setT_finished(int tFinished) {
		t_finished = tFinished;
	}
	public String getT_sDate() {
		return t_sDate;
	}
	public void setT_sDate(String tSDate) {
		t_sDate = tSDate;
	}
	public String getT_eDate() {
		return t_eDate;
	}
	public void setT_eDate(String tEDate) {
		t_eDate = tEDate;
	}
	public String getT_note() {
		return t_note;
	}
	public void setT_note(String tNote) {
		t_note = tNote;
	}
}
