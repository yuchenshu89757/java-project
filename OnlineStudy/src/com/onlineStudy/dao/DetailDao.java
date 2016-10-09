package com.onlineStudy.dao;
import com.onlineStudy.entity.*;
import com.onlineStudy.db.*;
import java.sql.*;
import java.util.*;
public class DetailDao {
	public int add(Detail d){
		int re = -1;
		int t_id = d.getT_id();
		String d_date = d.getD_date();
		String d_content = d.getD_content();
		
		String sql = "insert into [Detail] (t_id,d_date,d_content,d_finished) values ("+t_id+",'"+d_date+"','"+d_content+"',0)";
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
	public Detail getInfo(int d_id){
		String sql = "select * from [Detail] where d_id = "+d_id;
		DB db = new DB();
		ResultSet rs = db.query(sql);
		try{
			if(rs.next()){
				Detail d = new Detail();
				d.setD_id(rs.getInt("d_id"));
				d.setT_id(rs.getInt("t_id"));
				d.setD_date(rs.getString("d_date"));
				d.setD_content(rs.getString("d_content"));
				d.setD_finished(rs.getInt("d_finished"));
				return d;
			}
		}catch(SQLException e){
			System.out.println(e.toString()+sql);
		}
		return null;
	}
	public List<Detail> getById(int t_id,int condition){
		List<Detail> list = new ArrayList<Detail>();
		String sql = "select * from [Detail] where t_id = "+t_id;
		switch(condition){
			case 1: sql += "";break;
			case 2: sql += " and d_finished = 1";break;
		}
		DB db = new DB();
		ResultSet rs = db.query(sql);
		try{
			while(rs.next()){
				Detail d = new Detail();
				d.setD_id(rs.getInt("d_id"));
				d.setT_id(rs.getInt("t_id"));
				d.setD_date(rs.getString("d_date"));
				d.setD_content(rs.getString("d_content"));
				d.setD_finished(rs.getInt("d_finished"));
				list.add(d);
			}
			return list;
		}catch(SQLException e){
			System.out.println(e.toString()+sql);
		}
		return null;
	}
	public int updateRate(int d_id,int d_finished){
		int re = -1;
		String sql = "update [Detail] set d_finished = "+d_finished+" where d_id = "+d_id;
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
}
