package com.onlineStudy.entity;
public class Course {
	private String c_id;
	private String c_name;
	private String c_room;
	private String c_teacher;
	private String c_week;
	private String c_time;
	
	public Course(){}

	public Course(String cId, String cName, String cRoom, String cTeacher, String cWeek,String cTime) {
		this.c_id = cId;
		this.c_name = cName;
		this.c_room = cRoom;
		this.c_week = cWeek;
		this.c_teacher = cTeacher;
		this.c_time = cTime;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String cId) {
		c_id = cId;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String cName) {
		c_name = cName;
	}

	public String getC_room() {
		return c_room;
	}

	public void setC_room(String cRoom) {
		c_room = cRoom;
	}
	public String getC_teacher() {
		return c_teacher;
	}

	public void setC_teacher(String cTeacher) {
		c_teacher = cTeacher;
	}

	public String getC_week() {
		return c_week;
	}

	public void setC_week(String cWeek) {
		c_week = cWeek;
	}

	public String getC_time() {
		return c_time;
	}

	public void setC_time(String cTime) {
		c_time = cTime;
	}
}
