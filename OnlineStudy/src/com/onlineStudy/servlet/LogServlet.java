package com.onlineStudy.servlet;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.onlineStudy.dao.*;
import com.onlineStudy.entity.User;
@SuppressWarnings("serial")
public class LogServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{

		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
		
		String u_id = request.getParameter("u_id");
		String u_pwd = request.getParameter("u_pwd");
		HttpSession session = request.getSession();
		String pageURL = session.getAttribute("pageURL").toString();
	
		UserDao dao = new UserDao();
		int re = dao.getById(u_id, u_pwd);
		dao.updateTime(u_id);
		
		PlanDao daoP = new PlanDao();
		int pLen = daoP.getAll(u_id, null, 3).size();
		
		TaskDao daoT = new TaskDao();
		int tLen = daoT.getById(u_id)==null?0:1;
		
		int tt = pLen * 10 + tLen;
		
		if(re==1){
			session.setAttribute("log", u_id);
			session.setAttribute("show", 1);
			session.setAttribute("re", tt);
			response.sendRedirect(pageURL);
		}else
			response.sendRedirect("index.jsp");
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{

		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
		
		HttpSession session = request.getSession();
		String u_id = session.getAttribute("log").toString();
		String pageURL = session.getAttribute("pageURL").toString();
	
		UserDao dao = new UserDao();
		User u = dao.getInfo(u_id);
		
		DateDao daoDate = new DateDao();
		String lastTime = u.getU_lastLogTime();
		lastTime = daoDate.getCurrentHour(lastTime);
		
		String currentTime = daoDate.getCurrentTime();
		currentTime = daoDate.getCurrentHour(currentTime);
		
		int currentStudyTime = Integer.parseInt(currentTime) - Integer.parseInt(lastTime);
		currentStudyTime += u.getU_studyTime();
		int re = dao.updateStudyInfo(u_id, currentStudyTime);
		if(re>0){
			session.setAttribute("log", null);
			session.setAttribute("show", null);
			session.setAttribute("msg", null);
			response.sendRedirect(pageURL);
		}
		else
			response.sendRedirect("index.jsp");
	}
}
