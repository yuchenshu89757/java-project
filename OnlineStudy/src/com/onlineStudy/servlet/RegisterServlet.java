package com.onlineStudy.servlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.onlineStudy.dao.*;
import com.onlineStudy.entity.*;
@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
	
		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
		
		HttpSession session = request.getSession();
		String u_id = request.getParameter("u_id");
		String u_pwd = request.getParameter("u_pwd");
		String u_sex = request.getParameter("u_sex");
		String u_name = request.getParameter("u_name");
		String u_signature = request.getParameter("u_signature");
		String pageURL = session.getAttribute("pageURL").toString();

		UserDao dao = new UserDao();
		User u = new User();
		u.setU_id(u_id);
		u.setU_pwd(u_pwd);
		u.setU_sex(u_sex);
		u.setU_name(u_name);
		u.setU_signature(u_signature);
		int re = dao.add(u);
		if(re>0)
			response.sendRedirect("index.jsp");
		else
			response.sendRedirect(pageURL);
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
	
		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
	}
}
