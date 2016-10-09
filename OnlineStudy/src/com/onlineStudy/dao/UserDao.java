package com.onlineStudy.dao;
import com.onlineStudy.db.DB;
import com.onlineStudy.entity.User;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.*;
public class UserDao {
	public boolean isExist(String u_id){
		boolean flag = false;
		DB db = new DB();
		String sql  = "select * from [User] where u_id = '" + u_id + "'";
		try{
			ResultSet rs = db.query(sql);
			if(rs.next()) flag = true;
		}catch(SQLException e){
			System.out.println("UserDao³ö´í£¡");
		}
		return flag;
	}
	public User getInfo(String u_id){
		String sql = "select * from [User] where u_id = '"+u_id+"'";
		DB db = new DB();
		ResultSet rs = db.query(sql);
		try{
			if(rs.next()){
				User u = new User();
				u.setU_id(rs.getString("u_id"));
				u.setU_pwd(rs.getString("u_pwd"));
				u.setU_name(rs.getString("u_name"));
				u.setU_registerTime(rs.getString("u_registerTime"));
				u.setU_lastLogTime(rs.getString("u_lastLogTime"));
				u.setU_studyTime(rs.getInt("u_studyTime"));
				u.setU_signature(rs.getString("u_signature"));
				u.setU_sex(rs.getString("u_sex"));
				u.setU_point(rs.getInt("u_point"));
				return u;
			}
		}catch(SQLException e){
			System.out.println(e.toString()+sql);
		}
		return null;
	}
	public int getById(String u_id, String u_pwd){
		String sql = "select * from [User] where u_id = '"+u_id+"'";
		DB db = new DB();
		try{
			ResultSet rs = db.query(sql);
			if(rs.next()){
				String password = rs.getString("u_pwd");
				if(password.equals(u_pwd))
					return 1;
			}
		}catch(SQLException e){
			System.out.println("UserDao³ö´í");
		}
		return 0;	
	}
	public List<User> getUserRank(){
		List<User> list = new ArrayList<User>();
		int count = 0;
		String sql = "select * from [User] order by u_point desc";
		DB db = new DB();
		ResultSet rs = db.query(sql);
		try{
			while(rs.next()&&(count++)<5){
				User u = new User();
				u.setU_id(rs.getString("u_id"));
				u.setU_pwd(rs.getString("u_pwd"));
				u.setU_name(rs.getString("u_name"));
				u.setU_registerTime(rs.getString("u_registerTime"));
				u.setU_lastLogTime(rs.getString("u_lastLogTime"));
				u.setU_studyTime(rs.getInt("u_studyTime"));
				u.setU_signature(rs.getString("u_signature"));
				u.setU_sex(rs.getString("u_sex"));
				u.setU_point(rs.getInt("u_point"));
				list.add(u);
			}
			return list;
		}catch(SQLException e){
			System.out.println(e.toString()+sql);
		}
		return null;
	}
	public int add(User u){
		int re = -1;
		String u_id = u.getU_id();
		String u_sex = u.getU_sex();
		String u_pwd = u.getU_pwd();
		String u_name = u.getU_name();
		String u_signature = u.getU_signature();
		if(!isExist(u_id)){
			String sql = "insert into [User] values ('"+u_id+"','"+u_pwd+"','"+u_name+"',GETDATE(),GETDATE(),0,'"+u_signature+"','"+u_sex+"',0)";
			DB db = new DB();
			re = db.update(sql);
		}
		return re;
	}
	public int updateTime(String u_id){
		int re = -1;
		String sql = "update [User] set u_lastLogTime = GETDATE() where u_id = '"+u_id+"'";
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
	public int updatePwd(String u_id,String u_pwd){
		int re = -1;
		String sql = "update [User] set u_pwd = '"+u_pwd+"' where u_id = '"+u_id+"'";
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
	public int updateStudyInfo(String u_id,int u_studyTime){
		int re = -1;
		String sql = "update [User] set u_studyTime = "+u_studyTime+" where u_id = '"+u_id+"'";
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
	public int updatePoint(String u_id,int u_point){
		int re = -1;
		String sql = "update [User] set u_point = "+u_point+" where u_id = '"+u_id+"'";
		DB db = new DB();
		re = db.update(sql);
		return re;
	}
}
