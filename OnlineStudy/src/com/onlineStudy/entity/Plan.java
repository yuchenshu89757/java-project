package com.onlineStudy.entity;
public class Plan {
	private int p_id;
	private String u_id;
	private int p_type;
	private String p_name;
	private String p_content;
	private int p_finished;
	private String p_sTime;
	private String p_eTime;
	private String p_note;
	private String p_date;
	
	public Plan(){}
	public Plan(String u_id,int p_type,String p_name,String p_content,int p_finished,String p_sTime,String p_eTime,String p_note,String p_date){
		this.u_id = u_id;
		this.p_type = p_type;
		this.p_name = p_name;
		this.p_content = p_content;
		this.p_finished = p_finished;
		this.p_sTime = p_sTime;
		this.p_eTime = p_eTime;
		this.p_note = p_note;
		this.p_date = p_date;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int pId) {
		p_id = pId;
	}
	public int getP_type() {
		return p_type;
	}
	public void setP_type(int pType) {
		p_type = pType;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String uId) {
		u_id = uId;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String pName) {
		p_name = pName;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String pContent) {
		p_content = pContent;
	}
	public int getP_finished() {
		return p_finished;
	}
	public void setP_finished(int pFinished) {
		p_finished = pFinished;
	}
	public String getP_sTime() {
		return p_sTime;
	}
	public void setP_sTime(String pSTime) {
		p_sTime = pSTime;
	}
	public String getP_eTime() {
		return p_eTime;
	}
	public void setP_eTime(String pETime) {
		p_eTime = pETime;
	}
	public String getP_note() {
		return p_note;
	}
	public void setP_note(String pNote) {
		p_note = pNote;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String pDate) {
		p_date = pDate;
	}
}
