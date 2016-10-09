package com.onlineStudy.dao;
import com.onlineStudy.entity.Course;
import com.onlineStudy.db.DB;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
public class CourseDao {
	public int add(Course c){
		int re = -1;
		String c_id = c.getC_id();
		String c_name = c.getC_name();
		String c_room = c.getC_room();
		String c_teacher = c.getC_teacher(); 
		String c_week = c.getC_week();
		String c_time = c.getC_time();
		
		String sql = "insert into [Course] values ('"+c_id+"','"+c_name+"','"+c_room+"','"+c_teacher+"','"+c_week+"','"+c_time+"')";
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
	public Course getById(String c_id){
		String sql = "select * from [Course] where c_id = '"+c_id+"'";
		DB db = new DB();
		ResultSet rs = db.query(sql);
		try{
			if(rs.next()){
				Course c = new Course();
				c.setC_id(rs.getString("c_id"));
				c.setC_name(rs.getString("c_name"));
				c.setC_room(rs.getString("c_room"));
				c.setC_teacher(rs.getString("c_teacher"));
				c.setC_week(rs.getString("c_week"));
				c.setC_time(rs.getString("c_time"));
				return c;
			}
		}catch(SQLException e){
			System.out.println(e.toString()+sql);
		}
		return null;
	}
	public List<Course> getAll(){
		List<Course> list = new ArrayList<Course>();
		String sql = "select * from [Course]";
		DB db = new DB();
		ResultSet rs = db.query(sql);
		try{
			while(rs.next()){
				Course c = new Course();
				c.setC_id(rs.getString("c_id"));
				c.setC_name(rs.getString("c_name"));
				c.setC_room(rs.getString("c_room"));
				c.setC_teacher(rs.getString("c_teacher"));
				c.setC_week(rs.getString("c_week"));
				c.setC_time(rs.getString("c_time"));
				list.add(c);
			}
		}catch(SQLException e){
			System.out.println(e.toString()+sql);
		}
		return list;
	}
}
