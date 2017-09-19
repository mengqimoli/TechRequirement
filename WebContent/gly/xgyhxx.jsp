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
		var UserName = document.getElementById("UserName").value;
		var UserPsd = document.getElementById("UserPsd").value;
		var UserPsd1 = document.getElementById("UserPsd1").value;
		var UserTrue = document.getElementById("UserTrue").value;
		var UserID = document.getElementById("UserID").value;
		var UserEmail = document.getElementById("UserEmail").value;
		var UserPhone = document.getElementById("UserPhone").value;
		var OrgNum = document.getElementById("OrgNum").value;
		var OrgName = document.getElementById("OrgName").value;
		var OrgZip = document.getElementById("OrgZip").value;
		if (UserName.length > 20 || UserName.length < 6) 
		{
			alert("用户名小于6位或大于20位");
			return false;
		} 
		else if (UserPsd.length > 20 || UserPsd.length < 6) 
		{
			alert("密码小于6位或大于20位");
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
		else if(UserTrue.trim()=="")
		{
			alert("真是姓名不能为空!");
			document.getElementById("UserTrue").focus();
			return false;
		}
		else if(UserID.trim()=="")
		{
			alert("身份证不能为空!");
			document.getElementById("UserID").focus();
			return false;
		}
		else if(UserEmail.trim()=="")
		{
			alert("电子邮箱不能为空!");
			document.getElementById("UserEmail").focus();
			return false;
		}
		else if(UserPhone.trim()=="")
		{
			alert("手机号不能为空!");
			document.getElementById("UserPhone").focus();
			return false;
		}
		else if(OrgNum.trim()=="")
		{
			alert("机构代码不能为空!");
			document.getElementById("OrgNum").focus();
			return false;
		}
		else if(OrgName.trim()=="")
		{
			alert("机构名称不能为空!");
			document.getElementById("OrgName").focus();
			return false;
		}
		else if(OrgZip.trim()=="")
		{
			alert("邮政编码不能为空!");
			document.getElementById("OrgZip").focus();
			return false;
		}
		else
		{
			document.getElementById("Registerform").submit(); 
		}
	}
</script>
<style type="text/css">
.btn {
	font-size: 15px;
	height: 30px;
	background-color: DeepSkyBlue;
	color: white;
	position: relative;
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
	height: 33px;
}

span {
	color: red;
	font-size: 12px;
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
	<form action="glxgxxServlet" id="yhxxform" name="yhxxform"
		method="post" target="_self">
		<table>
			<!--用户信息 -->
			<tr class="grey">
				<td colspan="2">角色信息 <span
					style="color: red; font-size: 17px;">${msg}</span>
				</td>
			</tr>
			<tr>
				<td width="8%">用户角色：</td>
				<td><select name="js" id="js" style="width: 200px;">
						<option value="<%=juese%>"><%=juese%></option>
						<%
						String sql1="select * from JueSe where juese != '"+juese+"'";
						ResultSet rs1=db.executeQuery(sql1);
						while(rs1.next()){
						out.println("<option value="+rs1.getString(1)+">"+rs1.getString(1)+"</option>");
						}
						rs1.close();
					%>
				</select></td>
			</tr>
			<tr class="grey">
				<td colspan="2"><span style="color: black; font-size: 17px;">用户信息</span>
				</td>
			</tr>
			<tr>
				<td>用&nbsp;&nbsp;户&nbsp;&nbsp;名：</td>
				<td><input type="text" id="UserName" name="UserName"
					style="width: 200px" value="<%=UserName %>" readonly="readonly" />
					<span style="position: relative; bottom: -4px">*</span></td>
			</tr>
			<tr>
				<td>真实姓名：</td>
				<td style="width: 250px"><input type="text" id="UserTrue"
					name="UserTrue" style="width: 200px" value="<%=UserTrue %>" /> <span
					style="position: relative; bottom: -4px">*</span></td>
			</tr>
			<tr>
				<td>身份证号：</td>
				<td><input type="text" id="UserID" name="UserID"
					style="width: 200px" value="<%=UserID %>" /> <span
					style="position: relative; bottom: -4px">*</span></td>
			</tr>
			<tr>
				<td>电子邮箱：</td>
				<td><input type="text" id="UserEmail" name="UserEmail"
					style="width: 200px" value="<%=UserEmail %>" /> <span
					style="position: relative; bottom: -4px">*</span></td>
			</tr>
			<tr>
				<td>手机号码：</td>
				<td><input type="text" id="UserPhone" name="UserPhone"
					style="width: 200px" value="<%=UserPhone %>" /> <span
					style="position: relative; bottom: -4px">*</span></td>
			</tr>
			<!--公司信息-->
			<tr>
				<td colspan="2" class="grey"><span
					style="color: black; font-size: 17px;">公司信息</span></td>
			</tr>
			<tr>
				<td>机构代码：</td>
				<td><input type="text" id="OrgNum" name="OrgNum"
					style="width: 200px" value="<%=OrgNum %>" /> <span
					style="position: relative; bottom: -4px">*</span></td>
			</tr>
			<tr>
				<td>机构名称：</td>
				<td><input type="text" id="OrgName" name="OrgName"
					style="width: 200px" value="<%=OrgName %>" /> <span
					style="position: relative; bottom: -4px">*</span></td>
			</tr>
			<tr>
				<td>邮政编码：</td>
				<td><input type="text" id="OrgZip" name="OrgZip"
					style="width: 200px" value="<%=OrgZip %>" /> <span
					style="position: relative; bottom: -4px">*</span></td>
			</tr>
			<tr>
				<td></td>
				<td style="height: 70px;"><input type="submit" name="submit"
					value="修改" class="btn" onclick="return Check1()" /> <a
					href="javascript:history.back(-1)" target="_self"><input
						type="button" name="button" value="返回" class="btn" /></a></td>
			</tr>
		</table>
	</form>
</body>
</html>