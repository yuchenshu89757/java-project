package com.onlineStudy.dao;
import com.onlineStudy.entity.*;
import com.onlineStudy.db.*;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
public class SelectCourseDao {
	public boolean isExist(String u_id,String c_id){
		String sql = "select * from [Schedule] where u_id = '"+u_id+"' and c_id = '"+c_id+"'";
		DB db = new DB();
		ResultSet rs = db.query(sql);
		try{
			if(rs.next())
				return true;
		}catch(SQLException e){
			System.out.println(e.toString()+sql);
		}
		return false;
	}
	public int add(SelectCourse s){
		int re = -1;
		String u_id = s.getU_id();
		String c_id = s.getC_id();
		String sql = "insert into [Schedule] (u_id,c_id) values ('"+u_id+"','"+c_id+"')";
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
	public int delete(String u_id, String c_id){
		int re = -1;
		String sql = "delete from [Schedule] where u_id = '"+u_id+"' and c_id = '"+c_id+"'";
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
	public List<SelectCourse> getAll(String u_id){
		List<SelectCourse> list = new ArrayList<SelectCourse>();
		String sql = "select * from [Schedule] where u_id = '"+u_id+"'";
		DB db = new DB();
		ResultSet rs = db.query(sql);
		try{
			while(rs.next()){
				SelectCourse s = new SelectCourse();
				s.setS_id(rs.getInt("s_id"));
				s.setU_id(rs.getString("u_id"));
				s.setC_id(rs.getString("c_id"));
				list.add(s);
			}
		}catch(SQLException e){
			System.out.println(e.toString()+sql);
		}
		return list;
	}
}
