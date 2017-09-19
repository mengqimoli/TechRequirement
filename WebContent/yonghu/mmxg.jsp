<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		var UserPsd0 = document.getElementById("UserPsd0").value;
		var UserPsd = document.getElementById("UserPsd").value;
		var UserPsd1 = document.getElementById("UserPsd1").value;
		if (UserPsd0.length > 20 || UserPsd0.length < 6) 
		{
			alert("旧密码小于6位或大于20位");
			document.getElementById("UserPsd0").focus();
			return false;
		}
		else if(UserPsd.length > 20 || UserPsd.length < 6)
		{
			alert("密码小于6位或大于20位");
			document.getElementById("UserPsd").focus();
			return false;
		}
		else if(UserPsd!=UserPsd1||UserPsd1=="")
		{
			alert("两次输入的密码不一致，请重新输入！");
			document.getElementById("UserPsd").value="";
			document.getElementById("UserPsd1").value="";
			document.getElementById("UserPsd").focus();
			return false;
		}
		else
		{
			document.getElementById("mmxgform").submit(); 
		}
	}
</script>
<style type="text/css">
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
	height: 33px;
}

span {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body>
	<br />
	<form action="xgmmServlet" id="mmxgform" name="mmxgform" method="post"
		target="_self">
		<table>
			<!--用户名和密码 -->
			<tr class="grey">
				<td style="width: 150px;"><span
					style="color: black; font-size: 17px;">修改密码</span></td>
				<td><span style="color: red; font-size: 17px;">${msg}</span></td>
			</tr>
		</table>
		<table>
			<tr>
				<td style="text-align: left; width: 70px;">
					旧&nbsp;&nbsp;密&nbsp;&nbsp;码：</td>
				<td style="width: 250px"><input type="password" id="UserPsd0"
					name="UserPsd0" style="width: 200px" /> <span
					style="position: relative; bottom: -4px">*</span></td>
				<td><span>请输入旧密码</span></td>
			</tr>
			<tr>
				<td style="text-align: left;">新&nbsp;&nbsp;密&nbsp;&nbsp;码：</td>
				<td style="width: 250px"><input type="password" id="UserPsd"
					name="UserPsd" style="width: 200px" /> <span
					style="position: relative; bottom: -4px">*</span></td>
				<td><span>请输入6-20位的字母和数字</span></td>
			</tr>
			<tr>
				<td style="text-align: left;">确认密码：</td>
				<td style="width: 250px"><input type="password" id="UserPsd1"
					name="UserPsd1" style="width: 200px" /> <span
					style="position: relative; bottom: -4px">*</span></td>
				<td><span>两次输入的密码必须一致</span></td>
			</tr>
			<tr>
				<td></td>
				<td style="text-align: center; height: 70px;"><input
					type="submit" name="submit" value="修改"
					style="font-size: 18px; position: relative; left: -50px; background-color: DeepSkyBlue; color: white;"
					onclick="return Check1()" /></td>
				<td></td>
			</tr>
		</table>
	</form>
</body>
</html>