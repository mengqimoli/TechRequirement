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
<!-- 回车换行 -->
<script language="javascript" for="document" event="onkeydown">

if(event.keyCode==13 && event.srcElement.type!='button' && event.srcElement.type!='submit' && event.srcElement.type!='reset' && event.srcElement.type!='textarea' && event.srcElement.type!='')

event.keyCode=9; //Tab的键值为9 Enter的键值为13

</script>
<script language="JavaScript">
	function CheckCode(s) //有特殊字符为true  
	{
		var containSpecial = RegExp(/[(\ )(\~)(\!)(\#)(\$)(\%)(\^)(\&)(\*)(\()(\))(\-)(\_)(\+)(\=)(\[)(\])(\{)(\})(\|)(\\)(\;)(\:)(\')(\")(\,)(\.)(\/)(\<)(\>)(\?)(\)]+/);
		return (containSpecial.test(s));
	}
	function Check1()
	{
		var reg = /^[0-9a-zA-Z]+$/;
		var UserName = document.getElementById("UserName").value;
		var UserPsd = document.getElementById("UserPsd").value;
		var UserPsd1 = document.getElementById("UserPsd1").value;
		if (UserName.length > 20 || UserName.length < 6 || !reg.test(UserName)) 
		{
			alert("用户名只能由6-20个数字和英文字母组成");
			return false;
		} 
		else if (UserPsd.length > 20 || UserPsd.length < 6) 
		{
			alert("密码小于6位或大于20位");
			return false;
		}
		else if(UserPsd!=UserPsd1||UserPsd1=="")
		{
			alert("两次输入的密码不一致");
			document.getElementById("UserPsd").value = "";
			document.getElementById("UserPsd1").value = "";
			document.getElementById("UserPsd").focus();
			return false;
		}
		else if (CheckCode(UserName) && CheckCode(UserName)) 
		{
			alert("有特殊字符请重新填写！");
			document.getElementById("UserName").value = "";
			document.getElementById("UserPsd").value = "";
			document.getElementById("UserPsd1").value = "";
			document.getElementById("UserPsd1").focus();
			return false;
		}
		else
		{
			document.getElementById("Registerform").submit(); 
		}
	}
	function xzglcs(){
		var select = document.getElementById("js");
		var index = select.selectedIndex ;   
		var jueselx = select.options[index].text;
		if(jueselx == "部门审核员"){
			document.getElementById("w1").style.display = "table-row"; 
		}else{
			document.getElementById("w1").style.display = "none"; 
		}
	}
</script>
<style type="text/css">
.btn {
	font-size: 18px;
	background-color: DeepSkyBlue;
	color: white;
	"
}

.grey {
	background-color: SkyBlue;
}

div {
	text-align: center;
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
	height: 35px;
}

span {
	color: red;
	font-size: 12px;
}

.xing {
	position: relative;
	bottom: -2px;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<br />
	<form action="tjyhServlet" id="Registerform" name="Registerform"
		method="post" target="_self">
		<table>
			<!--用户名和密码 -->
			<tr class="grey">
				<td colspan="3">角色信息 <span
					style="color: red; font-size: 17px;">${msg}</span>
				</td>
			</tr>
			<tr>
				<td width="10%">用户角色：</td>
				<td style="width: 220px;"><select name="js" id="js"
					style="width: 200px;" onchange="xzglcs()">
						<option value=""></option>
						<%
						Database db = new Database();
						String sql1="select * from JueSe";
						ResultSet rs1=db.executeQuery(sql1);
						while(rs1.next()){
						out.println("<option value="+rs1.getString(1)+">"+rs1.getString(1)+"</option>");
						}
						rs1.close();
					%>
				</select> <span class="xing">*</span></td>
				<td><span>选择用户所拥有的角色的权限</span></td>
			</tr>
			<tr id="w1" style="display: none">
				<td>管理处室：</td>
				<td><select id="glcs" name="glcs" style="width: 200px;">
						<option value=""></option>
						<%
						String sql2="select * from GLCS";
						ResultSet rs2=db.executeQuery(sql2);
						while(rs2.next()){
						out.println("<option value="+rs2.getString(2)+">"+rs2.getString(2)+"</option>");
						}
						rs2.close();
					%>
				</select> <span class="xing">*</span></td>
				<td><span>选择部门审核所属的管理处室</span></td>
			</tr>
			<tr class="grey">
				<td style="width: 140px;" colspan="3">用户名和密码</td>
			</tr>
			<tr>
				<td>用&nbsp;&nbsp;户&nbsp;&nbsp;名：</td>
				<td><input type="text" id="UserName" name="UserName"
					style="width: 200px" /> <span class="xing">*</span></td>
				<td><span>用户名不包括~，*/等特殊符号&nbsp;&nbsp;&nbsp;&nbsp;(用于登录)</span>
				</td>
			</tr>
			<tr>
				<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
				<td><input type="password" id="UserPsd" name="UserPsd"
					style="width: 200px" /> <span class="xing">*</span></td>
				<td><span>请输入6-20位的字母和数字</span></td>
			</tr>
			<tr>
				<td>确认密码：</td>
				<td><input type="password" id="UserPsd1" name="UserPsd1"
					style="width: 200px" /> <span class="xing">*</span></td>
				<td><span>两次输入的密码必须一致</span></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="submit" value="添加" class="btn"
					onclick="return Check1()" /> <a href="javascript:history.back(-1)"
					target="_self"><input type="button" name="button" value="返回"
						class="btn" /></a></td>
				<td></td>
			</tr>
		</table>
	</form>
</body>
</html>