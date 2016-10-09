package com.onlineStudy.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import com.onlineStudy.dao.*;
import com.onlineStudy.entity.*;
@SuppressWarnings("serial")
public class AddCourseServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{

		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
		
		String c_id = request.getParameter("c_id");
		String c_name = request.getParameter("c_name");
		String c_room = request.getParameter("c_room");
		String c_teacher = request.getParameter("c_teacher");
		String c_week = request.getParameter("c_week");
		String c_time = request.getParameter("c_time");
		
		HttpSession session = request.getSession();
		String pageURL = session.getAttribute("pageURL").toString();
	
		CourseDao dao = new CourseDao();
		Course c = new Course(c_id,c_name,c_room,c_teacher,c_week,c_time);
		int re = dao.add(c);
		if(re>0)
			response.sendRedirect(pageURL);
		else
			response.sendRedirect("index.jsp");
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{

		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
	}
}
