<%@ page language="java" import="java.util.*,com.onlineStudy.dao.UserDao,com.onlineStudy.entity.User" pageEncoding="GBK"%>
<%
session.setAttribute("pageURL","register.jsp");
request.setCharacterEncoding("GBK");
response.setCharacterEncoding("GBK");
int msg = 0, show = -1;
if(session.getAttribute("re")!=null)
	msg = Integer.parseInt(session.getAttribute("re").toString());
if(session.getAttribute("show")!=null)
	show = Integer.parseInt(session.getAttribute("show").toString());
%>
<jsp:useBean id="daoUser" class="com.onlineStudy.dao.UserDao"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>学生个人学业管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/show.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/radius.js"></script>
<script type="text/javascript" src="js/check.js"></script>
<script type="text/javascript" src="js/show.js"></script>
<!-- CuFon ends -->
</head>
<body onload="showTips();start(<%=msg%>,<%=show%>)">
<div class="main">

  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li><a href="index.jsp">首页</a></li>
          <li><a href="course.jsp">我的课表</a></li>
          <li><a href="plan.jsp">我的计划</a></li>
          <li><a href="study.jsp">学习园地</a></li>
          <li class="active"><a href="register.jsp">注 册</a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="logo"><h1><a href="index.jsp">Plan<span>orz</span></a></h1></div>
      <div class="clr"></div>
    </div>
  </div>

  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>请输入您的基本信息</h2><div class="clr"></div>
          <form action="addUser" method="post" name="sendForm">
          <ol><li>
            <label for="u_id">学号</label>
            <input id="u_id" name="u_id" class="text" />
          </li><li>
            <label for="u_name">姓名</label>
            <input id="u_name" name="u_name" class="text" />
          </li><li>
            <label for="u_sex">性别</label>
            <input id="u_sex" name="u_sex" type="radio" checked value="男"/>男
            <input id="u_sex" name="u_sex" type="radio" value="女"/>女
          </li><li>
            <label for="u_pwd">密码</label>
            <input type="password" id="u_pwd" name="u_pwd" class="text" />
          </li><li>
            <label for="u_pwdc">确认密码</label>
            <input type="password" id="u_pwdc" name="u_pwdc" class="text"/>
          </li><li>
            <label for="u_signature">个性签名</label>
            <textarea id="u_signature" name="u_signature" rows="4" cols="50"></textarea>
          </li><li>
            <input type="button" value="提 交" style="height:20pt;" class="send" onclick="CheckReg('sendForm')"/>
            <div class="clr"></div>
          </li></ol>
          </form>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
        <%
        	if(session.getAttribute("log")==null){
         %>
          <form name="logForm" method="post" action="log">
          	<h2 class="star">登录</h2><div class="clr"></div>
          	<ul class="sb_menu">
            	<li><input type="text" name="u_id" style="width:162pt;height:15pt"/></li>
            	<li><input type="password" name="u_pwd" style="width:162pt;height:15pt"/></li>
            	<li><span style="float:left"><input style="height:20pt;" type="submit" value="登  录"/></span>
            	<span style="float:right;margin-right:18pt"><input style="height:20pt;" type="reset" value="重  置"/></span></li>
            	<li><br /></li>
          	</ul>
          </form>
          <%}else{
          		String u_id = session.getAttribute("log").toString();
          		session.setAttribute("show",null);
          		session.setAttribute("re",null);
          		User u = daoUser.getInfo(u_id);
        
          		String u_photo = "";
          		if((u.getU_sex()).compareTo("男")==3)
          			u_photo = "images/boy.jpg";
          		else
          			u_photo = "images/girl.jpg";
          %>
          <h2 class="star">个人信息</h2><div class="clr"></div>
          <ul class="sb_menu">
          	<li><img src="<%=u_photo%>"/></li>
            <li><strong>姓名：</strong><%=u.getU_name() %></li>
            <li><strong>性别</strong>：<%=u.getU_sex() %></li>
            <li><strong>积分</strong>：<%=u.getU_point()%></li>
            <li><strong>学习时间：</strong><%=u.getU_studyTime() %>小时</li>
            <li><strong>个性签名：</strong><%=u.getU_signature() %></li>
            <li><strong>登录时间：</strong><%=u.getU_lastLogTime() %></li>
            <li><span style="float:right"><a style="cursor:pointer;" onclick="if(window.confirm('您确认要注销？')){location='log';}"><strong>>>注销</strong></a></span></li>
          </ul>
          <%}%>
        </div>
        <div class="gadget">
          <h2 class="star"><span>网站排名</span></h2><div class="clr"></div>
          <%
          List<User> listU = daoUser.getUserRank();
          if(listU!=null){%>
          <table style="border:1px solid #CCC;width:100%">
          <tr style="background-color:#CCC">
          	<th>姓名</th>
          	<th>积分</th>
          	<th>学习时间</th>
          </tr>
          <%for(int i=0;i<listU.size();i++){
          	User u = listU.get(i);
          %>
          	<tr style="text-align:center;">
          		<td width=33%><%=u.getU_name()%></td>
          		<td width=33%><%=u.getU_point() %></td>
          		<td><%=u.getU_studyTime()%>小时</td>
          	</tr>
          <%}%>
          </table>
          <%}else{%>
          	<p>目前暂无用户</p>
          <%}%>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>

  <div class="footer">
    <div class="footer_resize">
      <ul class="fmenu">
        <li><a href="index.jsp">首页</a></li>
        <li><a href="course.jsp">我的课表</a></li>
        <li><a href="plan.jsp">我的计划</a></li>
        <li><a href="study.jsp">学习园地</a></li>
        <li class="active"><a href="register.jsp">注册</a></li>
      </ul>
      <div class="clr"></div>
    </div>
  </div>
</div>
</body>
</html>