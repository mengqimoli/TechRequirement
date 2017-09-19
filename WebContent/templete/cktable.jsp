<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.jee.common.Database"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	response.setContentType("text/html;charset=utf-8");
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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.4.js"></script>
<script type="text/javascript" src="login/refresh.js"></script>
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
	}
 </script>
<!-- *********************************************************************************************************CSS -->
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
	background: none transparent scroll repeat 0% 0%;
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

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<!-- ***************
*******************************************************************************************JAVA代码 -->
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
	<table>
		<tr>
			<td style="width: 120px;">
				<div>
					<!--*****************************************************************************************机构全称 -->
					<span>*&nbsp;</span>机构全称
				</div>
			</td>
			<td style="width: 380px;"><%=strOrgName%></td>
			<td style="width: 120px;">
				<div style="color: red">
					<!--**************************************************************************************归口管理部门-->
					归口管理部门
				</div>
			</td>
			<td><%=strOrgPutunder%></td>
		</tr>
		<tr>
			<td>
				<div>
					<!--******************************************************************************************通讯地址 -->
					<span>*&nbsp;</span>通讯地址
				</div>
			</td>
			<td><%=strOrgAddress%></td>
			<td>
				<div>
					<!--*******************************************************************************************所在领域-->
					<span>*&nbsp;</span>所在地域
				</div>
			</td>
			<td><%=strOrgArea%></td>
		</tr>
		<tr>
			<td>
				<div>网址</div>
			</td>
			<td><%=strOrgURL%></td>
			<td>
				<div>
					<!--******************************************************************************************电子邮箱 -->
					<span>*&nbsp;</span>电子信箱
				</div>
			</td>
			<td><%=strOrgEmail%></td>
		</tr>
		<tr>
			<td>
				<div>
					<!--******************************************************************************************法人代表 -->
					<span>*&nbsp;</span>法人代表
				</div>
			</td>
			<td><%=strOrgLaw%></td>
			<td style="width: 100px">
				<div>
					<!--*******************************************************************************************邮政编码 -->
					邮政编码
				</div>
			</td>
			<td><%=strOrgZip%></td>
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
			<td rowspan="2" style="width: 257px;"><%=strOrgContacts%></td>
			<td style="width: 120px;">
				<div>
					<!--*******************************************************************************************电话 -->
					<span>*&nbsp;</span>电话
				</div>
			</td>
			<td>固定： <%=strOrgFixedPhone%> 手机： <%=strOrgPhone%>
			</td>
		</tr>
		<tr>
			<td>
				<div>
					<!--***********************************************************************************************传真 -->
					传真
				</div>
			</td>
			<td><%=strOrgPortraiture%></td>
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
			<td colspan="3"><input type="radio" name="OrgAttribute" id="qy"
				value="企业" style="height: 15px;"
				<% if(strOrgAttribute.equals("企业")) out.print("checked");%>
				disabled="disabled" />企业 <input type="radio" name="OrgAttribute"
				id="gdyx" value="高等院校" style="height: 15px;"
				<% if(strOrgAttribute.equals("高等院校")) out.print("checked");%>
				disabled="disabled" />高等院校 <input type="radio" name="OrgAttribute"
				id="yjjg" value="研究机构" style="height: 15px;"
				<% if(strOrgAttribute.equals("研究机构")) out.print("checked");%>
				disabled="disabled" />研究机构 <input type="radio" name="OrgAttribute"
				id="qt" value="其他" style="height: 15px;"
				<% if(strOrgAttribute.equals("其他")) out.print("checked");%>
				disabled="disabled" />其他</td>
		</tr>
		<tr>
			<td>
				<!--*********************************************************************************************机构简介 -->
				<div>
					<span>*&nbsp;</span>机构简介
				</div>
			</td>
			<td colspan="3"><%=strOrgIntroduction%></td>
		</tr>
		<tr>
			<td style="height: 40px;">
				<div>
					<!--***************************************************************************************技术需求名称 -->
					<span>*&nbsp;</span>技术需求名称
				</div>
			</td>
			<td style="width: 380px;"><%=strOrgTechNeed%></td>
			<td style="width: 120px;">
				<div>
					<!--*****************************************************************************************需求时限 -->
					<span>*&nbsp;</span>需求时限
				</div>
			</td>
			<td><%=strOrgNeedTime%>年&nbsp;至&nbsp; <%=strOrgNeedTime1%>年</td>
		</tr>
		<tr>
			<td rowspan="3"><span>*&nbsp;</span>技术需求概述</td>
			<td colspan="3">1、主要问题:&nbsp;<%=strOrgScienceNeed%>
			</td>
		</tr>
		<tr>
			<td colspan="3">2、技术关键:&nbsp;<%=strOrgScienceNeed1%>
			</td>
		</tr>
		<tr>
			<td colspan="3">3、预期目标:&nbsp;<%=strOrgScienceNeed2%>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="border-top: none; height: 45px;">
				<!--************************************************************************************************关键字 -->
				<span>*&nbsp;</span>关键字(1-5个):&nbsp;<%=strOrgKey%>
			</td>
		</tr>
		<tr>
			<td style="width: 100px; height: 45px;">
				<div>
					<!--**********************************************************************************拟投入资金总额 -->
					拟投入资金总额
				</div>
			</td>
			<td colspan="3"><%=strOrgAllMoney%>&nbsp;万元</td>
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
				<% if(strOrgCooperation.equals("独立开发")) out.print("checked");%>
				disabled="disabled" />独立开发 <input type="radio" name="OrgCooperation"
				value="委托研发" style="height: 15px;"
				<% if(strOrgCooperation.equals("委托研发")) out.print("checked");%>
				disabled="disabled" />委托研发 <input type="radio" name="OrgCooperation"
				id="hz" value="合作开发" onclick="dlhz()" style="height: 15px;"
				<% if(strOrgCooperation.equals("合作开发")) out.print("checked");%>
				disabled="disabled" />合作开发 <input type="radio" name="OrgCooperation"
				value="其他" style="height: 15px;"
				<% if(strOrgCooperation.equals("其他")) out.print("checked");%>
				disabled="disabled" />其他</td>
		</tr>
		<tr>
			<td colspan="3">
				<!--*******************************************************************************************合作意向单位 -->
				合作意向单位:&nbsp;&nbsp;<%=strOrgCooperUnit%>
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
				<% if(strOrgResearchType.equals("基础研究")) out.print("checked");%>
				disabled="disabled" />基础研究 <input type="radio"
				name="OrgResearchType" id="w" value="应用研究" onclick="baseSur()"
				style="height: 15px;"
				<% if(strOrgResearchType.equals("应用研究")) out.print("checked");%>
				disabled="disabled" />应用研究 <input type="radio"
				name="OrgResearchType" id="e" value="试验发展" onclick="baseSur()"
				style="height: 15px;"
				<% if(strOrgResearchType.equals("试验发展")) out.print("checked");%>
				disabled="disabled" />试验发展 <input type="radio"
				name="OrgResearchType" id="r" value="研究发展与成果应用" onclick="baseSur()"
				style="height: 15px;"
				<% if(strOrgResearchType.equals("研究发展与成果应用")) out.print("checked");%>
				disabled="disabled" />研究发展与成果应用 <input type="radio"
				name="OrgResearchType" id="t" value="技术推广与科技服务" onclick="baseSur()"
				style="height: 15px;"
				<% if(strOrgResearchType.equals("技术推广与科技服务")) out.print("checked");%>
				disabled="disabled" />技术推广与科技服务 <input type="radio"
				name="OrgResearchType" id="y" value="生产性活动" onclick="baseSur()"
				style="height: 15px;"
				<% if(strOrgResearchType.equals("生产性活动")) out.print("checked");%>
				disabled="disabled" />生产性活动</td>
		</tr>
		<tr id="q1">
			<td>
				<div>
					<!--****************************************************************************学科分类（限基础研究填写） -->
					<span style="font-size: 15px; color: black;">学科分类</span><span
						style="font-size: 13px; color: black;">（限基础研究填写）</span>
				</div>
			</td>
			<td colspan="3"><%=strOrgSubject%></td>
		</tr>
		<tr id="w1">
			<td rowspan="1" style="height: 80px;">
				<!--**********************************************************************需求技术所属领域（非基础研究填写） -->
				<div>
					<span style="font-size: 15px; color: black;">需求技术所属领域</span><span
						style="font-size: 13px; color: black;">（非基础研究填写）</span>
				</div>
			</td>
			<td colspan="3" style="width: 500px;"><input type="checkbox"
				name="OrgTechArea" value="电子信息技术" style="height: 15px;"
				disabled="disabled" />电子信息技术 <input type="checkbox"
				name="OrgTechArea" value="光机电一体化" style="height: 15px;"
				disabled="disabled" />光机电一体化 <input type="checkbox"
				name="OrgTechArea" value="软件" style="height: 15px;"
				disabled="disabled" />软件 <input type="checkbox" name="OrgTechArea"
				value="生物制药技术" style="height: 15px;" disabled="disabled" />生物制药技术 <input
				type="checkbox" name="OrgTechArea" value="新材料及应用技术"
				style="height: 15px;" disabled="disabled" />新材料及应用技术 <input
				type="checkbox" name="OrgTechArea" value="先进制造技术"
				style="height: 15px;" disabled="disabled" />先进制造技术 <input
				type="checkbox" name="OrgTechArea" value="现代农业技术"
				style="height: 15px;" disabled="disabled" />现代农业技术 <input
				type="checkbox" name="OrgTechArea" value="新能源与高校节能技术"
				style="height: 15px;" disabled="disabled" />新能源与高校节能技术 <input
				type="checkbox" name="OrgTechArea" value="资源与环境保护新技术"
				style="height: 15px;" disabled="disabled" />资源与环境保护新技术 <input
				type="checkbox" name="OrgTechArea" id="otherTe" value="其他技术（注明）"
				onclick="otherTech()" style="height: 15px;" disabled="disabled" />其他技术（注明）&nbsp;&nbsp;&nbsp;&nbsp;（可多选）
				<div id="otherTe1" style="display: none; text-align: left;">
					<input type="text" name="OrgOtherTech" id="OrgOtherTech"
						style="width: 700px; border: 1px solid green; height: 15px;" />
				</div></td>
		</tr>
		<tr id="w2">
			<td>
				<!--**************************************************************************需求技术应用行业（非基础研究填写） -->
				<div>
					<span style="font-size: 15px; color: black;">需求技术应用行业</span><span
						style="font-size: 13px; color: black;">（非基础研究填写）</span>
				</div>
			</td>
			<td colspan="3"><%=strOrgTechWork%></td>
		</tr>

	</table>
	<br />
	<div>
		<a href="javascript:history.back(-1)" target="_self"><input
			type="submit" name="submit" value="返回"
			style="font-size: 20px; height: 35px; background-color: DeepSkyBlue; color: white;" /></a>
	</div>
	<br />
	<br />
</body>
</html>