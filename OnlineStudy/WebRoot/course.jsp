<%@ page language="java" import="java.util.*,com.onlineStudy.entity.*,com.onlineStudy.dao.*" pageEncoding="GBK"%>
<%
session.setAttribute("pageURL","course.jsp");
int msg = 0, show = -1;
if(session.getAttribute("re")!=null)
	msg = Integer.parseInt(session.getAttribute("re").toString());
if(session.getAttribute("show")!=null)
	show = Integer.parseInt(session.getAttribute("show").toString());
%>
<jsp:useBean id="daoUser" class="com.onlineStudy.dao.UserDao"></jsp:useBean>
<jsp:useBean id="daoCourse" class="com.onlineStudy.dao.CourseDao"></jsp:useBean>
<jsp:useBean id="daoSchedule" class="com.onlineStudy.dao.SelectCourseDao"></jsp:useBean>
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
          <li class="active"><a href="course.jsp">我的课表</a></li>
          <li><a href="plan.jsp">我的计划</a></li>
          <li><a href="study.jsp">学习园地</a></li>
          <li><a href="register.jsp">注 册</a></li>
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
          <h2>我的课表</h2><div class="clr"></div>
          <%
          	if(session.getAttribute("log")==null){
          %>
          <p><strong>请先登录</strong></p>
          <%}else{ 
                String uId = session.getAttribute("log").toString();
          		session.setAttribute("show",null);
          		session.setAttribute("re",null);
          		List<SelectCourse> listS = daoSchedule.getAll(uId);
          %>
          <table border=1px width=100%>
          <%if(listS.size()>0){%>
          	<tr>
          		<th>星期一</th><th>星期二</th><th>星期三</th><th>星期四</th><th>星期五</th>
          	</tr>
          	<%
          		String [][]ss = new String[5][];
          		for(int i=0;i<5;i++){
          			ss[i] = new String[5];
          			for(int j=0;j<5;j++)
          				ss[i][j] = "";
          		}
          		for(int i=0;i<listS.size();i++){
          			String c_id = listS.get(i).getC_id();
          			Course c = daoCourse.getById(c_id);
          			String []cc = c.getC_time().split("/");
          			for(int j=0;j<cc.length;j++){
          				int iDay = Integer.parseInt(cc[j].substring(0,1));
          				int iRank = Integer.parseInt(cc[j].substring(1,2));
          				if(ss[iDay-1][iRank-1]!="")
          					ss[iDay-1][iRank-1] += "<br/>";
          				ss[iRank-1][iDay-1] += (c.getC_name()+"<br/>"+c.getC_week()+"周<br/>"+c.getC_teacher());
          			}
          		}
          		for(int i=0;i<5;i++){%>
          			<tr style="text-align:center">
          				<td><%=ss[i][0]!=""?ss[i][0]:"&nbsp"%></td>
          				<td><%=ss[i][1]!=""?ss[i][1]:"&nbsp"%></td>
          				<td><%=ss[i][2]!=""?ss[i][2]:"&nbsp"%></td>
          				<td><%=ss[i][3]!=""?ss[i][3]:"&nbsp"%></td>
          				<td><%=ss[i][4]!=""?ss[i][4]:"&nbsp"%></td>
          			</tr>
          		<%}%>
          <%}%>
          </table>
          <h2>已选课程</h2><div class="clr"></div>
          	<%
          		if(listS.size()>0){%>
          		<table border="1px">
          		<tr>
          			<th>课程名</th>
          			<th>教室</th>
          			<th>上课周次</th>
          			<th>上课时间</th>
          			<th>任课教师</th>
          			<th>操作</th>
          		</tr>
          		<%for(int i=0;i<listS.size();++i) {
          			String c_id = listS.get(i).getC_id();
          			Course c = daoCourse.getById(c_id);
          		%>
            		<tr style="text-align:center">
            			<td width="120pt"><%=c.getC_name() %></td>
            			<td width="120pt"><%=c.getC_room() %></td>
            			<td width="120pt"><%=c.getC_week() %></td>
            			<td width="120pt"><%=c.getC_time() %></td>
            			<td width="120pt"><%=c.getC_teacher() %></td>
            			<td width="40pt"><a style="cursor:pointer;" onclick="if(window.confirm('确定要剔除这门课程？')){location='selectCourse?c_id=<%=c.getC_id() %>'}"><img src="images/del.jpg" alt="踢课" width="20pt" height="20pt"/></a></td>
            		</tr>
          		<%}%>
          		</table>
          	<%}else{%>
          		<p><strong>您的课表为空,快去选课吧</strong></p>
          	<%}%>
          <%}%>
          <%
          	if(session.getAttribute("log")!=null){
          %>
          <div>
          <h2>选课</h2>
          <form method="post" action="selectCourse">
          <ul class="sub_menu">
          	<li style="list-style:none">
          		<select name="c_id" multiple="multiple" size="5">
          		<%
          			List<Course> listC = daoCourse.getAll();
          			for(int i=0;i<listC.size();i++){
          				Course c = listC.get(i);
          			%>
          				<option value="<%=c.getC_id()%>" <%=i==0?"selected":""%>><%=c.getC_id()+" "+c.getC_name()+"\t"+c.getC_room()+" "+c.getC_week()+"周  "+c.getC_teacher()+" "+c.getC_time()%></option>
          		<%}%>
          		</select>
          		<input style="font-family:'微软雅黑'" type="submit" value="添 加"/>
          	</li>	
          </ul>
          </form>
          </div>
          <%}%>
          <h2>添加课程</h2><div class="clr"></div>
          <form name="courseForm" method="post" action="addCourse">
          <ul>
          	<li style="list-style:none"><span style="margin-right:10pt;"><label style="margin-right:5pt">课程号</label><input type="text" name="c_id" id="c_id"/></span>
          		<label style="margin-right:5pt">课程名</label><input type="text" name="c_name" id="c_name"/></li>
          	<li style="list-style:none"><span style="margin-right:10pt;"><label style="margin-right:5pt;margin-left:9pt">教室</label><input type="text" name="c_room" id="c_room"/></span>
          		<label style="margin-right:5pt;margin-left:9pt">周次</label><input type="text" name="c_week" id="c_week"/></li>
          	<li style="list-style:none"><label style="margin-right:5pt">上课时间</label><input type="text" name="c_time" id="c_teacher"/>(例如周三第一大节，则输入31，多个时间之间用  / 分隔)</li>
          	<li style="list-style:none"><label style="margin-right:5pt;margin-left:9pt">老师</label><input type="text" name="c_teacher" id="c_teacher"/></li>
          	<li style="list-style:none"><br/></li>
          	<li style="list-style:none"><span style="margin:20pt;"><input type="button" value="提 交" style="height:20pt;" onclick="CheckCourse('courseForm')"/></span>
          	<span style="margin-left:20pt;"><input type="reset" style="height:20pt;" value="重 置"/></span></li>
          </ul>
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
            	<li><span style="float:left"><input type="submit" style="height:20pt" value="登  录"/></span>
            	<span style="float:right;margin-right:18pt"><input style="height:20pt" type="reset" value="重  置"/></span></li>
            	<li><br /></li>
          	</ul>
          </form>
          <%}else{
          		String u_id = session.getAttribute("log").toString();
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
          <%}%>        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <ul class="fmenu">
        <li><a href="index.jsp">首页</a></li>
        <li class="active"><a href="course.jsp">我的课表</a></li>
        <li><a href="plan.jsp">我的计划</a></li>
        <li><a href="study.jsp">学习园地</a></li>
        <li><a href="register.jsp">注册</a></li>
      </ul>
      <div class="clr"></div>
    </div>
  </div>
</div>
</body>
</html>