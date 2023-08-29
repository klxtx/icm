<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>ICM管理系统权限设置 </title>
<link rel="stylesheet" href="static/h-ui.admin/css/style.css">

</head>

<div style="font-size: 25px;text-align:center; color: #0073AE;">
<b>权限管理</b>
</div>
<!--#include file="conn/ICM.asp"-->
<%
if instr(session("waprole"),"A,")>0 then
		if request.form("button") & ""<>"" then 
			if request.form("button") & ""="保存" then 
				rolestr=","
				if request.form("checkbox2") & ""<>"" then
				role= split(request.form("checkbox2") & "",",")
				for i=0 to UBound(role)
				rolestr= rolestr & trim(role(i)) & ","
				next
				end if
						conn.execute "update userwap set name='" & replace(request.form("name"),"'","''") &  "',qx='" & rolestr & "',dept='" & replace(ucase(request.form("dept")),"'","''") & "' where gonghao='" & replace(request.form("gonghao"),"'","''")  & "'"
			else 
			if request.form("button") & ""="添加" then 
				set rs=server.CreateObject("adodb.recordset")
				rs.open "select * from userwap where gonghao='" & request.form("gonghao") & "'",conn,3,1
				if rs.recordcount>0 then
				response.Write("<script>alert('已存在的工号!');history.go(-1);</script>")
				response.End() 
				else
				rolestr=","
				if request.form("checkbox2") & ""<>"" then
				role= split(request.form("checkbox2") & "",",")
				for i=0 to UBound(role)
				rolestr= rolestr & trim(role(i)) & ","
				next
				end if
				conn.execute "insert into userwap(gonghao,name,qx,dept,password) values('" & replace(request.form("gonghao"),"'","''") & "','" & replace(request.form("name"),"'","''") & "','" & rolestr & "','" & ucase(replace(request.form("dept"),"'","''")) & "','123456')" 
				end if
				
			else	
			response.redirect "user.asp?gonghao="&replace(request.form("gonghao"),"'","''")
			end if
			end if
		end if
%>
<form id="form1" name="form1" method="post" action="">
<table  border="0" cellspacing="0" cellpadding="0" >
  <tr class="title">
    <td  height="22">序号</td>
    <td  height="22">工号<br>姓名</td>
    <td  height="22">权限</td>
    <td  height="22">部门</td>
    <td >操作</td>

  </tr><%
  if request.querystring("act") & ""="3" then

		if request.querystring("jy") & ""="1" then conn.execute "update userwap set lz=0 where gonghao='" & request.querystring("sc") & "'"
  
  	set rs=server.createobject("adodb.recordset")
	
	rs.open "select * from userwap where  gonghao='" & request.querystring("sc") & "'",conn,3,1

  end if
  %> <tr>
    <td height="22">&nbsp;*</td>
    <td  height="22">
	<input type="text" name="gonghao" id="gonghao" style="width:50px"  <%if request.querystring("act") & ""="3" then%>readonly="readonly"   value="<%=rs("gonghao")%>"<%end if%>/>
	<br><input type="text" name="name" id="name" style="width:50px" <%if request.querystring("act") & ""="3" then%> value="<%=rs("name")%>"<%end if%>/></td>
    <td  height="22" align="center"><span class="STYLE1">.</span></td>
   
    <td  height="22"><input type="text" name="dept" id="dept" style="width:97px" <%if request.querystring("act") & ""="3" then%> value="<%=rs("dept")%>"<%end if%>/></td>
    <td ><input type="submit" name="button" id="button" value="<%if request.querystring("act") & ""="3" then%>保存<%else%>添加<%end if%>"  onclick="return checkSave();" />
	<input type="submit" name="button2" id="button" value="查询"  /></td>

  </tr>
  <tr>
    <td height="25">&nbsp;</td>
    <td height="22" colspan="7" align="left" valign="top"> 
      <%
	set rc=server.createobject("adodb.recordset")
	if  request.QueryString("del")<>"" and request.querystring("act") & ""="4" then  conn.execute "delete  from userwap where gonghao='"&request.QueryString("del")&"'"	
	rc.open "select * from roles where state=1 order by rid",conn,3,1
	for i=1 to rc.recordcount
	%>
      <label>
      <input name="checkbox2" type="checkbox" id="checkbox2" value="<%=rc("rid")%>"  <%
	  if request.querystring("act") & ""="3" then 

	  if instr(rs("qx"),rc("rid") &  ",")>0 then%> checked="checked" <%
	  end if 
	  end if %> />
      <%=rc("rname")%></label>
      <%
	  rc.movenext
	  next
	  %></td>


  </tr>
  <tr>
    <td height="2" bgcolor="#FF9900"></td>
    <td height="2" colspan="7" align="left" valign="top" bgcolor="#FF9900"></td>
    <td height="2" bgcolor="#FF9900"></td>

  </tr>
  <script language="javascript">
			function checkSave()
			{ 
			if(document.getElementById("gonghao").value=="")
			{
			   alert("工号必须填写！");
			   return false;
			}
			if(document.getElementById("name").value=="")
			{
			   alert("姓名必须填写！");
			   return false;
			}
			if(document.getElementById("dept").value=="")
			{
			   alert("部门必须填写！");
			   return false;
			}
			
			return true;
			}
			</script><%
  set rs=server.createobject("adodb.recordset")
  sqlopen="select * from userwap  order by gonghao"
  gonghao=request.form("gonghao")
  if gonghao <>"" then sqlopen="select * from userwap where gonghao='"&gonghao&"'"
 xinm=request.form("name")
 if len(xinm) >1 then sqlopen="select * from userwap where name='"&xinm&"'"
  rs.open sqlopen,conn,3,1
  rs.PageSize=10
							pagecount=rs.PageCount '获取总页码 
							if session("page")="" or session("page")>pagecount then  session("page")=1
							if session("page")<=pagecount then 
							page=session("page") '接收页码 
							if request.querystring("act") & ""="3" then  page=page-1
							if page<=0 then page=1 '判断 
							session("page")=page+1
							rs.AbsolutePage=page '设置本页页码 
							for ii=1 to rs.PageSize
						if rs.bof or rs.eof then exit for
  %>
  <tr>
    <td  height="22">&nbsp;<%=ii%></td>
    <td  height="22">&nbsp;<%=rs("gonghao")%><br><%=rs("name")%></td>
    <td  height="22" title=""><%=rs("qx")%></td>
    <td  height="22">&nbsp;<%=rs("dept")%></td>

    <td ><%=rs("LZ")%><a href="?act=3&sc=<%=rs("gonghao")%>">修改</a>---<a href="?act=3&sc=<%=rs("gonghao")%>&jy=1">禁用</a>---<a href="?act=4&del=<%=rs("gonghao")%>">删除</a></td>

  </tr><%
  rs.movenext
  next
  
  response.write "<tfoot><tr><td colspan='8'>第"&page&"页,共"&pagecount&"页</td></tr></tfoot>"
	conn.close
	set conn=nothing 
	end if
	
  %>
</table>
</form>
<%
else

response.write "非系统管理员"
	end if
	
  %>
</html>