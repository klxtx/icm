

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>修改密码</title>
    <link rel="stylesheet" href="css/login.css"/>
</head>
<body>
<!--#include file="conn/l.asp"-->
<%
aaa=request.form("password2")
if request.form("name")<>"" then
	set rs=server.CreateObject("adodb.recordset")
	rs.open "select * from [userwap] where gonghao='" & request.form("name") & "' ",conn,3,3
	if rs.bof or rs.eof then 
		response.write "<script>alert('无此用户');history.go(-1);</script>"
	else
		if request.form("password")= rs("password") then 
		rs("password")=trim(request.form("password2"))
		rs.update
		response.redirect "my.asp"
		else
		response.write "<script>alert('密码错误');history.go(-1);</script>"
		end if
	end if
			rs.close
		set rs=nothing	

end if

%>

    <div id="login"></div>
    <div class="login_bg">
        <div id="logo">
            <img src="pic/logo.jpg" alt=""/>
        </div>
        <form action="" method="post">
            <div class="userName">
                <lable>工&nbsp;&nbsp;&nbsp;号：</lable>
                <input type="text" name="name" placeholder="请输入6位工号" value="<%=session("wapgh")%>" readonly  pattern="[0-9A-Za-z]{6,16}" required/>
            </div>
            <div class="passWord">
                <lable>密&nbsp;&nbsp;&nbsp;码：</lable>
                <input type="password" name="password" placeholder="仅支持数字、大小写字母，6-25位" value="<%=session("wappassword")%>"  pattern="[0-9A-Za-z]{6,25}" required/>
            </div>
			 <div class="passWord">
                <lable>新密码：</lable>
                <input type="password" name="password2" placeholder="仅支持数字、大小写字母，6-25位" pattern="[0-9A-Za-z]{6,25}" required/>
            </div>
            
            <button class="login_btn" type="submit">修&nbsp;&nbsp;改</button>
        </form>
        
    </div>



</body>
</html>