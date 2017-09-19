<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
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
<script type="text/javascript" src="js/table.js"></script>
<script type="text/javascript" src="sanji/sanji.js"></script>
<script type="text/javascript" src="sanji/sanji1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	getFirst_xq('OrgTechWork1');
	getFirst_xk('OrgSubject1');
});
</script>
<script type="text/javascript">
	
	
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
	<%
		request.setCharacterEncoding("utf-8");
		Database db = new Database();
		
		String strUserName = "";
		String strOrgNum = "";
		String strOrgName = "";
		String strOrgAddress = "";
		String strOrgURL = "";
		String strOrgEmail = "";
		String strOrgZip = "";
		String strOrgLaw = "";
		String strOrgPutunder = "";
		String strOrgArea = "";
		String strOrgContacts = "";
		String strOrgFixedPhone = "";
		String strOrgPhone = "";
		String strOrgPortraiture = "";
		String strOrgAttribute = "";
		String strOrgIntroduction = "";
		/* ************************************************************************************获得session中的UserName */
		strUserName = (String)request.getSession().getAttribute("user_in_session") ;
		
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
		strSql11 = "select * from OrgInformation where UserName = '"+strUserName+"'";
		ResultSet rs11=db.executeQuery(strSql11);
		if(rs11.next())
		{
			strOrgPutunder = rs11.getString("OrgPutunder");
			strOrgAddress = rs11.getString("OrgAddress");
			strOrgArea = rs11.getString("OrgArea");
			strOrgURL = rs11.getString("OrgURL");
			strOrgEmail = rs11.getString("OrgEmail");
			strOrgLaw = rs11.getString("OrgLaw");
			strOrgContacts = rs11.getString("OrgContacts");
			strOrgFixedPhone = rs11.getString("OrgFixedPhone");
			strOrgPhone = rs11.getString("OrgPhone");
			strOrgPortraiture = rs11.getString("OrgPortraiture");
			strOrgAttribute = rs11.getString("OrgAttribute");
			strOrgIntroduction = rs11.getString("OrgIntroduction");
			
		} 
		rs11.close();
		
		String strSql22 = "";
		int xunum = 0;
		String xuNum = "";
		strSql22 = "select * from OrgInformation";
		ResultSet rs22 = db.executeQuery(strSql22);
		while(rs22.next()){
			xunum++;
		}
		if(xunum < 10){
			xuNum = "000" + xunum;
		}
		else if(xunum < 100){
			xuNum = "00" + xunum;
		}
		else if(xunum < 1000){
			xuNum = "0" + xunum;
		}
		String strOrgNeedNum = new SimpleDateFormat("yyyyMMddhh").format(Calendar.getInstance().getTime());
		strOrgNeedNum = "T" + strOrgNeedNum + xuNum; 
		 
	%>
	<!-- **********************************************************************************************************表格 -->
	<br />
	<table style="border: none;">
		<tr>
			<td style="border: none; text-align: center; font-size: 30px;">
				河北省重大技术需求征集表</td>
		</tr>
	</table>
	<!-- <table style="border: none;">
		<tr>
			<td style="border: none; font-size: 16px; text-align: right;">
				带<span>&nbsp;*&nbsp;</span>为必填内容!
			</td>
		</tr>
	</table> -->
	<table style="border: none;">
		<tr>
			<td
				style="width: 100px; height: 50px; text-align: left; border: none;">&nbsp;&nbsp;&nbsp;&nbsp;机构代码</td>
			<td style="width: 500px; border: none;"><span
				style="color: blue;"><%=strOrgNum%></span> <span
				style="color: red; font-size: 17px;">${msg}</span></td>
			<td style="width: 80px; text-align: center; border: none;">需求编号</td>
			<td style="border: none;"><span style="color: blue;"><%=strOrgNeedNum%></span>
			</td>
		</tr>
	</table>
	<form action="tableServlet?OrgNeedNum=<%=strOrgNeedNum%>"
		id="tableform" name="tableform" method="post" target="_self">
		<table>
			<tr>
				<td style="width: 120px;">
					<div>
						<!--*****************************************************************************************机构全称 -->
						<span>*&nbsp;</span>机构全称
					</div>
				</td>
				<td style="width: 40%;"><input type="text" name="OrgName"
					id="OrgName" style="width: 99.5%;" value="<%=strOrgName%>" readonly />
				</td>
				<td style="width: 120px;">
					<div>
						<!--**************************************************************************************归口管理部门-->
						归口管理部门
					</div>
				</td>
				<td>
					<div>
						<select name="OrgPutunder" id="OrgPutunder" style="width: 200px">
							<option value="<%=strOrgPutunder %>" selected="selected"><%=strOrgPutunder %></option>
							<%
							String sql1="select * from Putunder";
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
					style="width: 99.5%" value="<%=strOrgAddress%>" /></td>
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
							String sql2="select * from AreaCode";
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
					<div>网 址</div>
				</td>
				<td><input type="text" name="OrgURL" id="OrgURL"
					style="width: 99.5%;" value="<%=strOrgURL%>" /></td>
				<td>
					<div>
						<!--******************************************************************************************电子邮箱 -->
						<span>*&nbsp;</span>电子信箱
					</div>
				</td>
				<td><input type="text" name="OrgEmail" id="OrgEmail"
					style="width: 99.5%" value="<%=strOrgEmail%>" /></td>
			</tr>
			<tr>
				<td>
					<div>
						<!--*****************************************************************************************************法人代表 -->
						<span>*&nbsp;</span>法人代表
					</div>
				</td>
				<td><input type="text" name="OrgLaw" id="OrgLaw"
					style="width: 99.5%" value="<%=strOrgLaw%>" /></td>
				<td>
					<div>
						<!--*******************************************************************************************邮政编码 -->
						邮政编码
					</div>
				</td>
				<td><input type="text" name="OrgZip" id="OrgZip"
					style="width: 99.5%" value="<%=strOrgZip%>" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<!--*******************************************************************************************联系人 -->
						<span>*&nbsp;</span>联系人
					</div>
				</td>
				<td><input type="text" name="OrgContacts" id="OrgContacts"
					style="width: 99.5%;" value="<%=strOrgContacts%>" /></td>
				<td>
					<div>
						<!--*******************************************************************************************电话 -->
						固定电话
					</div>
				</td>
				<td><input type="text" name="OrgFixedPhone" id="OrgFixedPhone"
					style="width: 99.5%"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')"
					value="<%=strOrgFixedPhone%>" /></td>
			</tr>
			<tr>
				<td>
					<div>
						<span>*&nbsp;</span>手 机
					</div>
				</td>
				<td><input type="text" name="OrgPhone" id="OrgPhone"
					style="width: 99.5%"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')"
					value="<%=strOrgPhone%>" /></td>
				<td>
					<div>
						<!--***********************************************************************************************传真 -->
						传 真
					</div>
				</td>
				<td><input type="text" name="OrgPortraiture"
					id="OrgPortraiture" style="width: 99.5%"
					value="<%=strOrgPortraiture%>" /></td>
			</tr>
			<tr>
				<td style="height: 40px;">
					<div>
						<!-- *********************************************************************************************************机构属性 -->
						<span>*&nbsp;</span>机构属性
					</div>
				</td>
				<td colspan="3"><input type="radio" name="OrgAttribute"
					value="企业" style="height: 15px;" checked="checked"
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

					<div style="text-align: left;">
						<span>*&nbsp;</span>机构简介（主要包括基本情况、现有研究基础等，限500字以内）<span
							id="OrgIntroduction1">0</span><span style="color: black">/500</span>
						<textarea onkeyup="Introduction()" id="OrgIntroduction"
							name="OrgIntroduction" rows="5" cols="107"><%=strOrgIntroduction %></textarea>
					</div>
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
					style="width: 99.5%" /></td>
				<td style="width: 100px;">
					<div>
						<!--*****************************************************************************************需求时限 -->
						<span>*&nbsp;</span>需求时限
					</div>
				</td>
				<td><input type="text" name="OrgNeedTime" id="OrgNeedTime"
					style="width: 100px;"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')" />年至 <input
					type="text" name="OrgNeedTime1" id="OrgNeedTime1"
					style="width: 100px;"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')" />年</td>
			</tr>
			<tr>
				<!--*****************************************************************************************技术需求概述 -->
				<td colspan="4"><span>*&nbsp;</span>技术需求概述
					<div style="text-align: left;">
						1、主要问题（需要解决的重大技术问题，限500字以内）<span id="OrgScienceNeed00">0</span><span
							style="color: black">/500</span>
					</div> <textarea onkeyup="ScienceNeed()" cols="107" rows="5"
						id="OrgScienceNeed" name="OrgScienceNeed"></textarea></td>
			</tr>
			<tr>
				<td colspan="4">2、技术关键（所需的关键技术、主要指标，限500字以内）<span
					id="OrgScienceNeed11">0</span><span style="color: black">/500</span>
					<textarea onkeyup="ScienceNeed1()" cols="107" rows="5"
						id="OrgScienceNeed1" name="OrgScienceNeed1"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">3、预期目标（技术创新性、经济社会效益，限500字以内）<span
					id="OrgScienceNeed22">0</span><span style="color: black">/500</span>
					<textarea onkeyup="ScienceNeed2()" cols="107" rows="5"
						id="OrgScienceNeed2" name="OrgScienceNeed2"></textarea>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td style="width: 18%; height: 50px;">
					<div>
						<span>*&nbsp;</span>关键字(1-5个):
					</div>
				</td>
				<td style="border-top: none;">
					<!--************************************************************************************************关键字 -->
					<input type="text" name="OrgKey1" id="OrgKey1"
					style="width: 100px; border: 1px solid black;" onblur="key1()" /> <input
					type="text" name="OrgKey2" id="OrgKey2"
					style="background-color: LightGrey; width: 100px; border: 1px solid black;"
					readonly="readonly" onblur="key2()" /> <input type="text"
					name="OrgKey3" id="OrgKey3"
					style="background-color: LightGrey; width: 100px; border: 1px solid black;"
					readonly="readonly" onblur="key3()" /> <input type="text"
					name="OrgKey4" id="OrgKey4"
					style="background-color: LightGrey; width: 100px; border: 1px solid black;"
					readonly="readonly" onblur="key4()" /> <input type="text"
					name="OrgKey5" id="OrgKey5"
					style="background-color: LightGrey; width: 100px; border: 1px solid black;"
					readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td style="height: 40px;">
					<div>
						<!--**********************************************************************************拟投入资金总额 -->
						拟投入资金总额
					</div>
				</td>
				<td><input type="text" name="OrgAllMoney" id="OrgAllMoney"
					style="width: 605px; text-align: center"
					onkeyup="value=value.replace(/[^\d.]/g,'')" /> 万元</td>
			</tr>
			<tr>
				<td rowspan="2" style="height: 80px;">
					<div>
						<!--***********************************************************************************技术需求解决方式 -->
						<span>*&nbsp;</span>技术需求解决方式
					</div>
				</td>
				<td><input type="radio" name="OrgCooperation" id="dlkf"
					value="独立开发" onclick="dlhz()" style="height: 15px;"
					checked="checked" />独立开发 <input type="radio" name="OrgCooperation"
					id="tykf" value="委托研发" onclick="dlhz()" style="height: 15px;" />委托研发
					<input type="radio" name="OrgCooperation" id="hzkf" value="合作开发"
					onclick="dlhz()" style="height: 15px;" />合作开发 <input type="radio"
					name="OrgCooperation" id="qtkf" value="其他" onclick="dlhz()"
					style="height: 15px;" />其他</td>
			</tr>
			<tr>
				<td>
					<!--*******************************************************************************************合作意向单位 -->
					合作意向单位 <input type="text" name="OrgCooperUnit" id="OrgCooperUnit"
					style="width: 510px; background-color: LightGrey; text-align: center;"
					readonly="readonly" /> （选填）
				</td>
			</tr>
			<tr>
				<td style="height: 50px;">
					<div>
						<!--***********************************************************************************科技活动类型 -->
						<span>*&nbsp;</span>科技活动类型
					</div>
				</td>
				<td><input type="radio" name="OrgResearchType" id="q"
					value="基础研究" onclick="baseSur()" style="height: 15px;"
					checked="checked" />基础研究 <input type="radio" name="OrgResearchType"
					id="w" value="应用研究" onclick="baseSur()" style="height: 15px;" />应用研究
					<input type="radio" name="OrgResearchType" id="e" value="试验发展"
					onclick="baseSur()" style="height: 15px;" />试验发展 <input
					type="radio" name="OrgResearchType" id="r" value="研究发展与成果应用"
					onclick="baseSur()" style="height: 15px;" />研究发展与成果应用 <input
					type="radio" name="OrgResearchType" id="t" value="技术推广与科技服务"
					onclick="baseSur()" style="height: 15px;" />技术推广与科技服务 <input
					type="radio" name="OrgResearchType" id="y" value="生产性活动"
					onclick="baseSur()" style="height: 15px;" />生产性活动</td>
			</tr>
			<tr id="q1">
				<td style="height: 50px;">
					<div>
						<!--****************************************************************************学科分类（限基础研究填写） -->
						<span>*&nbsp;</span><span style="font-size: 15px; color: black;">学科分类</span>
					</div>
					<div>
						<span style="font-size: 13px; color: black;">（限基础研究填写）</span>
					</div>
				</td>
				<td>
					<div>
						<select name="OrgSubject1" id="OrgSubject1"
							onchange="changefirst_xk()"><option value=""></option>
						</select> <select name="OrgSubject2" id="OrgSubject2"
							onchange="changesecond_xk()"></select> <select name="OrgSubject3"
							id="OrgSubject3"></select>
					</div>
				</td>
			</tr>
			<tr id="w1" style="display: none">
				<td style="height: 80px; width: 150px;">
					<!--**********************************************************************需求技术所属领域（非基础研究填写） -->
					<div>
						<span>*&nbsp;</span><span style="font-size: 15px; color: black;">需求技术所属领域</span>
					</div>
					<div>
						<span style="font-size: 13px; color: black;">（非基础研究填写）</span>
					</div>
				</td>
				<td style="width: 500px;"><input type="checkbox"
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
			<tr id="w2" style="display: none">
				<td style="height: 50px;">
					<!--**************************************************************************需求技术应用行业（非基础研究填写） -->
					<div>
						<span>*&nbsp;</span><span style="font-size: 15px; color: black;">需求技术应用行业</span>
					</div>
					<div>
						<span style="font-size: 13px; color: black;">（非基础研究填写）</span>
					</div>
				</td>
				<td>
					<div>
						<select name="OrgTechWork1" id="OrgTechWork1"
							onchange="changefirst_xq()"><option value=""></option></select> <select
							name="OrgTechWork2" id="OrgTechWork2"
							onchange="changesecond_xq()"></select> <select
							name="OrgTechWork3" id="OrgTechWork3"></select>
					</div>
				</td>
			</tr>
		</table>
		<br />
		<br />
		<div>
			<input type="submit" name="submit" value="保存并提交"
				style="font-size: 20px; height: 35px; background-color: DeepSkyBlue; color: white;"
				onclick="return Check1()" />
		</div>
	</form>
	<br />
	<br />
	<br />
</body>
</html>