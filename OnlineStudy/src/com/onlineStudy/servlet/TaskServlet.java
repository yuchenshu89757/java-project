package com.onlineStudy.servlet;
import com.onlineStudy.dao.*;
import com.onlineStudy.entity.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
@SuppressWarnings("serial")
public class TaskServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
		
		request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("GBK");
		
		HttpSession session = request.getSession();
		String u_id = session.getAttribute("log").toString();
		String pageURL = session.getAttribute("pageURL").toString();
		String t_name = request.getParameter("t_name");
		String t_content = request.getParameter("t_content");
		String t_sDate = request.getParameter("t_sDate");
		String t_eDate = request.getParameter("t_eDate");
		String detail = request.getParameter("detail");
		String t_note = request.getParameter("t_note");
		
		TaskDao dao = new TaskDao();
		Task t = new Task(u_id,t_name,t_content,t_sDate,t_eDate,t_note,0);
		int re = dao.add(t);
		Task _t = dao.getById(u_id);
		int _re = handleDetail(detail,_t.getT_id());
		if(re>0&&_re>0)
			response.sendRedirect(pageURL);
		else
			response.sendRedirect("index.jsp");
	}
	private int handleDetail(String detail,int t_id){
		int re = -1;
		DetailDao dao = new DetailDao();
		String []ss = detail.split("\n");
		for(int i=0;i<ss.length;i++){
			String []tt = ss[i].split("/");
			Detail d = new Detail(t_id,tt[0],tt[1],0);
			re = dao.add(d);
		}
		return re;
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
		request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("GBK");
		
		HttpSession session = request.getSession();
		int d_id = Integer.parseInt(request.getParameter("d_id"));
		int len = Integer.parseInt(request.getParameter("len"));
		String pageURL = session.getAttribute("pageURL").toString();
		String u_id = session.getAttribute("log").toString();
		
		DetailDao dao = new DetailDao();
		UserDao daoU = new UserDao();
		Detail d = dao.getInfo(d_id);
		User u = daoU.getInfo(u_id);
		int finished = d.getD_finished();
		int u_point = u.getU_point();
		if(finished == 0){
			finished = 1;
			u_point += 10;
		}else{
			u_point -= 10;
			finished = 0;
		}
		daoU.updatePoint(u_id, u_point);
		int re = dao.updateRate(d_id, finished);
		List<Detail> list = dao.getById(d.getT_id(),2);
		int fin = list.size() * 100 / len;
		TaskDao daoT = new TaskDao();
		daoT.updateRate(d.getT_id(), fin);
		if(fin==100)
			session.setAttribute("finished",list.size());
		else if(finished == 1)
			session.setAttribute("finished",1);
		if(re>0)
			response.sendRedirect(pageURL);
		else
			response.sendRedirect("index.jsp");
	}
}
