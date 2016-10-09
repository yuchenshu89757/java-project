function CheckCourse(courseForm){
	c_id = document.courseForm.c_id.value;
	c_name = document.courseForm.c_name.value;
	c_room = document.courseForm.c_room.value;
	c_week = document.courseForm.c_week.value;
	c_teacher = document.courseForm.c_teacher.value;
	c_time = document.courseForm.c_time.value;
	if(c_id==""||c_name==""||c_room==""||c_week==""||c_teacher==""||c_time=="")
		alert("请将课程信息填写完整");
	else
		document.courseForm.submit();
}	
function checkTime(sTime,eTime){
	var s_Hour = parseInt(sTime.substring(0,2));
	var s_Minu = parseInt(sTime.substring(3,5));
	var e_Hour = parseInt(eTime.substring(0,2));
	var e_Minu = parseInt(eTime.substring(3,5));
	if(s_Hour > e_Hour)
		return false;
	else if(s_Hour == e_Hour){
		if(s_Minu >= e_Minu)
			return false;
	}
	return true;
}
function checkPlan(){
	var p_name = document.planForm.p_name.value;
	var p_content = document.planForm.p_content.value;
	var p_sTime = document.planForm.p_sTime.value;
	var p_eTime = document.planForm.p_eTime.value;

	if(p_name==""||p_content=="")
		alert("请将计划信息填写完整");
	else if(!checkTime(p_sTime,p_eTime))
		alert("结束时间不能小于开始时间");
	else
		document.planForm.submit();
}
function changeTime(){
	var obj = document.getElementById("p_sTime");
	var _obj = document.getElementById("p_eTime");
	var index = obj.selectedIndex;
	for(var i=0;i<obj.options.length;i++)
		if(i<=index)
			_obj.options[i].disabled = true;
		else
			_obj.options[i].disabled = false;
	_obj.options[index+1].selected = true;
}
function CheckReg(sendForm){
	u_id = document.sendForm.u_id.value;
	u_name = document.sendForm.u_name.value;
	u_pwd = document.sendForm.u_pwd.value;
	u_pwdc = document.sendForm.u_pwdc.value;
	u_signature = document.sendForm.u_signature.value;
	if(u_id==""||u_name==""||u_pwd==""||u_pwdc==""||u_signature=="")
		alert("请将基本信息填写完整");
	else if(u_pwd!=u_pwdc)
		alert("两次密码不一致！");
	else
		document.sendForm.submit();
}
function checkTask(){
	var t_name = document.taskForm.t_name.value;
	var t_content = document.taskForm.t_content.value;
	var t_sDate = document.taskForm.t_sDate.value;
	var t_eDate = document.taskForm.t_eDate.value;
	
	if(t_name==""||t_content==""||t_sDate==""||t_eDate=="")
		alert("请将计划信息填写完整！");
	else if(!checkDate(t_sDate,t_eDate))
		alert("结束日期不能小于起始日期！");
	else
		document.taskForm.submit();
}
function checkDate(sDate,eDate){
	var s_Year = parseInt(sDate.substring(0,4));
	var s_Mon = parseInt(sDate.substring(5,7));
	var s_Day = parseInt(sDate.substring(8,10));
	
	var e_Year = parseInt(eDate.substring(0,4));
	var e_Mon = parseInt(eDate.substring(5,7));
	var e_Day = parseInt(eDate.substring(8,10));
	
	if(s_Year > e_Year)
		return false;
	else if(s_Year == e_Year){
		if(s_Mon > e_Mon)
			return false;
		else if(s_Mon == e_Mon){
			if(s_Day >= e_Day)
				return false;
		}
	}
	return true;
}
function showDivWin(finish){
	if(parseInt(finish)>0){
		document.getElementById("alert_win").style.display = "block";
		document.body.scroll = "no";
	}
}
function addOptions(finish){
	showDivWin(finish);
	addOp("p_sTime");
	addOp("p_eTime");
}
function showScroll(){
	var obj = document.getElementById("alert_win");
	obj.style.display = "none";
	document.body.scroll = "yes";
}
function addOp(currentId){
	var obj = document.getElementById(currentId);
	obj.options.add(new Option("00:30","00:30"));
	obj.options.add(new Option("01:00","01:00"));
	obj.options.add(new Option("01:30","01:30"));
	obj.options.add(new Option("02:00","02:00"));
	obj.options.add(new Option("02:30","02:30"));
	obj.options.add(new Option("03:00","03:00"));
	obj.options.add(new Option("03:30","03:30"));
	obj.options.add(new Option("04:00","04:00"));
	obj.options.add(new Option("04:30","04:30"));
	obj.options.add(new Option("05:00","05:00"));
	obj.options.add(new Option("05:30","05:30"));
	obj.options.add(new Option("06:00","06:00"));
	obj.options.add(new Option("06:30","06:30"));
	obj.options.add(new Option("07:00","07:00"));
	obj.options.add(new Option("07:30","07:30"));
	obj.options.add(new Option("08:00","08:00"));
	obj.options.add(new Option("08:30","08:30"));
	obj.options.add(new Option("09:00","09:00"));
	obj.options.add(new Option("09:30","09:30"));
	obj.options.add(new Option("10:00","10:00"));
	obj.options.add(new Option("10:30","10:30"));
	obj.options.add(new Option("11:00","11:00"));
	obj.options.add(new Option("11:30","11:30"));
	obj.options.add(new Option("12:00","12:00"));
	obj.options.add(new Option("12:30","12:30"));
	obj.options.add(new Option("13:00","13:00"));
	obj.options.add(new Option("13:30","13:30"));
	obj.options.add(new Option("14:00","14:00"));
	obj.options.add(new Option("14:30","14:30"));
	obj.options.add(new Option("15:00","15:00"));
	obj.options.add(new Option("15:30","15:30"));
	obj.options.add(new Option("16:00","16:00"));
	obj.options.add(new Option("16:30","16:30"));
	obj.options.add(new Option("17:00","17:00"));
	obj.options.add(new Option("17:30","17:30"));
	obj.options.add(new Option("18:00","18:00"));
	obj.options.add(new Option("18:30","18:30"));
	obj.options.add(new Option("19:00","19:00"));
	obj.options.add(new Option("19:30","19:30"));
	obj.options.add(new Option("20:00","20:00"));
	obj.options.add(new Option("20:30","20:30"));
	obj.options.add(new Option("21:00","21:00"));
	obj.options.add(new Option("16:30","16:30"));
	obj.options.add(new Option("17:00","17:00"));
	obj.options.add(new Option("17:30","17:30"));
	obj.options.add(new Option("18:00","18:00"));
	obj.options.add(new Option("18:30","18:30"));
	obj.options.add(new Option("19:00","19:00"));
	obj.options.add(new Option("19:30","19:30"));
	obj.options.add(new Option("20:00","20:00"));
	obj.options.add(new Option("20:30","20:30"));
	obj.options.add(new Option("20:00","20:00"));
	obj.options.add(new Option("20:30","20:30"));
	obj.options.add(new Option("21:00","21:00"));
	obj.options.add(new Option("21:30","21:30"));
	obj.options.add(new Option("22:00","22:00"));
	obj.options.add(new Option("22:30","22:30"));
	obj.options.add(new Option("23:00","23:00"));
	obj.options.add(new Option("23:30","23:30"));
}
function showDetail(){
	var obj = document.getElementById("_add");
	var sDate = document.taskForm.t_sDate.value;
	var eDate = document.taskForm.t_eDate.value;
	if(sDate==""||eDate==""){
		alert("日期不能为空！");
		return;
	}
	if(setSelectOptions(sDate,eDate)){
		document.taskForm.detail.value = "";
		obj.style.display = "block";
	}
}
function setSelectOptions(sDate,eDate){
	if(!checkDate(sDate,eDate)){
		alert("结束日期不能小于起始日期！");
		return false;
	}
	var s_Year = parseInt(sDate.substring(0,4));
	var s_Mon = parseInt(sDate.substring(5,7));
	var s_Day = parseInt(sDate.substring(8,10));
	
	var e_Year = parseInt(eDate.substring(0,4));
	var e_Mon = parseInt(eDate.substring(5,7));
	var e_Day = parseInt(eDate.substring(8,10));
	
	if(s_Year != e_Year || s_Mon != e_Mon || (e_Day - s_Day)>7){
		alert("对不起，您不能制定超过7天的学习计划！");
		return false;
	}
	var obj = document.getElementById("_date");
	obj.length = 0;
	var str = sDate.substring(0,8);
	var temp;
	for(var i = s_Day; i <= e_Day; i++){
		temp = str;
		if(i<10)
			temp += "0";
		temp += i;
		obj.options.add(new Option(temp,temp));
	}
	return true;
}
function showText(){
	var _date = document.taskForm._date.value;
	var _content = document.taskForm._content.value;
	if(_date==""||_content==""){
		alert("信息填写不完整");
		return;
	}
	var str = _date + "/" + _content + "\n"; 
	var detail = document.taskForm.detail.value;
	detail += str;
	document.taskForm.detail.value = detail;
	_content = document.taskForm._content.value = "";
	var obj = document.getElementById("detail");
	obj.style.display = "block";
	
}