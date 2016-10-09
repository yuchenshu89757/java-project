package com.onlineStudy.entity;
public class Detail {
	private int d_id;
	private int t_id;
	private String d_date;
	private String d_content;
	private int d_finished;
	
	public Detail(){}
	public Detail(int t_id,String d_date,String d_content,int d_finished){
		this.t_id = t_id;
		this.d_date = d_date;
		this.d_content = d_content;
		this.d_finished = d_finished;
	}
	public int getD_id() {
		return d_id;
	}
	public void setD_id(int dId) {
		d_id = dId;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int tId) {
		t_id = tId;
	}
	public String getD_date() {
		return d_date;
	}
	public void setD_date(String dDate) {
		d_date = dDate;
	}
	public String getD_content() {
		return d_content;
	}
	public void setD_content(String dContent) {
		d_content = dContent;
	}
	public int getD_finished() {
		return d_finished;
	}
	public void setD_finished(int dFinished) {
		d_finished = dFinished;
	}
}
