package com.onlineStudy.dao;
import com.onlineStudy.db.*;
import com.onlineStudy.entity.*;
import java.sql.*;
public class TaskDao {
	public int add(Task t){
		int re = -1;
		String u_id = t.getU_id();
		String t_name = t.getT_name();
		String t_content = t.getT_content();
		String t_sDate = t.getT_sDate();
		String t_eDate = t.getT_eDate();
		String t_note = t.getT_note();
		
		String sql = "insert into [Task] (u_id,t_name,t_content,t_sDate,t_eDate,t_note,t_finished) values ('"+u_id+"','"+t_name+"','"+t_content+"','"+t_sDate+"','"+t_eDate+"','"+t_note+"',0)";
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
	public Task getById(String u_id){
		String sql = "select * from [Task] where u_id = '"+u_id+"' and t_finished < 100";
		DB db = new DB();
		ResultSet rs = db.query(sql);
		try{
			if(rs.next()){
				Task t = new Task();
				t.setT_id(rs.getInt("t_id"));
				t.setU_id(rs.getString("u_id"));
				t.setT_name(rs.getString("t_name"));
				t.setT_content(rs.getString("t_content"));
				t.setT_sDate(rs.getString("t_sDate"));
				t.setT_eDate(rs.getString("t_eDate"));
				t.setT_finished(rs.getInt("t_finished"));
				return t;
			}
		}catch(SQLException e){
			System.out.println(e.toString()+sql);
		}
		return null;
	}
	public int updateRate(int t_id,int t_finished){
		int re = -1;
		String sql = "update [Task] set t_finished = "+t_finished+" where t_id = "+t_id;
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
}
