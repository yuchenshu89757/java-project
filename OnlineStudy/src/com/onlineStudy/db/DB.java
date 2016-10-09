package com.onlineStudy.db;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
public class DB {
	Connection conn = null;
	public void open(){
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			conn = DriverManager.getConnection("jdbc:odbc:sqlserver;","sa","123456");
		}catch(Exception e){
			System.out.println(e.toString()+" ˝æ›ø‚º”‘ÿ ß∞‹");
		}
	}
	public void close(){
		conn = null;
	}
	public ResultSet query(String sql){
		ResultSet rs = null;
		this.open();
		try{
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			stmt = null;
		}catch(SQLException e){
			System.out.println(e.toString()+sql);
		}
		this.close();
		return rs;
	}
	public int update(String sql){
		int re = -1;
		this.open();
		try{
			Statement stmt = conn.createStatement();
			re = stmt.executeUpdate(sql);
			stmt = null;
		}catch(SQLException e){
			System.out.println(e.toString()+sql);
		}
		this.close();
		return re;
	}
}
