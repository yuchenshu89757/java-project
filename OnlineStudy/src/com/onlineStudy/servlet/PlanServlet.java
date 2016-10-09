package com.onlineStudy.servlet;
import com.onlineStudy.dao.*;
import com.onlineStudy.entity.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
@SuppressWarnings("serial")
public class PlanServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
		request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("GBK");
		
		HttpSession session = request.getSession();
		String u_id = session.getAttribute("log").toString();
		String pageURL = session.getAttribute("pageURL").toString();
		int p_type = Integer.parseInt(request.getParameter("p_type"));
		String p_name = request.getParameter("p_name");
		String p_content = request.getParameter("p_content");
		String p_sTime = request.getParameter("p_sTime");
		String p_eTime = request.getParameter("p_eTime");
		String p_note = request.getParameter("p_note");
		
		PlanDao dao = new PlanDao();
		DateDao daoDate = new DateDao();
		Plan p = new Plan(u_id,p_type,p_name,p_content,0,p_sTime,p_eTime,p_note,daoDate.getCurrentDate());
		int re = dao.add(p);
		if(re>0)
			response.sendRedirect(pageURL);
		else
			response.sendRedirect("index.jsp");
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
		request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("GBK");
		
		HttpSession session = request.getSession();
		int action = Integer.parseInt(request.getParameter("action"));
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		String pageURL = session.getAttribute("pageURL").toString();
		PlanDao dao = new PlanDao();
		int re = -1;
		if(action==1){//action=1,代表删除操作
			re = dao.delete(p_id);
		}else if(action==2){//action=2,代表修改操作
			int p_finished = Integer.parseInt(request.getParameter("p_finished"));
			if(p_finished<0||p_finished>100){
				PrintWriter out = response.getWriter();
				out.print("<script>alert('请输入0~100以内的整数');location='plan.jsp';</script>");
				return;
			}
			else if(p_finished==100){
				String u_id = session.getAttribute("log").toString();
				UserDao daoUser = new UserDao();
				User u = daoUser.getInfo(u_id);
				int u_point = u.getU_point();
				
				Plan p = dao.getById(p_id);
				if(p.getP_type()==1)
					u_point += 10;
				else
					u_point += 20;
				int finish = daoUser.updatePoint(u_id, u_point);
				session.setAttribute("finish", finish);
				session.setAttribute("pType", p.getP_type());
			}
			re = dao.updateRate(p_id, p_finished);
		}
		if(re>0)
			response.sendRedirect(pageURL);
		else
			response.sendRedirect("index.jsp");
	}
}
