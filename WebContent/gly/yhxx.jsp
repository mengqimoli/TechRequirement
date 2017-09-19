
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.jee.common.Database"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>河北省重大技术需求征集系统</title>
<script type="text/javascript" src="js/jquery-1.4.js"></script>
<style type="text/css">
.btn {
	font-size: 15px;
	height: 30px;
	background-color: DeepSkyBlue;
	color: white;
	position: relative;
	top: 30px;
	left: 50px;
}

.grey {
	background-color: SkyBlue;
}

table {
	border-collapse: collapse;
	margin: 0 auto;
	width: 1000px;
}

table, th, td {
	border: 0px solid black;
}

td {
	text-align: left;
	height: 30px;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<%
	Database db = new Database();

	String UserName = "";
	String UserTrue = "";
	String UserID = "";
	String UserPhone = "";
	String UserEmail = "";
	String OrgNum = "";
	String OrgName = "";
	String OrgZip = "";
	String juese = "";
	
	UserName = request.getParameter("UserName");//*******************获得UserNaem
	
	String strSql = "";
	strSql = "select * from UserTable where UserName = '"+UserName+"'";
	ResultSet rs = db.executeQuery(strSql);
	while(rs.next())
	{
		UserTrue = rs.getString("UserTrue");
		UserID = rs.getString("UserID");
		UserPhone = rs.getString("UserPhone");
		UserEmail = rs.getString("UserEmail");
		OrgNum = rs.getString("OrgNum");
		OrgName = rs.getString("OrgName");
		OrgZip = rs.getString("OrgZip");
		juese = rs.getString("juese");
	}
%>
	<br />
	<!--用户信息 -->
	<table>
		<tr>
			<td colspan="2" class="grey">角色信息</td>
		</tr>
		<tr>
			<td>用户角色：</td>
			<td><%=juese %></td>
		</tr>
		<tr>
			<td colspan="2" class="grey">用户信息</td>
		</tr>
		<tr>
			<td width="8%">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</td>
			<td><%=UserName %></td>
		</tr>
		<tr>
			<td>真实姓名：</td>
			<td><%=UserTrue %></td>
		</tr>
		<tr>
			<td>身份证号：</td>
			<td><%=UserID %></td>
		</tr>
		<tr>
			<td>电子邮箱：</td>
			<td><%=UserEmail %></td>
		</tr>
		<tr>
			<td>手机号码：</td>
			<td><%=UserPhone %></td>
		</tr>
		<!--公司信息-->
		<tr>
			<td colspan="2" class="grey">公司信息</td>
		</tr>
		<tr>
			<td>机构代码：</td>
			<td><%=OrgNum %></td>
		</tr>
		<tr>
			<td>机构名称：</td>
			<td><%=OrgName %></td>
		</tr>
		<tr>
			<td>邮政编码：</td>
			<td><%=OrgZip %></td>
		</tr>
		<tr>
			<td></td>
			<td><a href="javascript:history.back(-1)" target="_self"> <input
					type="submit" name="submit" value="返回" class="btn" />
			</a></td>
		</tr>
	</table>
</body>
</html>