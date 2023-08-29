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
<!--#include file="conn/icm.asp"-->

</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"><img class="logo navbar-logo f-l mr-10 " src='pic\logo.jpg'> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="#" >ICM管理系统</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="#">ICM</a>
			<span class="logo navbar-slogan f-l mr-10 hidden-xs">v2023.2</span>
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
				<ul class="cl">
				<% IF instr(session("waprole"),"Z,")>0 THEN
				%>
					<li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onclick="member_add('添加组别','gjgw/addzubie.asp','400','500')"><i class="Hui-iconfont">&#xe60d;</i> 员工组别</a></li>
							<li><a href="javascript:;" onclick="member_add('添加员工','gjgw/addyuangong.asp','400','500')"><i class="Hui-iconfont">&#xe60d;</i> 添加员工</a></li>
							<li><a href="javascript:;" onclick="member_add('员工调动','gjgw/addyuangong2.asp','400','500')"><i class="Hui-iconfont">&#xe60d;</i> 员工调动</a></li>
							
					</ul></li>
					
					<% end if%>
					<li class="navbar-levelone current"><a href="javascript:;">主页</a></li>
					<li class="navbar-levelone"><a href="javascript:;">电子看板</a></li>
					<li class="navbar-levelone"><a href="javascript:;">验货报告</a></li>
					<li class="navbar-levelone"><a href="javascript:;">关键岗位</a></li>
					<li class="navbar-levelone"><a href="javascript:;">TPM</a></li>

				</li>
			</ul>
		</nav>
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li></li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A"><%=session("wapname")%> <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
						<li><a href="javascript:;" onClick="member_add('切换账户','login.asp','400','320')">切换账户</a></li>
						<li><a href="javascript:;" onClick="member_add('修改密码','login2.asp','400','400')">修改密码</a></li>
						<li><a  onClick="custom_close()">退出</a></li>
				</ul>
			</li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="黑色">黑色</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
						<li><a href="javascript:;" data-val="white" title="橙色">白色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<dl>
		<dt><i class="Hui-iconfont">&#xe625;</i> <a data-href="welcome.asp" data-title="主页" href="javascript:void(0)">主页</a></dt>
		</dl>
		<dl id="menu-article">
			
			<dt><i class="Hui-iconfont">&#xe69e;</i> 常用<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="other\weight.asp" data-title="成品重量查询" href="javascript:void(0)">成品重量查询</a></li>
					<li><a data-href="ICM/addffhsdjb.asp" data-title="文件发放回收登记表" href="javascript:void(0)">文件发放回收登记表</a></li>
					
				</ul>
			</dd>
			<dt><i class="Hui-iconfont">&#xe62e;</i> 停工记录<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="other/tggs/addtinggongtotal.asp" data-title="添加记录" href="javascript:void(0)">添加停工记录</a></li>
					<li><a data-href="other/tggs/tinggongmonthp.asp" data-title="停工损失统计表" href="javascript:void(0)">停工损失统计表</a></li>
					<li><a data-href="other/tggs/tinggongquery.asp" data-title="停工损失记录查询" href="javascript:void(0)">停工损失记录查询</a></li>
					
				</ul>
			</dd>
			
			
		</dl>

		<dl id="menu-system">
			
			<dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="user.asp" data-title="添加修改用户权限" href="javascript:void(0)">添加修改用户权限</a></li>

				</ul>
			</dd>
		</dl>
	</div>

	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-aaaaa">
			<dt><i class="Hui-iconfont">&#xe61e;</i> 产量看板<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="kanban/?d=2A" data-title="2A 产量看板" href="javascript:void(0)">2A</a></li>
					
				</ul>
			</dd>
			<dt><i class="Hui-iconfont">&#xe61a;</i> FPY看板<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="kanban/fpy.asp?d=2A" data-title="2A FPY看板" href="javascript:void(0)">2A</a></li>
					
				</ul>
			</dd>
			<dt><i class="Hui-iconfont">&#xe62e;</i> 编辑<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="kanban/addaqts.asp" data-title="记录工伤日期" href="javascript:void(0)">记录工伤日期</a></li>
					<li><a data-href="kanban/kanban2.asp" data-title="FPY看板录入" href="javascript:void(0)">FPY看板录入</a></li>
					<li><a data-href="kanban/kanban4.asp" data-title="FPY看板修改" href="javascript:void(0)">FPY看板修改</a></li>
					
				</ul>
			</dd>
		</dl>
		
	</div>

	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-bbbbb">
			<dt><i class="Hui-iconfont">&#xe616;</i> 验货报告报表<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="yhbg/yhbghz.asp?key=2A&fl=case" data-title="验货报告日报" href="javascript:void(0)">日报</a></li>
					<li><a data-href="yhbg/yhbghzw.asp?key=2A&fl=case" data-title="验货报告周报" href="javascript:void(0)">周报</a></li>
					<li><a data-href="yhbg/yhbghzm.asp?key=2A&fl=case" data-title="验货报告月报" href="javascript:void(0)">月报</a></li>
					<li><a data-href="yhbg/yhbghzfpy.asp?key=2A" data-title="验货报告FPY" href="javascript:void(0)">FPY</a></li>
					<li><a data-href="yhbg/yhbghzfpy2.asp?key=2A" data-title="验货报告FPY明细" href="javascript:void(0)">FPY明细</a></li>
					<li><a data-href="yhbg/fxjldaytoday.asp" data-title="返修记录" href="javascript:void(0)">返修记录</a></li>
				</ul>
			</dd>
			<dt><i class="Hui-iconfont">&#xe616;</i> 验货报告录入<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="yhbg/addyhbg.asp?key=2A&fl=case" data-title="2A数据录入" href="javascript:void(0)">2A数据录入</a></li>
					<li><a data-href="yhbg/addpn.asp" data-title="增删产品" href="javascript:void(0)">增删产品</a></li>
					<li><a data-href="yhbg/addvender.asp" data-title="增删供应商/系列" href="javascript:void(0)">增删供应商/系列</a></li>
					<li><a data-href="gjgw/addlaxian.asp" data-title="添加拉别" href="javascript:void(0)">添加拉别</a></li>	
				</ul>
			</dd>
		</dl>
	</div>

	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-ccccc">
			<dt><i class="Hui-iconfont">&#xe623;</i> 关键岗位查询<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="gjgw/zgzdng.asp" data-title="车间拉线多能工距阵图" href="javascript:void(0)">多能工距阵图</a></li>
					<li><a data-href="gjgw/queryzgz.asp" data-title="资格证历史记录" href="javascript:void(0)">资格证历史记录</a></li>
					<li><a data-href="gjgw/zgz.asp" data-title="有效资格证" href="javascript:void(0)">有效资格证</a></li>
					<li><a data-href="gjgw/gjgwday.asp" data-title="岗位抽查" href="javascript:void(0)">抽查</a></li>
					<li><a data-href="gjgw/gjgwdaytoday.asp" data-title="岗位时间段查询" href="javascript:void(0)">岗位时间段查询</a></li>
					<li><a data-href="gjgw/pxsqdaytoday.asp" data-title="培训申请查询" href="javascript:void(0)">培训申请查询</a></li>
					<li><a data-href="gjgw/cxgjgw.asp" data-title="关键岗位记录查询" href="javascript:void(0)">关键岗位记录查询</a></li>
					<li><a data-href="gjgw/cxgjgwxl.asp" data-title="效率记录查询" href="javascript:void(0)">效率记录查询</a></li>
				</ul>
			</dd>
			<dt><i class="Hui-iconfont">&#xe644;</i> 关键岗位报表<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="gjgw/hzgjgw.asp" data-title="关键岗位分组报表" href="javascript:void(0)">关键岗位分组报表</a></li>
					<li><a data-href="gjgw/hzgjgw2.asp" data-title="关键岗位报表-CI" href="javascript:void(0)">关键岗位报表-CI</a></li>
					<li><a data-href="gjgw/hzgjgwxlng.asp" data-title="录入重复筛选" href="javascript:void(0)">录入重复筛选</a></li>
					<li><a data-href="gjgw/hzgjgwxl.asp?nb=卡线" data-title="卡线效率月报" href="javascript:void(0)">卡线效率月报</a></li>
					<li><a data-href="gjgw/hzgjgwxl.asp?nb=点焊" data-title="点焊效率月报" href="javascript:void(0)">点焊效率月报</a></li>
					<li><a data-href="gjgw/hzgjgwxl.asp?nb=缠线" data-title="缠线效率月报" href="javascript:void(0)">缠线效率月报</a></li>
					<li><a data-href="gjgw/hzgjgwxl.asp?nb=穿线" data-title="穿线效率月报" href="javascript:void(0)">穿线效率月报</a></li>
					<li><a data-href="gjgw/hzgjgwxlzb.asp?nb=卡线" data-title="卡线效率月报" href="javascript:void(0)">卡线效率分组月报</a></li>
				</ul>
			</dd>
			<dt><i class="Hui-iconfont">&#xe607;</i> 关键岗位录入<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="gjgw/addgjgw.asp" data-title="关键岗位记录表" href="javascript:void(0)">关键岗位记录表</a></li>
					<li><a data-href="gjgw/addgjgwxiaoli.asp" data-title="卡线效率记录表" href="javascript:void(0)">卡线效率记录表</a></li>
					<li><a data-href="gjgw/addgjgwxiaoli2.asp" data-title="点焊效率记录表" href="javascript:void(0)">点焊效率记录表</a></li>
					<li><a data-href="gjgw/addgjgwxiaoli3.asp" data-title="缠线效率记录表" href="javascript:void(0)">缠线效率记录表</a></li>
					<li><a data-href="gjgw/addgjgwxiaoli4.asp" data-title="穿线效率记录表" href="javascript:void(0)">穿线效率记录表</a></li>
					
				</ul>
			</dd>
			<dt><i class="Hui-iconfont">&#xe607;</i> 员工管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="gjgw/addzubie.asp" data-title="添加组别" href="javascript:void(0)">添加组别</a></li>
					<li><a data-href="gjgw/addyuangong.asp" data-title="添加员工" href="javascript:void(0)">添加员工</a></li>
					<li><a data-href="gjgw/addyuangong2.asp" data-title="员工调动" href="javascript:void(0)">员工调动</a></li>
					<li><a data-href="gjgw/addxiaoli.asp" data-title="效率设定" href="javascript:void(0)">效率设定</a></li>
					<li><a data-href="gjgw/shgjgw.asp" data-title="确认月记录" href="javascript:void(0)">确认月记录</a></li>
					
				</ul>
			</dd>
		</dl>
		<dl>
			<dt><i class="Hui-iconfont">&#xe61f;</i> <a data-href="gjgw\main.asp" data-title="资格证新增" href="javascript:void(0)">资格证新增</a></dt>
		</dl>
	</div>
	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-ccccc">
			<dt><i class="Hui-iconfont">&#xe709;</i> 待处理事项<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="tpm/genjin.asp?lis=ysq" data-title="待处理过期" href="javascript:void(0)">待处理过期</a></li>
					<li><a data-href="tpm/genjin.asp?lis=gd" data-title="待归档" href="javascript:void(0)">待归档</a></li>
					<li><a data-href="tpm/baofei.asp" data-title="待处理报废" href="javascript:void(0)">待处理报废</a></li>
				</ul>
			</dd>
			<dt><i class="Hui-iconfont">&#xe665;</i> 查询<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="tpm/list.asp?lis=kb" data-title="孔板查询" href="javascript:void(0)">孔板查询</a></li>
					<li><a data-href="tpm/list.asp?lis=jjyb" data-title="校机样板查询" href="javascript:void(0)">校机样板查询</a></li>
					<li><a data-href="tpm/list.asp?lis=yqsb" data-title="仪器设备查询" href="javascript:void(0)">仪器设备查询</a></li>
					<li><a data-href="tpm/list.asp?lis=jjb" data-title="剪脚板查询" href="javascript:void(0)">剪脚板查询</a></li>
					<li><a data-href="tpm/list.asp?lis=bfhjj" data-title="波峰焊夹具查询" href="javascript:void(0)">波峰焊夹具查询</a></li>
					<li><a data-href="tpm/list.asp?lis=wj" data-title="文件查询" href="javascript:void(0)">文件查询</a></li>
					<li><a data-href="tpm/list.asp?lis=syjl" data-title="使用记录查询" href="javascript:void(0)">使用记录查询</a></li>
					
				</ul>
			</dd>
			<dt><i class="Hui-iconfont">&#xe62e;</i> 使用登记<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="tpm/use.asp" data-title="登记使用记录" href="javascript:void(0)">登记使用记录</a></li>
					<li><a data-href="tpm/add.asp" data-title="新增" href="javascript:void(0)">新增</a></li>
					<li><a data-href="tpm/sql.asp" data-title="代码修改" href="javascript:void(0)">代码修改</a></li>
				</ul>
			</dd>
		</dl>
	</div>
	


</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="主页" data-href="welcome.asp">主页</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="welcome.asp"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!--_footer 作为公共模版分离出去-->
<!--#include file="_footer.html"-->

<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
$(function(){
	$("body").Huitab({
		tabBar:".navbar-wrapper .navbar-levelone",
		tabCon:".Hui-aside .menu_dropdown",
		className:"current",
		index:0,
	});
});
/*个人信息*/
function myselfinfo(){
	layer.open({
		type: 1,
		area: ['300px','200px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: '查看信息',
		content: '<div><%="<br>权限代码："&session("waprole")&"<br>部门："&session("wapdept")%></div>'
	});
}
/*切换账户*/
function myselfinfo2(){
	layer.open({
		type: 1,
		area: ['300px','200px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: '提示',
		content: '<div><br><br>内网刷新自动登陆，不支持切换用户</div>'
	});
}
/*兼容提示*/
function myselfinfo3(){
	layer.open({
		type: 1,
		area: ['770px','500px'],
		fix: true, //不固定
		maxmin: true,
		shade:0.4,
		title: '兼容提示',
		content: '<div><br>系统因跨域问题需要使用<b>低版本浏览器</b>，否则会不断获取用户：<br>1. IE浏览器正常，IE模式无此提示<br>2. 使用EDGE时在右上角三点那使用IE兼容模式，IE模式无此提示<br>3. 新版谷歌浏览器地址框输入：chrome://flags/#same-site-by-default-cookies 将前两项设为禁止即可正常，如下图：<br><img src=chrome.png></div>'
	});
}
function custom_close(){
	window.opener=null; 
window.location.href="about:blank"; //使用自调用失败，只能采用打开空白页来实现了
//window.close(); 
	}
/*资讯-添加*/
function article_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}


</script>

</body>
</html>
