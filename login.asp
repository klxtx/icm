<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>员工登陆</title>

    <link rel="stylesheet" href="css/login.css"/>
<%Response.AddHeader "P3P", "CP=CAO PSA OUR"%>	
	
</head>
<body>
<!--#include file="conn/l.asp"-->


<%

Private Function Browsr()
  Browsr = Request.ServerVariables("HTTP_USER_AGENT")
End Function
dim a
a = Browsr
%>

 <form action="" method="post"><INPUT TYPE="hidden" id="123" name="123" >
<SCRIPT LANGUAGE="javascript">
   var device_type = navigator.userAgent;//获取userAgent信息 
   document.getElementById('123').value=device_type
</script> 

<%


if request.Form("name")<>"" then
	set rs=server.CreateObject("adodb.recordset")
	rs.open "select * from userwap where gonghao='" & request.Form("name") & "' ",conn,3,1
	if rs.bof or rs.eof then 
		response.write "<script>alert('工号错误');history.go(-1);</script>"
	else
		if request.Form("password")= rs("password") then 
		session("wapgh")=rs("gonghao")
		session("wapdept")=rs("dept")
		session("wapname")=rs("name")
		session("waprole")=rs("qx")
		conn.execute "insert into logindiary(date,year,own,gonghao,info,week) values(getdate(),'"&year(now())&"','"&trim(rs("name"))&"','"&rs("gonghao")&"','"&request.Form("123")&"','"&weekno&"')" 
		rs.close
		set rs=nothing	
			if request("destination") <> "" then
			response.redirect request("destination")
			else
			response.write "<script>top.location.href='/';</script>"
			end if
		else
		response.write "<script>alert('密码错误');history.go(-1);</script>"
		end if
	end if
end if	
if passWord="" then passWord="123456"
%>

    <div id="login"></div>
    <div class="login_bg">
        <div id="logo">
            <img src="pic/logo.jpg" alt=""/>
        </div>
        <form action="">
            <div class="userName">
                <lable>工&nbsp;&nbsp;&nbsp;号：</lable>
                <input type="text" name="name" placeholder="请输入6位工号" value="<%=session("wapgh")%>"  pattern="[0-9A-Za-z]{5,16}" required/>
            </div>
            <div class="passWord">
                <lable>密&nbsp;&nbsp;&nbsp;码：</lable>
                <input type="password" name="password" placeholder="仅支持数字、大小写字母，6-25位" value="<%=passWord%>" pattern="[0-9A-Za-z]{6,25}" required/>
            </div>
          
			
            <button class="login_btn" type="submit">登&nbsp;&nbsp;录</button>
		
        </form>
     
    </div>



</body>
</html>