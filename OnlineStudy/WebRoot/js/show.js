function showTips()
{
       var divTip = document.createElement("div");
       divTip.id="tip";
       divTip.innerHTML="<h2><a href='javascript:void(0)' onclick='start(1,1)'>��</a>��ܰ��ʾ</h2>";
       divTip.style.height='0px';
       divTip.style.bottom='0px';
       divTip.style.position='fixed'; 
       document.body.appendChild(divTip);
}
var handle;
function start(count,show)//����Ϊ�¶��Ÿ���
{
		var flag = parseInt(show);
		if(flag==1){
			var pLen = parseInt(count / 10);
			var tLen = count % 10;
	        var obj = document.getElementById("tip");
	        if(pLen>0)
	        	obj.innerHTML += "<p><a href='javascript:void(0)' onclick='showwin(1)'>����"+pLen+"��ƻ�δ���</a></p>";
	        if(tLen>0)
	        	obj.innerHTML += "<p><a href='javascript:void(0)' onclick='showwin(2)'>����"+tLen+"��ѧϰ����δ���</a></p>";
	        if(pLen==0&&tLen==0)
	        	obj.innerHTML += "<p><font color='#fff'>�ɹ���Դ�ڼƻ�����Ҫ���ʱ�䣬��ȥ�ƶ�����ļƻ��ɣ�</font></p>";
	        obj.innerHTML += "<p><font color='#fff'><center>���ͣ���������ģ�</center></font></p>";
	        if (parseInt(obj.style.height)==0){
	        	obj.style.display="block";
	        	handle = setInterval("changeH('up')",20); //���ø÷��� ����Ϊѭ�����õ�ʱ��
	        }else
	            handle = setInterval("changeH('down')",20) 
		}
}
function changeH(str)//�𲽸ı䴰��ĸ�һ�ε��� �� �ݼ�8px
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
