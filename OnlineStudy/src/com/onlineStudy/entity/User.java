package com.onlineStudy.entity;
public class User {
	private String u_id;
	private String u_pwd;
	private String u_sex;
	private String u_name;
	private String u_signature;
	private String u_registerTime;
	private String u_lastLogTime;
	private int u_studyTime;
	private int u_point;
	
	public User(){}
	public User(String u_id,String u_pwd,String u_sex,String u_name,String u_signature,String u_registerTime,String u_lastLogTime,int u_studyTime,int u_point){
		this.u_id = u_id;
		this.u_pwd = u_pwd;
		this.u_sex = u_sex;
		this.u_name = u_name;
		this.u_signature = u_signature;
		this.u_registerTime = u_registerTime;
		this.u_lastLogTime = u_lastLogTime;
		this.u_studyTime = u_studyTime;
		this.u_point = u_point;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String uId) {
		u_id = uId;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String uPwd) {
		u_pwd = uPwd;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String uSex) {
		u_sex = uSex;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String uName) {
		u_name = uName;
	}
	public String getU_signature() {
		return u_signature;
	}
	public void setU_signature(String uSignature) {
		u_signature = uSignature;
	}
	public String getU_registerTime() {
		return u_registerTime;
	}
	public void setU_registerTime(String uRegisterTime) {
		u_registerTime = uRegisterTime;
	}
	public String getU_lastLogTime() {
		return u_lastLogTime;
	}
	public void setU_lastLogTime(String uLastLogTime) {
		u_lastLogTime = uLastLogTime;
	}
	public int getU_studyTime() {
		return u_studyTime;
	}
	public void setU_studyTime(int uStudyTime) {
		u_studyTime = uStudyTime;
	}
	public int getU_point() {
		return u_point;
	}
	public void setU_point(int uPoint) {
		u_point = uPoint;
	}
}
