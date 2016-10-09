package com.onlineStudy.entity;

public class SelectCourse {
	private int s_id;
	private String u_id;
	private String c_id;
	public SelectCourse(){}
	public SelectCourse(int s_id,String u_id,String c_id){
		this.s_id = s_id;
		this.u_id = u_id;
		this.c_id = c_id;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int sId) {
		s_id = sId;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String uId) {
		u_id = uId;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String cId) {
		c_id = cId;
	}
}
