<%@ page language="java" import="java.util.*,com.onlineStudy.entity.*,com.onlineStudy.dao.*" pageEncoding="GBK"%>
<%
session.setAttribute("pageURL","study.jsp");
String finished = "",msg = "";
int index = 1,show = -1;
if(session.getAttribute("finished")!=null){
	finished = session.getAttribute("finished").toString();
	index = Integer.parseInt(finished);
}
if(session.getAttribute("show")!=null)
	show = Integer.parseInt(session.getAttribute("show").toString());
	
if(session.getAttribute("re")!=null)
	msg = session.getAttribute("re").toString();
%>
<jsp:useBean id="daoUser" class="com.onlineStudy.dao.UserDao"></jsp:useBean>
<jsp:useBean id="daoTask" class="com.onlineStudy.dao.TaskDao"></jsp:useBean>
<jsp:useBean id="daoDate" class="com.onlineStudy.dao.DateDao"></jsp:useBean>
<jsp:useBean id="daoDetail" class="com.onlineStudy.dao.DetailDao"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>学生个人学业管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/open.css" rel="stylesheet" type="text/css" />
<link href="css/show.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/radius.js"></script>
<script type="text/javascript" src="js/check.js"></script>
<script type="text/javascript" src="js/show.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	window.onload = function(){
	var finish = <%=finished%>
	if(parseInt(finish)>0){
		document.getElementById("alert_win").style.display = "block";
		document.body.scroll = "no";
	}
}
</script>
<!-- CuFon ends -->
</head>
<body onload="showTips();start(<%=msg%>,<%=show%>)">
<div class="main">
  <div id="alert_win" style="display:none">
	<div id="mask" style="top:0;left:0;position: absolute;z-index:1000;" class="bg"></div>
	<div class=beian_winBG id=beian_popup><!--弹出框-->
		<div id="divOneStep" style="z-index:1002;width:100%;height:200px;background: #fff;position:absolute;">
			<div id=mainText><a href="javascript:;" onClick="showScroll();<%session.setAttribute("finished",-1);%>"><span style="color:#000;font-size:20pt;margin-right:5pt;text-decoration:none;">×</span></a>&nbsp;</div>
			<div>
				<center>
					<%if(index > 1){%>
						<h3>恭喜你完成本期学习计划，获得<%=index%>0积分！</h3><br/>
					<%}else{%>
						<h3>恭喜你完成一项学习任务，获得<%=index%>0积分！</h3><br/>
					<%}%>
					<img src="images/coin<%=index%>.jpg" style="width:120px;height:50px;"/>
				</center>
			</div>
		</div>
		<div style="z-index:1001;position:absolute;"><iframe id="frmOneStep" width="100%" height="100%" frameborder="0" scrolling="no" src="about:blank"></iframe></div>
	</div>
  </div>
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
         <ul>
          <li><a href="index.jsp">首页</a></li>
          <li><a href="course.jsp">我的课表</a></li>
          <li><a href="plan.jsp">我的计划</a></li>
          <li class="active"><a href="study.jsp">学习园地</a></li>
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
          <h2>本期学习计划</h2><div class="clr"></div>
          <%
          	if(session.getAttribute("log")==null){
          %>
          	  <p><strong>请先登录</strong></p>
          <%}else{
          		session.setAttribute("show",null);
          		session.setAttribute("msg",null);
          		String u_id = session.getAttribute("log").toString();
          		Task t = daoTask.getById(u_id);
          		if(t!=null){
          		List<Detail> listD = daoDetail.getById(t.getT_id(),1);
          		int done = 0;
          		%>
	          	<table class="sb_menu" border="1" width="600pt">
		        	<tr>
		        		<td style="text-align:center">任务主题</td>
		        		<td><%=t.getT_name()%></td>
		        	</tr><tr>
		        		<td style="text-align:center">任务内容</td>
		        		<td><%=t.getT_content()%></td>
		        	</tr><tr>
		        		<td style="text-align:center">起始日期</td>
		        		<td><%=t.getT_sDate()%></td>
		        	</tr><tr>
		        		<td style="text-align:center">结束日期</td>
		        		<td><%=t.getT_eDate()%></td>
		        	</tr><tr>
		        		<td style="text-align:center">任务明细</td>
		        		<td>
		        			<%if(listD.size()>0){%>
		        			<table width="100%">
		        			<tr style="text-align:center">
		        				<th>日期</th>
		        				<th>内容</th>
		        				<th>是否已完成</th>
		        			</tr>
		        			<%
		        				for(int i=0;i<listD.size();i++){
		        				Detail d = listD.get(i);
		        				if(d.getD_finished()==1) ++done;
		        			%>
		        				<tr style="text-align:center">
		        					<td><%=d.getD_date()%></td>
		        					<td><%=d.getD_content() %></td>
		        					<td><input type="checkbox" <%=d.getD_finished()==1?"checked":""%> onclick="location='task?d_id=<%=d.getD_id()%>&len=<%=listD.size()%>'"/></td>
		        				</tr>
		        			<%}%>
		        			</table>
		        			<%}else{%>
		        				<p>你的计划内容空空如也</p>
		        			<%}%>
		        		</td>
		        	</tr><tr>
		        		<td style="text-align:center">完成状态</td>
		        		<td><%=done%>/<%=listD.size()%></td>
		        	</tr>	
	          	</table>
	          	<h2>制定学习计划</h2><div class="clr"></div>
	          	<div id="dd"><p><strong>请先完成当前学习计划</strong></p></div>
	          	<%}else{%>
	          		<p><strong>赶紧制定学习计划吧</strong></p>
	          	<h2>制定学习计划</h2><div class="clr"></div>
	          	<form method="post" action="task" name="taskForm" id=taskForm>
	          	<table>
	          		<tr><td width="400pt"><label>主题：</label><input name="t_name" style="width:200pt;"/></td></tr>
	          		<tr><td width="400pt"><label>内容：</label><textarea name="t_content" style="width:200pt"  row="6"/></textarea></td></tr>
	          		<tr><td><label>开始时间：</label><input name="t_sDate" onclick="WdatePicker()"/></td></tr>
	          		<tr><td><label>结束时间：</label><input name="t_eDate" onclick="WdatePicker()"/></td></tr>
	          		<tr><td width="400pt"><label>备注：</label><textarea name="t_note" style="width:200pt" row="3"></textarea></td></tr>
	          		<tr><td><button onclick="showDetail()">制定明细...</button></td></tr>
	          		<tr id="detail" style="display:none"><td>
	          		<textarea id="detext" name="detail" rows="5" cols="69" value=""></textarea>
					</td></tr>
					<tr id="_add" style="display:none">
						<td><select id="_date" name="_date"></select>
						<input type="text" value="" name="_content" style="width:300pt"/>
						<input type="button" value="添加" onclick="showText()"/></td>
					</tr>
	          		<tr style="line-height:20px;"><td><input type="button" style="height:20pt;" value="提 交" onclick="checkTask()"/></td></tr>
	          	</table>
	          	</form>
	          	<%}%>
          <%}%>
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
        <li class="active"><a href="study.jsp">学习园地</a></li>
        <li><a href="register.jsp">注册</a></li>
      </ul>
      <div class="clr"></div>
    </div>
  </div>
</div>
</body>
</html>