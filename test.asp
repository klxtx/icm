
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title><%=sysConfig%></title>
<link href="images/main.css" rel="stylesheet" type="text/css">
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td  bgcolor="#FFFFFF"><br>
	<table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
	  <tr align="center" bgcolor="#F2FDFF">
        <td class="optiontitle" colspan="4">系统检测</td>	
      </tr>
      <tr bgcolor="#FFFFFF">
        <td>后台操作管理员：</td>
        <td colspan="3"><%=session("admin_name")%></td>
      </tr>
      
      <tr bgcolor="#FFFFFF">
        <td>浏览器版本：</td>
        <td colspan="3"><%=Request.ServerVariables("Http_User_Agent")%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td>脚本解释引擎：</td>
        <td><%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
        <td>Jmail邮箱组件支持：</td>
        <td><%If IsObjInstalled("JMail.Message") Then%>
          Jmail4.3邮箱组件支持
            <%elseIf IsObjInstalled("JMail.SMTPMail") then%>
            Jmail4.2组件支持
            <%else%>
            不支持Jmail组件
          <%end if%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td bgcolor="#FFFFFF">FSO组件支持：</td>
        <td>
<%If IsObjInstalled("Scripting.FileSystemObject") then%>FSO支持
<%else%>不支持FSO组件
<%end if%>
<%Function IsObjInstalled(strClassString)
On Error Resume Next
IsObjInstalled = False
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(strClassString)
If 0 = Err Then IsObjInstalled = true
Set xTestObj = Nothing
Err = 0
End Function
%></td>
        <td>CDONTS邮箱组件支持：</td>
        <td><%If IsObjInstalled("CDONTS.NewMail") then%>CDONTS邮箱组件支持
            <%else%>不支持CDONTS邮箱组件<%end if%></td>
      </tr>
    </table>
	<p>
    <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
	  <tr align="center" bgcolor="#F2FDFF">
        <td class="optiontitle" colspan="2">系统信息</td>	
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="100"> 系统名称：</td>
        <td><%=sysConfig%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td > 程序版本：</td>
        <td>V 1.0</td>
      </tr>
      
      <tr bgcolor="#FFFFFF">
        <td> 程序开发：</td>
        <td>金龙</td>
      </tr>
     
     
    </table>
	</td>
  </tr>
</table>
</body>
</html>