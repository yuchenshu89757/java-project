function showTips()
{
       var divTip = document.createElement("div");
       divTip.id="tip";
       divTip.innerHTML="<h2><a href='javascript:void(0)' onclick='start(1,1)'>×</a>温馨提示</h2>";
       divTip.style.height='0px';
       divTip.style.bottom='0px';
       divTip.style.position='fixed'; 
       document.body.appendChild(divTip);
}
var handle;
function start(count,show)//参数为新短信个数
{
		var flag = parseInt(show);
		if(flag==1){
			var pLen = parseInt(count / 10);
			var tLen = count % 10;
	        var obj = document.getElementById("tip");
	        if(pLen>0)
	        	obj.innerHTML += "<p><a href='javascript:void(0)' onclick='showwin(1)'>您有"+pLen+"项计划未完成</a></p>";
	        if(tLen>0)
	        	obj.innerHTML += "<p><a href='javascript:void(0)' onclick='showwin(2)'>您有"+tLen+"项学习任务未完成</a></p>";
	        if(pLen==0&&tLen==0)
	        	obj.innerHTML += "<p><font color='#fff'>成功来源于计划，不要虚度时间，快去制定今天的计划吧！</font></p>";
	        obj.innerHTML += "<p><font color='#fff'><center>加油，你是最棒的！</center></font></p>";
	        if (parseInt(obj.style.height)==0){
	        	obj.style.display="block";
	        	handle = setInterval("changeH('up')",20); //调用该方法 参数为循环调用的时间
	        }else
	            handle = setInterval("changeH('down')",20) 
		}
}
function changeH(str)//逐步改变窗体的高一次递增 或 递减8px
{
        var obj=document.all?document.all["tip"] : document.getElementById("tip");
        if(str=="up"){
          if (parseInt(obj.style.height)>150)
           clearInterval(handle);
          else
           obj.style.height=(parseInt(obj.style.height)+8).toString()+"px";
        }
        if(str=="down"){
	          if (parseInt(obj.style.height)<8){ 
			       clearInterval(handle);
			       obj.style.display="none";
	          }else  
	        	   obj.style.height=(parseInt(obj.style.height)-8).toString()+"px"; 
        }

}
function showwin(str)
{
    document.getElementsByTagName("html")[0].style.overflow = "hidden";
    start();  
    if(str=="1")
    	location = "plan.jsp";
    else
    	location = "study.jsp";
}    
