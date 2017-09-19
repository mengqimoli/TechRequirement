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
        var strReg=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;//判定邮箱是否正确
        var re= /^[0-9]{6}$/;//判定邮政编码
		var reg = /^[0-9a-zA-Z]+$/;
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
		
		var r = UserEmail.search(strReg); 
		
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
		else if(UserTrue.trim()=="")
		{
			alert("真实姓名不能为空!");
			document.getElementById("UserTrue").focus();
			return false;
		}
		else if(UserID.trim().length!=18)
		{
			alert("请输入正确的身份证号！");
			document.getElementById("UserID").focus();
			return false;
		}
		else if(r == -1)
		{
			alert("请输入正确的邮件地址！");
			document.getElementById("UserEmail").focus();
			return false;
		}
		else if(UserPhone.trim().length!=11)
		{
			alert("请输入正确的手机号！");
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
		else if(re.test(OrgZip)==false)
		{
			alert("邮政编码格式不正确！");
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
.grey {
	background-color: SkyBlue;
}

div {
	text-align: center;
}

table {
	border-collapse: collapse;
	margin: 0 auto;
	width: 900px;
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
	<form action="zhuceServlet" id="Registerform" name="Registerform"
		method="post" target="_self">
		<table>
			<!--用户名和密码 -->
			<tr class="grey">
				<td style="width: 140px;"><span
					style="color: black; font-size: 17px;">用户名和密码</span></td>
				<td><span style="color: red; font-size: 17px;">${msg}</span></td>
			</tr>
		</table>
		<table>
			<tr>
				<td style="text-align: left; width: 70px;">
					用&nbsp;&nbsp;户&nbsp;&nbsp;名：</td>
				<td style="width: 250px"><input type="text" id="UserName"
					name="UserName" style="width: 200px" /> <span
					style="position: relative; bottom: -4px">*</span></td>
				<td><span>用户名不包括~，*/等特殊符号&nbsp;&nbsp;&nbsp;&nbsp;(用于登录)</span>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;">
					密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
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
			<!--用户信息 -->
			<tr>
				<td colspan="3" class="grey"><span
					style="color: black; font-size: 17px;">用户信息</span></td>
			</tr>
			<tr>
				<td style="text-align: left;">真实姓名：</td>
				<td style="width: 250px"><input type="text" id="UserTrue"
					name="UserTrue" style="width: 200px" /> <span
					style="position: relative; bottom: -4px">*</span></td>
				<td><span>请填写中华人民共和国居民身份证上的名字(不可更改)</span></td>
			</tr>
			<tr>
				<td style="text-align: left;">身份证号：</td>
				<td style="width: 250px"><input type="text" id="UserID"
					name="UserID" style="width: 200px"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')" /> <span
					style="position: relative; bottom: -4px">*</span></td>
				<td><span>请填写中华人民共和国居民身份证号(不可更改)</span></td>
			</tr>
			<tr>
				<td style="text-align: left;">电子邮箱：</td>
				<td style="width: 250px"><input type="text" id="UserEmail"
					name="UserEmail" style="width: 200px" /> <span
					style="position: relative; bottom: -4px">*</span></td>
				<td><span>非常重要，个人邮箱，用于修改用户密码及相关信息</span></td>
			</tr>
			<tr>
				<td style="text-align: left;">手机号码：</td>
				<td style="width: 250px"><input type="text" id="UserPhone"
					name="UserPhone" style="width: 200px"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')" /> <span
					style="position: relative; bottom: -4px">*</span></td>
				<td></td>
			</tr>
			<!--公司信息-->
			<tr>
				<td colspan="3" class="grey"><span
					style="color: black; font-size: 17px;">公司信息</span></td>
			</tr>
			<tr>
				<td style="text-align: left;">机构代码：</td>
				<td style="width: 250px"><input type="text" id="OrgNum"
					name="OrgNum" style="width: 200px"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')" /> <span
					style="position: relative; bottom: -4px">*</span></td>
				<td><span>此代码为唯一(不可更改)</span></td>
			</tr>
			<tr>
				<td style="text-align: left;">机构名称：</td>
				<td><input type="text" id="OrgName" name="OrgName"
					style="width: 200px" /> <span
					style="position: relative; bottom: -4px">*</span></td>
				<td><span>请填写在工商局注册时登记的机构全称</span></td>
			</tr>
			<tr>
				<td style="text-align: left;">邮政编码：</td>
				<td style="width: 250px"><input type="text" id="OrgZip"
					name="OrgZip" style="width: 200px"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')" /> <span
					style="position: relative; bottom: -4px">*</span></td>
				<td><span>公司所在地的邮政编码</span></td>
			</tr>
			<tr>
				<td></td>
				<td style="text-align: center; height: 70px;"><input
					type="submit" name="submit" value="注册"
					style="font-size: 18px; position: relative; left: -50px; background-color: DeepSkyBlue; color: white;"
					onclick="return Check1()" /></td>
				<td></td>
			</tr>
		</table>
	</form>
</body>
</html>