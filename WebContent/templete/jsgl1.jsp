<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.jee.common.Database"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	request.setCharacterEncoding("utf-8");
	Database db = new Database();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>河北省重大技术需求征集系统</title>
<!--框架必需start-->
<script type="text/javascript" src="../js/jquery-1.4.js">
</script>
<script type="text/javascript" src="../js/framework.js">
</script>
<link href="../css/import_basic.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" id="skin" />
<!--框架必需end-->
<script type="text/javascript" src="../js/nav/ddaccordion.js">
</script>
<script type="text/javascript" src="../js/text/text-overflow.js">
</script>
<script type="text/javascript">
$(document).ready(function(){
	$(".gaibian").change(function(){
	alert(1);
	//var juese1 = $(this).val();
		/* $
				.ajax({
					url : "../jsglxlServlet?js="+juese1,
					type : "post",
					dataType : "json",
					success : function(data) { 
						alert(data.xqzj);
						if(data.xqzj == 1){
							$("[name='xqzjqx']").attr("checked",'true');
						}
					}
				}); */

	})
})
</script>
<script type="text/javascript">
	function juese0(){
		var shqx = document.getElementById("shqx");
		var xsshqx = document.getElementById("xsshqx");
		var bmshqx = document.getElementById("bmshqx");
		var tjcxqx = document.getElementById("tjcxqx");
		xsshqx.checked = shqx.checked;
		bmshqx.checked = shqx.checked;
		tjcxqx.checked = shqx.checked;
	}
	function juese1(){
		var btqx = document.getElementById("btqx");
		var xqzjqx = document.getElementById("xqzjqx");
		var xqglqx = document.getElementById("xqglqx");
		var yhxxqx = document.getElementById("yhxxqx");
		var xgmmqx = document.getElementById("xgmmqx");
		xqzjqx.checked = btqx.checked ;
		xqglqx.checked = btqx.checked ;
		yhxxqx.checked = btqx.checked ;
		xgmmqx.checked = btqx.checked ;
	}
	function Check1()
	{
		var juese = document.getElementById("juese"); 
		if(juese.value == ""){
			alert("请选择角色");
			return false;
		}
		else{
			return true;
		}
	}
	function scjs(){
		var sure = confirm("　　　确认要删除?\n\n将删除与该角色相关的用户");
		var jueseqwer = document.getElementById("juese").value; 
		var url = "scjsServlet?yhjuese123=" + jueseqwer;
		if(juese == ""){
			alert("请选择角色");
		}else if(sure == true){
			window.location.href = url;
		}
	}
	function ckqx(){
		var jueseqwer = document.getElementById("juese").value; 
		var url = "templete/jsgl1.jsp?yhjuese123=" + jueseqwer;
		if(jueseqwer == ""){
			alert("请选择角色");
			return false;
		}else{
			window.location.href = url;
		}
	}
</script>

<style type="text/css">
table {
	border-collapse: collapse;
	margin: 0 auto;
	width: 1100px;
}

table, th, td {
	border: 1px solid white;
}

td {
	text-align: center;
	height: 30px;
}

.btn {
	font-size: 15px;
	background-color: DeepSkyBlue;
	color: white;
}

a {
	text-decoration: none;
	color: MediumBlue;
}

span {
	font-size: 16px;
	color: white;
}

div {
	font-size: 15px;
	color: black;
}
</style>
</head>
<body>
	<%
	String quanxian = "";
	String juese = "";
	String sql = "";
	juese = request.getParameter("yhjuese123");
	if(juese != null && juese != ""){
		juese = new String(juese.getBytes("ISO-8859-1"),"utf-8");
		sql = "select * from JueSe where juese = '"+juese+"'";
		ResultSet rs = db.executeQuery(sql);
		rs.next();
		if(rs.getInt("tjcx") == 1){
			quanxian += "统计查询　";
		}
		if(rs.getInt("bmsh") == 1){
			quanxian += "部门审核　";
		}
		if(rs.getInt("xssh") == 1){
			quanxian += "形式审核　";
		}
		if(rs.getInt("yhxg") == 1){
			quanxian += "用户修改　";
		}
		if(rs.getInt("yhxx") == 1){
			quanxian += "用户信息　";
		}
		if(rs.getInt("xqgl") == 1){
			quanxian += "需求管理　";
		}
		if(rs.getInt("xqzj") == 1){
			quanxian += "需求征集　";
		}
	}
%>
	<form action="jsglServlet" method="post" name="jsglForm" id="jsglForm">
		<br />
		<div style="font-size: 25px; text-align: center;">角色管理</div>
		<div style="text-align: center;">
			<a href="gly/tjjs.jsp" target="_self"> <input type="button"
				name="btnxzjs" value="新增角色" class="btn" />
			</a>
		</div>
		<br />
		<div style="text-align: center;">
			请选择角色: <select class="gaibian" name="juese" id="juese"
				style="width: 200px;">
				<option value="<%=juese %>"><%=juese %></option>
				<%
					String sql1="select * from JueSe where juese != '管理员'";
					ResultSet rs1=db.executeQuery(sql1);
					while(rs1.next()){
					out.println("<option value="+rs1.getString(1)+">"+rs1.getString(1)+"</option>");
					}
					rs1.close();
				%>
			</select> <input type="button" name="ckjsqx" value="查看权限" class="btn"
				onclick="return ckqx()" /> <input type="button" name="btnscjs"
				value="删除" class="btn" onclick="return scjs()" />
		</div>
		<br />
		<div style="text-align: center;"><%=quanxian %></div>
		<table>
			<tr style="background-color: DodgerBlue;">
				<td width="25%" style="border-right-style: none;"><span>权限名称</span>
				</td>
				<td style="border-right-style: none; border-left-style: none;">
					<span style="position: relative; left: -50px;">权限说明</span>
				</td>
				<td style="width: 20%; border-left-style: none;"><span>是否赋予</span>
				</td>
			</tr>
			<tr style="background-color: DodgerBlue;">
				<td colspan="2" style="text-align: left;"><span>审核权限</span></td>
				<td><input type="checkbox" name="shqx" id="shqx"
					onclick="juese0()" /></td>
			</tr>
			<tr style="background-color: white;">
				<td>
					<div>形式审核权限</div>
				</td>
				<td style="text-align: left;">
					<div>可查看用户填报的征集表并进行形式审核,统计查询</div>
				</td>
				<td><input type="checkbox" name="xsshqx" id="xsshqx" value="1" />
				</td>
			</tr>
			<tr style="background-color: white;">
				<td>
					<div>部门审核权限</div>
				</td>
				<td style="text-align: left;">
					<div>可查看用户填报的征集表并进行相应部门的审核,统计查询</div>
				</td>
				<td><input type="checkbox" name="bmshqx" id="bmshqx" value="1" />
				</td>
			</tr>
			<tr style="background-color: white;">
				<td>
					<div>统计查询</div>
				</td>
				<td style="text-align: left;">
					<div>用户可以按条件查询统计征集表</div>
				</td>
				<td><input type="checkbox" name="tjcxqx" id="tjcxqx" value="1" />
				</td>
			</tr>
			<tr style="background-color: DodgerBlue;">
				<td colspan="2" style="text-align: left;"><span>普通权限</span></td>
				<td><input type="checkbox" name="btqx" id="btqx" id="btqx"
					onclick="juese1()" /></td>
			</tr>
			<tr style="background-color: white;">
				<td>
					<div>需求征集</div>
				</td>
				<td style="text-align: left;">
					<div>可填写,保存并提交征集表</div>
				</td>
				<td><input type="checkbox" name="xqzjqx" id="xqzjqx" value="1" />
				</td>
			</tr>
			<tr style="background-color: white;">
				<td>
					<div>需求管理</div>
				</td>
				<td style="text-align: left;">
					<div>可查看自己机构所填的征集表以及状态</div>
				</td>
				<td><input type="checkbox" name="xqglqx" id="xqglqx" value="1" />
				</td>
			</tr>
			<tr style="background-color: white;">
				<td>
					<div>用户信息</div>
				</td>
				<td style="text-align: left;">
					<div>可查看自己的相关信息,并且进行修改</div>
				</td>
				<td><input type="checkbox" name="yhxxqx" id="yhxxqx" value="1" />
				</td>
			</tr>
			<tr style="background-color: white;">
				<td>
					<div>修改密码</div>
				</td>
				<td style="text-align: left;">
					<div>用户可修改自己并符合规则的密码</div>
				</td>
				<td><input type="checkbox" name="xgmmqx" id="xgmmqx" value="1" />
				</td>
			</tr>
		</table>
		<br />
		<div style="text-align: center;">
			<input type="submit" name="submit" value="保存" class="btn"
				onclick="return Check1()" />
		</div>
	</form>
</body>
</html>