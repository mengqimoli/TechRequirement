<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.jee.common.Database"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("utf-8");
	Database db = new Database();

	//定义变量
	String strUserName = "";//用户名
	String strOrgNum = "";//机构编码
	String strOrgNeedNum = "";//需求编号
	String strOrgName = "";//机构全称
	String strOrgPutunder = "";//归口管理部门
	String strOrgAddress = "";//通讯地址
	String strOrgArea = "";//所在地域
	String strOrgURL = "";//单位网址
	String strOrgEmail = "";//电子邮箱
	String strOrgLaw = "";//法人代表
	String strOrgZip = "";//邮政编码
	String strOrgContacts = "";//联系人
	String strOrgFixedPhone = "";//固定电话
	String strOrgPhone = "";//手机
	String strOrgPortraiture = "";//传真
	String strOrgAttribute = "";//机构属性
	String strOrgIntroduction = "";//机构简介
	String strOrgTechNeed = "";//技术需求名称
	String strOrgNeedTime = "";//时限
	String strOrgNeedTime1 = "";//时限
		    
	String strOrgScienceNeed = "";//技术需求概述
	String strOrgScienceNeed1 = "";//技术需求概述
	String strOrgScienceNeed2 = "";//技术需求概述
		    
	String strOrgKey = "";//关键字
		    
	String strOrgResearchType = "";//科技活动类型
		    
	String strOrgSubject = "";//基础研究(学科分类)
		    
    String strOrgTechArea = "";//非基础研究(需求技术应用领域)
	String strOrgTechWork= "";//非基础研究(需求技术应用行业)
		    
    String strOrgCooperation = "";//技术需求解决方式
    String strOrgCooperUnit = "";//合作意向单位
	String strOrgAllMoney = "";//计划总投资
    
	request.setCharacterEncoding("utf-8");
			
	strUserName=(String)request.getSession().getAttribute("user_in_session");//*****得到session中的用户名
	strOrgNeedNum = request.getParameter("OrgNeedNum");//*************************************得到需求编号
	
	String strSql = "";
	String strSql11 = "";
	
	strSql = "select * from UserTable where UserName = '"+strUserName+"'";
	ResultSet rs=db.executeQuery(strSql);
	while(rs.next()){
		strOrgNum = rs.getString("OrgNum");
		strOrgName = rs.getString("OrgName");
		strOrgZip = rs.getString("OrgZip");
	}
	rs.close();
	strSql11 = "select * from OrgInformation where OrgNeedNum = '"+strOrgNeedNum+"'";
	ResultSet rs11=db.executeQuery(strSql11);
	if(rs11.next())
	{
		strOrgPutunder = rs11.getString("OrgPutunder").trim();
		strOrgAddress = rs11.getString("OrgAddress").trim();
		strOrgArea = rs11.getString("OrgArea").trim();
		strOrgURL = rs11.getString("OrgURL").trim();
		strOrgEmail = rs11.getString("OrgEmail").trim();
		strOrgLaw = rs11.getString("OrgLaw").trim();
		strOrgContacts = rs11.getString("OrgContacts").trim();
		strOrgFixedPhone = rs11.getString("OrgFixedPhone").trim();
		strOrgPhone = rs11.getString("OrgPhone").trim();
		strOrgPortraiture = rs11.getString("OrgPortraiture").trim();
		strOrgAttribute = rs11.getString("OrgAttribute").trim();
		strOrgIntroduction = rs11.getString("OrgIntroduction").trim();
		strOrgTechNeed = rs11.getString("OrgTechNeed").trim();
		strOrgNeedTime = rs11.getString("OrgNeedTime").trim();
		strOrgNeedTime1 = rs11.getString("OrgNeedTime1").trim();
		strOrgScienceNeed = rs11.getString("OrgScienceNeed").trim();
		strOrgScienceNeed1 = rs11.getString("OrgScienceNeed1").trim();
		strOrgScienceNeed2 = rs11.getString("OrgScienceNeed2").trim();
		strOrgKey = rs11.getString("OrgKey").trim();
		strOrgAllMoney = rs11.getString("OrgAllMoney").trim();
		strOrgResearchType = rs11.getString("OrgResearchType").trim();
		strOrgSubject = rs11.getString("OrgSubject").trim();
		strOrgTechArea = rs11.getString("OrgTechArea").trim();
		strOrgTechWork = rs11.getString("OrgTechWork").trim();
		strOrgCooperation = rs11.getString("OrgCooperation").trim();
		strOrgCooperUnit = rs11.getString("OrgCooperUnit").trim();
	}
	rs11.close();
	//关键字
	String OrgKey0 = "";
	String OrgKey1 = "";
	String OrgKey2 = "";
	String OrgKey3 = "";
	String OrgKey4 = "";
	String [] strkey = strOrgKey.split(",");
	if(strkey.length >= 1){
		OrgKey0 = strkey[0];
	}
	if(strkey.length >= 2){
		OrgKey1 = strkey[1];
	}
	if(strkey.length >= 3){
		OrgKey2 = strkey[2];
	}
	if(strkey.length >= 4){
		OrgKey3 = strkey[3];
	}
	if(strkey.length >= 5){
		OrgKey4 = strkey[4];
	}
	//得到学科分类各个字段
	String OrgSubject0 = "";
	String OrgSubject1 = "";
	String OrgSubject2 = "";
	String [] str = strOrgSubject.split(",");
	if(str.length == 3){
		OrgSubject0 = str[0]; 
		OrgSubject1 = str[1];
		OrgSubject2 = str[2];
	}
	if(str.length == 2){
		OrgSubject0 = str[0]; 
		OrgSubject1 = str[1];
	}
	if(str.length == 1){
		OrgSubject0 = str[0]; 
	}
	//得到需求技术应用行业 各个字段
	String OrgTechWork0 = "";
	String OrgTechWork1 = "";
	String OrgTechWork2 = "";
	String [] str1 = strOrgTechWork.split(",");
	if(str1.length == 3){
		OrgTechWork0 = str1[0];
		OrgTechWork1 = str1[1];
		OrgTechWork2 = str1[2];
	}
	if(str1.length == 2){
		OrgTechWork0 = str1[0];
		OrgTechWork1 = str1[1];
	}
	if(str1.length == 1){
		OrgTechWork0 = str1[0];
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.4.js"></script>
<script type="text/javascript" src="js/table.js"></script>
<script type="text/javascript" src="sanji/sanji.js"></script>
<script type="text/javascript" src="sanji/sanji1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	getFirst_xq('OrgTechWork1');
	getFirst_xk('OrgSubject1');
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>河北省重大技术需求征集系统</title>
<script type="text/javascript">
	window.onload = function(){
	  var res = "<%=strOrgResearchType %>";
	  if(res == "基础研究"){
		  document.getElementById("w1").style.display = "none"; 
		  document.getElementById("w2").style.display = "none"; 
	  }	
	  else{
		  document.getElementById("q1").style.display = "none";  
	  }
	  
	//**************************************************************************************************回显复选框
		//获得所要回显的值，此处为：100,1001,200,1400
		var checkeds = "<%=strOrgTechArea %>";
		//拆分为字符串数组
		var checkArray =checkeds.split(",");
		//获得所有的复选框对象
		var checkBoxAll = $("input[name='OrgTechArea']");
		//获得所有复选框（新闻,微信,论坛，问答，博客，平媒）的value值，然后，用checkArray中的值和他们比较，如果有，则说明该复选框被选中
		for(var i=0;i<checkArray.length;i++){
		//获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
			$.each(checkBoxAll,function(j,checkbox){
			//获取复选框的value属性
				var checkValue=$(checkbox).val();
				if(checkArray[i]==checkValue){
					$(checkbox).attr("checked",true);
				}
			})
		}; 
	  
	};
	/* ***************************************************************************************判断输入为空 */
	function Check1()
	{
		var d = new Date();
        var nowYear = +d.getFullYear();
		
		var OrgAddress=document.getElementById("OrgAddress").value.trim();
		var OrgEmail=document.getElementById("OrgEmail").value.trim();
		var OrgPutunder=document.getElementById("OrgPutunder").value.trim();
		var OrgLaw=document.getElementById("OrgLaw").value.trim();
		var OrgContacts=document.getElementById("OrgContacts").value.trim();
		var OrgPhone=document.getElementById("OrgPhone").value.trim();
		var OrgIntroduction=document.getElementById("OrgIntroduction").value.trim();
		var OrgTechNeed=document.getElementById("OrgTechNeed").value.trim();
		var OrgNeedTime=document.getElementById("OrgNeedTime").value.trim();
		var OrgNeedTime1=document.getElementById("OrgNeedTime1").value.trim();
		var OrgScienceNeed=document.getElementById("OrgScienceNeed").value.trim();
		var OrgScienceNeed1=document.getElementById("OrgScienceNeed1").value.trim();
		var OrgScienceNeed2=document.getElementById("OrgScienceNeed2").value.trim();
		var OrgKey1=document.getElementById("OrgKey1").value.trim();
		
		if(OrgAddress=="")
		{
			alert("通讯地址不能为空");
			return false;
		}
		else if(OrgEmail=="")
		{
			alert("电子信箱不能为空");
			return false;
		}
		else if(OrgLaw=="")
		{
			alert("法人代表不能为空");
			return false;
		}
		else if(OrgContacts=="")
		{
			alert("联系人不能为空");
			return false;
		}
		else if(OrgPhone=="")
		{
			alert("手机不能为空");
			return false;
		}
		else if(OrgIntroduction=="")
		{
			alert("机构简介不能为空");
			return false;
		}
		else if(OrgTechNeed=="")
		{
			alert("技术需求名称不能为空");
			return false;
		}
		else if(OrgNeedTime<nowYear)
		{
			alert("起始需求时限不能低于当前年份");
			return false;
		}
		else if(OrgNeedTime>OrgNeedTime1)
		{
			alert("结束需求时限不能低于起始需求时限");
			return false;
		}
		else if(OrgScienceNeed==""||OrgScienceNeed1==""||OrgScienceNeed2=="")
		{
			alert("需求技术概述不能为空");
			return false;
		}
		else if(OrgKey1=="")
		{
			alert("关键字不能为空");
			return false;
		}
		else
		{
			return true;
		}
	}
</script>
<!-- **************************************************************************************************************CSS -->
<style type="text/css">
table {
	border-collapse: collapse;
	margin: 0 auto;
	width: 900px;
}

table, th, td {
	border: 1px solid black;
}

td {
	height: 40px;
}

input {
	/* background: none transparent scroll repeat 0% 0%; */
	height: 40px;
	border: none;
}

div {
	text-align: center
}

span {
	color: red;
	position: relative;
	bottom: -2px;
}
</style>
</head>
<body>
	<!-- **********************************************************************************************************JAVA代码 -->
	<br />
	<table style="border: none;">
		<tr>
			<td style="border: none; text-align: center; font-size: 30px;">
				河北省重大技术需求征集表</td>
		</tr>
	</table>
	<!-- **********************************************************************************************************表格 -->
	<table style="border: none;">
		<tr>
			<td
				style="width: 100px; height: 50px; text-align: left; border: none;">&nbsp;&nbsp;&nbsp;&nbsp;机构代码</td>
			<td style="width: 500px; border: none;"><span
				style="color: blue;"><%=strOrgNum%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="color: red; font-size: 17px;">${msg}</span></td>
			<td style="width: 80px; text-align: center; border: none;">需求编号</td>
			<td style="border: none;"><span style="color: blue;"><%=strOrgNeedNum%></span>
			</td>
		</tr>
	</table>
	<form action="xgtableServlet?OrgNeedNum=<%=strOrgNeedNum%>"
		id="xgtableform" name="xgtableform" method="post" target="_self">
		<table>
			<tr>
				<td style="width: 120px;">
					<div>
						<!--*****************************************************************************************机构全称 -->
						<span>*&nbsp;</span>机构全称
					</div>
				</td>
				<td><input type="text" name="OrgName" id="OrgName"
					style="width: 410px;" value="<%=strOrgName%>" readonly /></td>
				<td>
					<div style="color: red">
						<!--**************************************************************************************归口管理部门-->
						归口管理部门
					</div>
				</td>
				<td>
					<div>
						<select name="OrgPutunder" id="OrgPutunder" style="width: 200px">
							<option value="<%=strOrgPutunder %>" selected="selected"><%=strOrgPutunder %></option>
							<%
							String sql1="select * from Putunder where Putunder != '"+strOrgArea+"'";
							ResultSet rs1=db.executeQuery(sql1);
							while(rs1.next()){
							out.println("<option value="+rs1.getString(2)+">"+rs1.getString(2)+"</option>");
							}
							rs1.close();
						%>
						</select>
					</div> <!-- <input type="text" name="OrgPutunder" id="OrgPutunder" style="width: 250px" /> -->
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<!--******************************************************************************************通讯地址 -->
						<span>*&nbsp;</span>通讯地址
					</div>
				</td>
				<td><input type="text" name="OrgAddress" id="OrgAddress"
					style="width: 410px" value="<%=strOrgAddress%>" /></td>
				<td>
					<div>
						<!--*******************************************************************************************所在领域-->
						<span>*&nbsp;</span>所在地域
					</div>
				</td>
				<td>
					<div>
						<select name="OrgArea" id="OrgArea" style="width: 200px">
							<option value="<%=strOrgArea %>" selected="selected"><%=strOrgArea %></option>
							<%
							String sql2="select * from AreaCode where AreaName != '"+strOrgArea+"'";
							ResultSet rs2=db.executeQuery(sql2);
							while(rs2.next()){
							out.println("<option value="+rs2.getString(2)+">"+rs2.getString(2)+"</option>");
							}
							rs2.close();
						%>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>网址</div>
				</td>
				<td><input type="text" name="OrgURL" id="OrgURL"
					style="width: 410px;" value="<%=strOrgURL%>" /></td>
				<td>
					<div>
						<!--******************************************************************************************电子邮箱 -->
						<span>*&nbsp;</span>电子信箱
					</div>
				</td>
				<td><input type="text" name="OrgEmail" id="OrgEmail"
					style="width: 250px" value="<%=strOrgEmail%>" /></td>
			</tr>
			<tr>
				<td>
					<div>
						<!--******************************************************************************************法人代表 -->
						<span>*&nbsp;</span>法人代表
					</div>
				</td>
				<td><input type="text" name="OrgLaw" id="OrgLaw"
					style="width: 410px" value="<%=strOrgLaw%>" /></td>
				<td style="width: 100px">
					<div>
						<!--*******************************************************************************************邮政编码 -->
						邮政编码
					</div>
				</td>
				<td><input type="text" name="OrgZip" id="OrgZip"
					style="width: 250px" value="<%=strOrgZip%>" readonly="readonly" />
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td rowspan="2" style="width: 120px;">
					<div>
						<!--*******************************************************************************************联系人 -->
						<span>*&nbsp;</span>联系人
					</div>
				</td>
				<td rowspan="2"><input type="text" name="OrgContacts"
					id="OrgContacts" style="width: 305px; height: 80px;"
					value="<%=strOrgContacts%>" /></td>
				<td style="width: 98px;">
					<div>
						<!--*******************************************************************************************电话 -->
						<span>*&nbsp;</span>电话
					</div>
				</td>
				<td>固定： <input type="text" name="OrgFixedPhone"
					id="OrgFixedPhone" style="width: 110px"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')"
					value="<%=strOrgFixedPhone%>" /> 手机： <input type="text"
					name="OrgPhone" id="OrgPhone" style="width: 110px"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')"
					value="<%=strOrgPhone%>" />
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<!--***********************************************************************************************传真 -->
						传真
					</div>
				</td>
				<td><input type="text" name="OrgPortraiture"
					id="OrgPortraiture" style="width: 350px"
					value="<%=strOrgPortraiture%>" /></td>
			</tr>
		</table>
		<table>
			<tr>
				<td style="width: 120px; height: 40px;">
					<div>
						<!-- *********************************************************************************************************机构属性 -->
						<span>*&nbsp;</span>机构属性
					</div>
				</td>
				<td colspan="3"><input type="radio" name="OrgAttribute"
					value="企业" style="height: 15px;"
					<% if(strOrgAttribute.equals("企业")) out.print("checked");%> />企业 <input
					type="radio" name="OrgAttribute" value="高等院校" style="height: 15px;"
					<% if(strOrgAttribute.equals("高等院校")) out.print("checked");%> />高等院校
					<input type="radio" name="OrgAttribute" value="研究机构"
					style="height: 15px;"
					<% if(strOrgAttribute.equals("研究机构")) out.print("checked");%> />研究机构
					<input type="radio" name="OrgAttribute" value="其他"
					style="height: 15px;"
					<% if(strOrgAttribute.equals("其他")) out.print("checked");%> />其他</td>
			</tr>
			<tr>
				<td colspan="4" style="border-bottom: none;">
					<!--*********************************************************************************************机构简介 -->
					<span>*&nbsp;</span>机构简介（主要包括基本情况、现有研究基础等，限500字以内）<span
					id="OrgIntroduction1">0</span><span style="color: black">/500</span>
					<textarea onkeyup="Introduction()" id="OrgIntroduction"
						name="OrgIntroduction" rows="3" cols="107"><%=strOrgIntroduction%></textarea>
				</td>
			</tr>
			<tr>
				<td style="height: 40px;">
					<div>
						<!--***************************************************************************************技术需求名称 -->
						<span>*&nbsp;</span>技术需求名称
					</div>
				</td>
				<td><input type="text" name="OrgTechNeed" id="OrgTechNeed"
					style="width: 350px" value="<%=strOrgTechNeed%>" /></td>
				<td style="width: 100px;">
					<div>
						<!--*****************************************************************************************需求时限 -->
						<span>*&nbsp;</span>需求时限
					</div>
				</td>
				<td><input type="text" name="OrgNeedTime" id="OrgNeedTime"
					style="width: 100px;"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')"
					value="<%=strOrgNeedTime%>" />年至 <input type="text"
					name="OrgNeedTime1" id="OrgNeedTime1" style="width: 100px;"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')"
					value="<%=strOrgNeedTime1%>" />年</td>
			</tr>
			<tr>
				<!--*****************************************************************************************技术需求概述 -->
				<td colspan="4"><span>*&nbsp;</span>技术需求概述
					<div style="text-align: left;">
						1、主要问题（需要解决的重大技术问题，限500字以内）<span id="OrgScienceNeed00">0</span><span
							style="color: black">/500</span>
					</div> <textarea onkeyup="ScienceNeed()" cols="107" rows="3"
						id="OrgScienceNeed" name="OrgScienceNeed"><%=strOrgScienceNeed%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">2、技术关键（所需的关键技术、主要指标，限500字以内）<span
					id="OrgScienceNeed11">0</span><span style="color: black">/500</span>
					<textarea onkeyup="ScienceNeed1()" cols="107" rows="3"
						id="OrgScienceNeed1" name="OrgScienceNeed1"><%=strOrgScienceNeed1%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">3、预期目标（技术创新性、经济社会效益，限500字以内）<span
					id="OrgScienceNeed22">0</span><span style="color: black">/500</span>
					<textarea onkeyup="ScienceNeed2()" cols="107" rows="3"
						id="OrgScienceNeed2" name="OrgScienceNeed2"><%=strOrgScienceNeed2%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border-top: none; height: 45px;">
					<!--************************************************************************************************关键字 -->
					<span>*&nbsp;</span>关键字(1-5个): <input type="text" name="OrgKey1"
					id="OrgKey1" style="width: 100px; border: 1px solid black;"
					onblur="key1()" value="<%=OrgKey0%>" /> <input type="text"
					name="OrgKey2" id="OrgKey2"
					style="width: 100px; border: 1px solid black;" readonly="readonly"
					onblur="key2()" value="<%=OrgKey1%>" /> <input type="text"
					name="OrgKey3" id="OrgKey3"
					style="width: 100px; border: 1px solid black;" readonly="readonly"
					onblur="key3()" value="<%=OrgKey2%>" /> <input type="text"
					name="OrgKey4" id="OrgKey4"
					style="width: 100px; border: 1px solid black;" readonly="readonly"
					onblur="key4()" value="<%=OrgKey3%>" /> <input type="text"
					name="OrgKey5" id="OrgKey5"
					style="width: 100px; border: 1px solid black;" readonly="readonly"
					value="<%=OrgKey4%>" />
				</td>
			</tr>
			<tr>
				<td style="width: 100px; height: 45px;">
					<div>
						<!--**********************************************************************************拟投入资金总额 -->
						拟投入资金总额
					</div>
				</td>
				<td colspan="3"><input type="text" name="OrgAllMoney"
					id="OrgAllMoney" style="width: 605px; text-align: center"
					onkeyup="value=value.replace(/[^\d.]/g,'')"
					value="<%=strOrgAllMoney%>" /> 万元</td>
			</tr>
			<tr>
				<td rowspan="2" style="height: 100px;">
					<div>
						<!--***********************************************************************************技术需求解决方式 -->
						<span>*&nbsp;</span>技术需求解决方式
					</div>
				</td>
				<td colspan="3"><input type="radio" name="OrgCooperation"
					id="dl" value="独立开发" onclick="dlhz()" style="height: 15px;"
					<% if(strOrgCooperation.equals("独立开发")) out.print("checked");%> />独立开发
					<input type="radio" name="OrgCooperation" value="委托研发"
					style="height: 15px;"
					<% if(strOrgCooperation.equals("委托研发")) out.print("checked");%> />委托研发
					<input type="radio" name="OrgCooperation" id="hz" value="合作开发"
					onclick="dlhz()" style="height: 15px;"
					<% if(strOrgCooperation.equals("合作开发")) out.print("checked");%> />合作开发
					<input type="radio" name="OrgCooperation" value="其他"
					style="height: 15px;"
					<% if(strOrgCooperation.equals("其他")) out.print("checked");%> />其他

				</td>
			</tr>
			<tr>
				<td colspan="3">
					<!--*******************************************************************************************合作意向单位 -->
					合作意向单位<input type="text" name="OrgCooperUnit" id="OrgCooperUnit"
					style="width: 510px; text-align: center;"
					value="<%=strOrgCooperUnit%>" /> （选填）
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<!--***********************************************************************************科技活动类型 -->
						<span>*&nbsp;</span>科技活动类型
					</div>
				</td>
				<td colspan="3"><input type="radio" name="OrgResearchType"
					id="q" value="基础研究" onclick="baseSur()" style="height: 15px;"
					<% if(strOrgResearchType.equals("基础研究")) out.print("checked");%> />基础研究
					<input type="radio" name="OrgResearchType" id="w" value="应用研究"
					onclick="baseSur()" style="height: 15px;"
					<% if(strOrgResearchType.equals("应用研究")) out.print("checked");%> />应用研究
					<input type="radio" name="OrgResearchType" id="e" value="试验发展"
					onclick="baseSur()" style="height: 15px;"
					<% if(strOrgResearchType.equals("试验发展")) out.print("checked");%> />试验发展
					<input type="radio" name="OrgResearchType" id="r" value="研究发展与成果应用"
					onclick="baseSur()" style="height: 15px;"
					<% if(strOrgResearchType.equals("研究发展与成果应用")) out.print("checked");%> />研究发展与成果应用
					<input type="radio" name="OrgResearchType" id="t" value="技术推广与科技服务"
					onclick="baseSur()" style="height: 15px;"
					<% if(strOrgResearchType.equals("技术推广与科技服务")) out.print("checked");%> />技术推广与科技服务
					<input type="radio" name="OrgResearchType" id="y" value="生产性活动"
					onclick="baseSur()" style="height: 15px;"
					<% if(strOrgResearchType.equals("生产性活动")) out.print("checked");%> />生产性活动
				</td>
			</tr>
			<tr id="q1">
				<td>
					<div>
						<!--****************************************************************************学科分类（限基础研究填写） -->
						<span style="font-size: 15px; color: black;">学科分类</span><span
							style="font-size: 13px; color: black;">（限基础研究填写）</span>
					</div>
				</td>
				<td colspan="3">
					<div>
						<select name="OrgSubject1" id="OrgSubject1"
							onchange="changefirst_xk()"><option
								value="<%=OrgSubject0 %>"><%=OrgSubject0 %></option>
						</select> <select name="OrgSubject2" id="OrgSubject2"
							onchange="changesecond_xk()"><option
								value="<%=OrgSubject1 %>"><%=OrgSubject1 %></option></select> <select
							name="OrgSubject3" id="OrgSubject3"><option
								value="<%=OrgSubject2 %>"><%=OrgSubject2 %></option></select>
					</div>
				</td>
			</tr>
			<tr id="w1">
				<td style="height: 80px;">
					<!--**********************************************************************需求技术所属领域（非基础研究填写） -->
					<div>
						<span style="font-size: 15px; color: black;">需求技术所属领域</span><span
							style="font-size: 13px; color: black;">（非基础研究填写）</span>
					</div>
				</td>
				<td colspan="3" style="width: 500px;"><input type="checkbox"
					name="OrgTechArea" value="电子信息技术" style="height: 15px;" />电子信息技术 <input
					type="checkbox" name="OrgTechArea" value="光机电一体化"
					style="height: 15px;" />光机电一体化 <input type="checkbox"
					name="OrgTechArea" value="软件" style="height: 15px;" />软件 <input
					type="checkbox" name="OrgTechArea" value="生物制药技术"
					style="height: 15px;" />生物制药技术 <input type="checkbox"
					name="OrgTechArea" value="新材料及应用技术" style="height: 15px;" />新材料及应用技术
					<input type="checkbox" name="OrgTechArea" value="先进制造技术"
					style="height: 15px;" />先进制造技术 <input type="checkbox"
					name="OrgTechArea" value="现代农业技术" style="height: 15px;" />现代农业技术 <input
					type="checkbox" name="OrgTechArea" value="新能源与高校节能技术"
					style="height: 15px;" />新能源与高校节能技术 <input type="checkbox"
					name="OrgTechArea" value="资源与环境保护新技术" style="height: 15px;" />资源与环境保护新技术
					<input type="checkbox" name="OrgTechArea" id="otherTe"
					value="其他技术（注明）" onclick="otherTech()" style="height: 15px;" />其他技术（注明）&nbsp;&nbsp;&nbsp;&nbsp;（可多选）
					<div id="otherTe1" style="display: none; text-align: left;">
						<input type="text" name="OrgOtherTech" id="OrgOtherTech"
							style="width: 700px; border: 1px solid green; height: 15px;" />
					</div></td>
			</tr>
			<tr id="w2">
				<td style="height: 60px;">
					<!--**************************************************************************需求技术应用行业（非基础研究填写） -->
					<div>
						<span style="font-size: 15px; color: black;">需求技术应用行业</span><span
							style="font-size: 13px; color: black;">（非基础研究填写）</span>
					</div>
				</td>
				<td colspan="3">
					<div>
						<select name="OrgTechWork1" id="OrgTechWork1"
							onchange="changefirst_xq()"><option
								value="<%=OrgTechWork0 %>"><%=OrgTechWork0 %></option></select> <select
							name="OrgTechWork2" id="OrgTechWork2"
							onchange="changesecond_xq()"><option
								value="<%=OrgTechWork1 %>"><%=OrgTechWork1 %></option></select> <select
							name="OrgTechWork3" id="OrgTechWork3"><option
								value="<%=OrgTechWork2 %>"><%=OrgTechWork2 %></option></select>
					</div>
				</td>
			</tr>

		</table>
		<br />
		<br />
		<div>
			<input type="submit" name="submit" value="修改"
				style="font-size: 20px; height: 35px; background-color: DeepSkyBlue; color: white;"
				onclick="return Check1()" />
		</div>
	</form>
	<br />
	<br />
</body>
</html>