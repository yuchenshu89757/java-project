package com.onlineStudy.dao;
import com.onlineStudy.db.*;
import com.onlineStudy.entity.Plan;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.*;
public class PlanDao {
	public int add(Plan p){
		int re = -1;
		String u_id = p.getU_id();
		int p_type = p.getP_type();
		String p_name = p.getP_name();
		String p_content = p.getP_content();
		int p_finished = p.getP_finished();
		String p_sTime = p.getP_sTime();
		String p_eTime = p.getP_eTime();
		String p_note = p.getP_note();
		String p_date = p.getP_date();
		
		String sql = "insert into [Plan] (u_id,p_type,p_name,p_content,p_finished,p_sTime,p_eTime,p_note,p_date) values ('"+u_id+"',"+p_type+",'"+p_name+"','"+p_content+"',"+p_finished+",'"+p_sTime+"','"+p_eTime+"','"+p_note+"','"+p_date+"')";
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
	public int delete(int p_id){
		int re = -1;
		String sql = "delete from [Plan] where p_id = "+p_id;
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
	public int updateRate(int p_id,int p_finished){
		int re = -1;
		String sql = "update [Plan] set p_finished = "+p_finished+" where p_id = "+p_id;
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
	public Plan getById(int p_id){
		String sql = "select * from [Plan] where p_id = "+p_id;
		DB db = new DB();
		ResultSet rs = db.query(sql);
		try{
			if(rs.next()){
				Plan p = new Plan();
				p.setP_id(rs.getInt("p_id"));
				p.setU_id(rs.getString("u_id"));
				p.setP_type(rs.getInt("p_type"));
				p.setP_name(rs.getString("p_name"));
				p.setP_content(rs.getString("p_content"));
				p.setP_finished(rs.getInt("p_finished"));
				p.setP_sTime(rs.getString("p_sTime"));
				p.setP_eTime(rs.getString("p_eTime"));
				p.setP_note(rs.getString("p_note"));
				p.setP_date(rs.getString("p_date"));
				return p;
			}
		}catch(SQLException e){
			System.out.println(e.toString()+sql);
		}
		return null;
	}
	public List<Plan> getAll(String u_id,String p_date,int condition){
		List<Plan> list =  new ArrayList<Plan>();
		String sql = "select * from [Plan] where u_id = '"+u_id+"'";
		switch(condition){
			case 1: sql += " and p_date = '"+p_date+"'";
					break;
			case 2: sql += " and p_date = '"+p_date+"' and p_finished = 100";
					break;
			case 3: sql += " and p_finished < 100";
					break;
			case 4: sql += " and p_date <> '"+p_date+"' and p_finished < 100";
		}
		DB db = new DB();
		ResultSet rs = db.query(sql);
		try{
			while(rs.next()){
				Plan p = new Plan();
				p.setP_id(rs.getInt("p_id"));
				p.setU_id(rs.getString("u_id"));
				p.setP_type(rs.getInt("p_type"));
				p.setP_name(rs.getString("p_name"));
				p.setP_content(rs.getString("p_content"));
				p.setP_finished(rs.getInt("p_finished"));
				p.setP_sTime(rs.getString("p_sTime"));
				p.setP_eTime(rs.getString("p_eTime"));
				p.setP_note(rs.getString("p_note"));
				p.setP_date(rs.getString("p_date"));
				list.add(p);
			}
			return list;
		}catch(SQLException e){
			System.out.println(e.toString()+sql);
		}
		return null;
	}
}
