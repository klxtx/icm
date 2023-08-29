<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/green/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>ICM管理系统</title>
<meta name="keywords" content="ICM管理系统">
<meta name="description" content="ICM管理系统">
</head>
<body style="margin:5px 5px 5px 20px;">
<!--#include file="conn/icm.asp"--><button>
<h1><mark>
<a    href="./ICM管理系统操作说明.pdf">ICM管理系统操作说明</a></mark>
</h1>
</button>
<br>
<a class="c-secondary">以下为待审核，点击数量进入审核</a>

<%
		set rs=server.createobject("adodb.recordset") 
		rs.open "select *  from 室内温度湿度记录表 where 部门='"&Request.Cookies("user")("wapdept")&"' and 流程状态='流程中'",conn,1,3
		if rs.eof or rs.pagecount = 0 then 
			shineiwdjl=0
		else
			shineiwdjl=rs.recordcount
			response.write  "<br>室内温度湿度记录待审核：<a href='spc/shineiwdjl2.asp'>"&shineiwdjl&"</a>"
		end if
		rs.close
		
		rs.open "select *  from 焗炉锡炉烙铁温度记录表 where 部门='"&Request.Cookies("user")("wapdept")&"' and 流程状态='流程中'",conn,1,3
		if rs.eof or rs.pagecount = 0 then 
			xiluluotie=0
		else
			xiluluotie=rs.recordcount
			response.write  "<br>焗炉锡炉烙铁温度记录待审核：<a href='spc/xiluluotie2.asp'>"&xiluluotie&"</a>"
		end if
		rs.close
		rs.open "select *  from 隧道焗炉温度记录表 where 部门='"&Request.Cookies("user")("wapdept")&"' and 流程状态='流程中'",conn,1,3
		if rs.eof or rs.pagecount = 0 then 
			suidaojulu=0
		else
			suidaojulu=rs.recordcount
			response.write  "<br>隧道焗炉温度记录待审核：<a href='\wendu\suidaojulu2.asp'>"&suidaojulu&"</a>"
		end if
		rs.close
		rs.open "select *  from 气焊机温度记录表 where 部门='"&Request.Cookies("user")("wapdept")&"' and 流程状态='流程中'",conn,1,3
		if rs.eof or rs.pagecount = 0 then 
			qihanji=0
		else
			qihanji=rs.recordcount
			response.write  "<br>气焊机温度记录待审核：<a href='\wendu\shuixiji2.asp'>"&qihanji&"</a>"
		end if
		rs.close
		rs.open "select *  from 水洗机温度记录表 where 部门='"&Request.Cookies("user")("wapdept")&"' and 流程状态='流程中'",conn,1,3
		if rs.eof or rs.pagecount = 0 then 
			shuixiji=0
		else
			shuixiji=rs.recordcount
			response.write  "<br>水洗机温度记录待审核：<a href='\wendu\qihanji2.asp'>"&shuixiji&"</a>"
		end if
		rs.close
		xiaoxi=shineiwdjl+xiluluotie+suidaojulu+qihanji+shuixiji
		response.write  "<br>当前共待审核记录："&xiaoxi
response.write  "<br><br>以下每天60秒简报：<br>"	
url="http://www.jin8.top/60s.asp"
Function getHTTPPage(url)
url=cstr(url)
dim Http
set Http=server.createobject("MSXML2.ServerXMLHTTP")
Call Http.setTimeouts(90000,90000,90000,90000)
Http.open "GET",url,false
Http.send()
if Http.readystate<>4 then
exit function
end if
getHTTPPage=replace(replace(bytesToBSTR(Http.responseBody,"utf-8"),"；",";<br>"),"！","！<br>")
set http=nothing
if err.number<>0 then err.Clear
End Function
Function BytesToBstr(body,Cset)
dim objstream
set objstream = Server.CreateObject("adodb.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write body
objstream.Position = 0
objstream.Type = 2
objstream.Charset = Cset
BytesToBstr = objstream.ReadText
objstream.Close
set objstream = nothing
End Function
response.write  getHTTPPage(url)		
	
		%>

</body>
</html>
