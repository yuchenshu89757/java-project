package com.onlineStudy.dao;
import java.util.Date;
import java.text.SimpleDateFormat;
public class DateDao {
	public String getCurrentTime(){
		String currentTime = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		currentTime = sdf.format(new Date());
		return currentTime;
	}
	public String getCurrentDate(){
		String currentTime = getCurrentTime();
		return currentTime.substring(0, currentTime.indexOf(" "));
	}
	public String getCurrentClock(){
		String currentTime = getCurrentTime();
		return currentTime.substring(currentTime.indexOf(" ")+1,currentTime.length()-1);
	}
	public String getCurrentHour(String time){
		return time.substring(time.indexOf(" ")+1, time.indexOf(":"));
	}
	public String getDateString(){
		String currentDate = getCurrentDate();
		String []str = currentDate.split("-");
		return str[0]+"年"+str[1]+"月"+str[2]+"日";
	}
	public String getTimeSpan(String timeOne,String timeTwo){
		int o_h = Integer.parseInt(timeOne.substring(0, 2));
		int o_m = Integer.parseInt(timeOne.substring(3, 5));
		int t_h = Integer.parseInt(timeTwo.substring(0, 2));
		int t_m = Integer.parseInt(timeTwo.substring(3, 5));
		int h_span = t_h - o_h;
		int m_span = t_m - o_m;
		return (h_span+"小时"+m_span+"分钟");
	}
}
