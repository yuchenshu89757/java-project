package com.onlineStudy.servlet;
import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.onlineStudy.dao.*;
import com.onlineStudy.entity.*;
@SuppressWarnings("serial")
public class AddScheduleServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{

		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
		
		HttpSession session = request.getSession();
		String c_id = request.getParameter("c_id");
		String u_id = session.getAttribute("log").toString();
		String pageURL = session.getAttribute("pageURL").toString();
	
		CourseDao cDao = new CourseDao();
		Course c = cDao.getById(c_id);
		SelectCourseDao dao = new SelectCourseDao();
		List<SelectCourse> list = dao.getAll(u_id);
		boolean isFind = false;
		for(int i=0;i<list.size();++i){
			String cId = list.get(i).getC_id();
			Course cc = cDao.getById(cId);
			if(cc.getC_name().equals(c.getC_name())){
				isFind = true;
				break;
			}
		}
		if(!dao.isExist(u_id, c_id)&&!isFind){
			SelectCourse s = new SelectCourse(0,u_id,c_id);
			int re = dao.add(s);
			if(re>0)
				response.sendRedirect(pageURL);
			else
				response.sendRedirect("index.jsp");
		}else{
			PrintWriter out = response.getWriter();
			out.print("<script>alert('您已添加过该课程，请不要重复添加！');location='course.jsp';</script>");
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{

		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
		
		HttpSession session = request.getSession();
		String c_id = request.getParameter("c_id");
		String u_id = session.getAttribute("log").toString();
		String pageURL = session.getAttribute("pageURL").toString();
		
		SelectCourseDao dao = new SelectCourseDao();
		int re = dao.delete(u_id, c_id);
		if(re>0)
			response.sendRedirect(pageURL);
		else
			response.sendRedirect("index.jsp");
	}
}
