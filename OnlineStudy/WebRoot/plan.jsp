<%@ page language="java" import="java.util.*,com.onlineStudy.entity.*,com.onlineStudy.dao.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("pageURL","plan.jsp");
String finish = "";
if(session.getAttribute("finish")!=null)
	finish = session.getAttribute("finish").toString();
int msg = 0, show = -1;
if(session.getAttribute("re")!=null)
	msg = Integer.parseInt(session.getAttribute("re").toString());
if(session.getAttribute("show")!=null)
	show = Integer.parseInt(session.getAttribute("show").toString());
%>
<jsp:useBean id="daoUser" class="com.onlineStudy.dao.UserDao"></jsp:useBean>
<jsp:useBean id="daoPlan" class="com.onlineStudy.dao.PlanDao"></jsp:useBean>
<jsp:useBean id="daoDate" class="com.onlineStudy.dao.DateDao"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ѧ������ѧҵ����ϵͳ</title>
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
<!-- CuFon ends -->
</head>
<body onload="addOptions(<%=finish%>);showTips();start(<%=msg%>,<%=show%>)">
<div class="main">
  <div id="alert_win" style="display:none">
	<div id="mask" style="top:0;left:0;position: absolute;z-index:1000;" class="bg"></div>
	<div class=beian_winBG id=beian_popup><!--������-->
		<div id="divOneStep" style="z-index:1002;width:100%;height:200px;background: #fff;position:absolute;">
			<div id=mainText><a href="javascript:;" onClick="showScroll();<%session.setAttribute("finish",-1);%>"><span style="color:#000;font-size:20pt;margin-right:5pt;text-decoration:none;">��</span></a>&nbsp;</div>
			<div>
			<%
			if(session.getAttribute("pType")!=null){
				int pType = Integer.parseInt(session.getAttribute("pType").toString());
				if(pType==1){%>
					<center><h3>��ϲ�����һ����ϰ�ƻ������10���֣�</h3><br/>
					<img src="images/coin1.jpg" style="width:120px;height:50px;"/>
					</center>
				<%}else{%>
					<center><h3>��ϲ�����һ������������20���֣�</h3>
					<img src="images/coin2.jpg" style="width:120px;height:50px;"/>
					</center>
				<%}%>
			<%}else{%>
				<script>alert_win.style.display="none";</script>
			<%}%>
			</div>
		</div>
		<div style="z-index:1001;position:absolute;"><iframe id="frmOneStep" width="100%" height="100%" frameborder="0" scrolling="no" src="about:blank"></iframe></div>
	</div>
  </div>
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
         <ul>
          <li><a href="index.jsp">��ҳ</a></li>
          <li><a href="course.jsp">�ҵĿα�</a></li>
          <li  class="active"><a href="plan.jsp">�ҵļƻ�</a></li>
          <li><a href="study.jsp">ѧϰ԰��</a></li>
          <li><a href="register.jsp">ע ��</a></li>
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
          <h2>���ռƻ�</h2><div class="clr"></div>
          <%
          	if(session.getAttribute("log")==null){
          %>
          	  <p><strong>���ȵ�¼</strong></p>
          <%}else{
          		String u_id = session.getAttribute("log").toString();
          		session.setAttribute("show",null);
          		session.setAttribute("re",null);
          		List<Plan> listP = daoPlan.getAll(u_id,daoDate.getCurrentDate(),1);
          		if(listP.size()>0){%>
	          	<table class="sb_menu" border="1">
		            <tr>
		            	<th>����</th>
		            	<th>���</th>
		            	<th>����</th>
		            	<th>��ʼʱ��</th>
		            	<th>���ʱ��</th>
		            	<th>��ɽ���</th>
		            	<th>����</th>
		            </tr>
		            <%for(int i=0;i<listP.size();i++){
		            	Plan p = listP.get(i);
		            %>
		            	<tr style="text-align:center;">
		            		<td width="120pt"><%=p.getP_name() %></td>
		            		<td width="60pt"><%=p.getP_type()==1?"��ϰ�ƻ�":"��������" %></td>
		            		<td width="180pt"><%=p.getP_content() %></td>
		            		<td width="60pt"><%=p.getP_sTime() %></td>
		            		<td width="60pt"><%=p.getP_eTime() %></td>
		            		<td width="60pt"><input type="text" style="width:20pt" value="<%=p.getP_finished()%>" onchange="if(window.confirm('ȷ��Ҫ�޸ģ�')){location='plan?action=2&p_id=<%=p.getP_id()%>&p_finished='+this.value;}"/>%</td>
		            		<td width="40pt"><a style="cursor:pointer;" onclick="if(window.confirm('ȷ��Ҫɾ������ƻ���')){location='plan?action=1&p_id=<%=p.getP_id()%>'}"><img src="images/del.jpg" alt="ɾ��" width="20pt" height="20pt"/></a></td>
		            	</tr>
		            <%}%>
	          		</table>
	          	<%}else{%>
	          		<p><strong>�Ͻ��ƶ�����ļƻ���</strong></p>
	          	<%}%>
	          	 <h2>��ʷδ�������</h2><div class="clr"></div>
	          	<%
	          		List<Plan> listF = daoPlan.getAll(u_id,daoDate.getCurrentDate(),4);
	          		if(listF.size()>0){%>
	          		<table class="sb_menu" border="1">
		            <tr>
		            	<th>����</th>
		            	<th>���</th>
		            	<th>����</th>
		            	<th>����</th>
		            	<th>��ɽ���</th>
		            </tr>
		            <%for(int i=0;i<listF.size();i++){
		            	Plan p = listF.get(i);
		            %>
		            	<tr style="text-align:center;">
		            		<td width="120pt"><%=p.getP_name() %></td>
		            		<td width="60pt"><%=p.getP_type()==1?"��ϰ�ƻ�":"��������" %></td>
		            		<td width="200pt"><%=p.getP_content() %></td>
		            		<td width="110pt"><%=p.getP_date()%></td>
		            			<td width="60pt"><input type="text" style="width:20pt" value="<%=p.getP_finished()%>" onchange="if(window.confirm('ȷ��Ҫ�޸ģ�')){location='plan?action=2&p_id=<%=p.getP_id()%>&p_finished='+this.value;}"/>%</td>
		            	</tr>
		            <%}%>
	          		</table>
	          		<%}else{%>
	          			<p><strong>��ϲ��������һ���������е��ˣ��ٽ�������</strong></p>
	          		<%}%>
	          		<h2>�ƶ��ƻ�</h2><div class="clr"></div>
	          		<form method="post" action="plan" name="planForm">
	          		<table>
	          			<tr><td width="400pt"><label>���⣺</label><input name="p_name" style="width:200pt;"/></td></tr>
	          			<tr><td><label>���ͣ�</label><select name="p_type">
	          				<option value="1">��ϰ�ƻ�</option>
	          				<option value="2">��������</option>
	          			</select></td></tr>
	          			<tr><td width="400pt"><label>���ݣ�</label><textarea name="p_content" style="width:200pt"  row="6"/></textarea></td></tr>
	          			<tr><td><label>��ʼʱ�䣺</label><select id="p_sTime" name="p_sTime" onchange="changeTime()"><option value="00:00" selected>00:00</option></select></td></tr>
	          			<tr><td><label>����ʱ�䣺</label><select id="p_eTime" name="p_eTime"><option value="00:00">00:00</option></select></td></tr>
	          			<tr><td width="400pt"><label>��ע��</label><textarea name="p_note" style="width:200pt" row="3"></textarea></td></tr>
	          			<tr><td><input type="button" style="height:20pt;" value="�� ��" onclick="checkPlan()"/>
	          		</table></td></tr>
	          		</form>
          <%}%>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <%
        	if(session.getAttribute("log")==null){
         %>
          <form name="logForm" method="post" action="log">
          	<h2 class="star">��¼</h2><div class="clr"></div>
          	<ul class="sb_menu">
            	<li><input type="text" name="u_id" style="width:162pt;height:15pt"/></li>
            	<li><input type="password" name="u_pwd" style="width:162pt;height:15pt"/></li>
            	<li><span style="float:left"><input type="submit" style="height:20pt" value="��  ¼"/></span>
            	<span style="float:right;margin-right:18pt"><input style="height:20pt" type="reset" value="��  ��"/></span></li>
            	<li><br /></li>
          	</ul>
          </form>
          <%}else{
          		String u_id = session.getAttribute("log").toString();
          		User u = daoUser.getInfo(u_id);
        
          		String u_photo = "";
          		if((u.getU_sex()).compareTo("��")==3)
          			u_photo = "images/boy.jpg";
          		else
          			u_photo = "images/girl.jpg";
          %>
          <h2 class="star">������Ϣ</h2><div class="clr"></div>
          <ul class="sb_menu">
          	<li><img src="<%=u_photo%>"/></li>
            <li><strong>������</strong><%=u.getU_name() %></li>
            <li><strong>�Ա�</strong>��<%=u.getU_sex() %></li>
            <li><strong>����</strong>��<%=u.getU_point()%></li>
            <li><strong>ѧϰʱ�䣺</strong><%=u.getU_studyTime() %>Сʱ</li>
            <li><strong>����ǩ����</strong><%=u.getU_signature() %></li>
            <li><strong>��¼ʱ�䣺</strong><%=u.getU_lastLogTime() %></li>
            <li><span style="float:right"><a style="cursor:pointer;" onclick="if(window.confirm('��ȷ��Ҫע����')){location='log';}"><strong>>>ע��</strong></a></span></li>
          </ul>
          <%}%>
        </div>
        <div class="gadget">
         <h2 class="star"><span>��վ����</span></h2><div class="clr"></div>
          <%
          List<User> listU = daoUser.getUserRank();
          if(listU!=null){%>
          <table style="border:1px solid #CCC;width:100%">
          <tr style="background-color:#CCC">
          	<th>����</th>
          	<th>����</th>
          	<th>ѧϰʱ��</th>
          </tr>
          <%for(int i=0;i<listU.size();i++){
          	User u = listU.get(i);
          %>
          	<tr style="text-align:center;">
          		<td width=33%><%=u.getU_name()%></td>
          		<td width=33%><%=u.getU_point() %></td>
          		<td><%=u.getU_studyTime()%>Сʱ</td>
          	</tr>
          <%}%>
          </table>
          <%}else{%>
          	<p>Ŀǰ�����û�</p>
          <%}%>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <ul class="fmenu">
        <li><a href="index.jsp">��ҳ</a></li>
        <li><a href="course.jsp">�ҵĿα�</a></li>
        <li class="active"><a href="plan.jsp">�ҵļƻ�</a></li>
        <li><a href="study.jsp">ѧϰ԰��</a></li>
        <li><a href="register.jsp">ע��</a></li>
      </ul>
      <div class="clr"></div>
    </div>
  </div>
</div>
</body>
</html>