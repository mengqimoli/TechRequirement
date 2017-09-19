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
<script type="text/javascript" src="js/suoyin.js"></script>

<script src="laydate/laydate.js"></script>
<script type="text/javascript">
	function Check1(){
		var shlx = document.getElementById("shlx");
		var shzt = document.getElementById("shzt");
		if(shlx.value != "" && shzt.value ==""){
			alert("请选择审核状态!");
			return false;
		}
		else{
			return true;
		}
	}
</script>
<style type="text/css">
table {
	border-collapse: collapse;
	margin: 0 auto;
}

table, th, td {
	border: 0px solid black;
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
	font-size: 15px;
	color: white;
}

.fenye {
	color: red;
}
</style>
</head>
<body>
	<% 
		Database db = new Database();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String shlx = "";
		String shzt = "";
		String OrgBMName = "";
		String tbTime1 = "";
		String tbTime2 = "";
		String OrgPutunder = "";
		String OrgArea = "";
		String jgsx1 = "";
		String jsxujjfs1 = "";
		String kjhdlx1 = "";
		String sjsy = "";
		String gjz = "";
		
		String strSql = "";
		
		strSql = "select OrgInformation.*,XSSH.*,BMSH.* from OrgInformation,XSSH,BMSH where OrgInformation.OrgNeedNum = XSSH.OrgNeedNum and OrgInformation.OrgNeedNum = BMSH.OrgNeedNum";
		
		shlx = request.getParameter("shlx");
		shzt = request.getParameter("shzt");
		
		if(shlx != null && shlx != ""){
			shlx = new String(shlx.getBytes("ISO-8859-1"),"utf-8");
			if("形式审核".equals(shlx)){
				shzt = new String(shzt.getBytes("ISO-8859-1"),"utf-8");
				strSql = "select OrgInformation.*,XSSH.*,BMSH.* from OrgInformation,XSSH,BMSH where OrgInformation.OrgNeedNum = XSSH.OrgNeedNum and OrgInformation.OrgNeedNum = BMSH.OrgNeedNum and XSSH.OrgXSSH = '"+shzt+"'";
			}
			else if("部门审核".equals(shlx))
			{
				strSql = "select OrgInformation.*,BMSH.*,XSSH.* from OrgInformation,XSSH,BMSH where OrgInformation.OrgNeedNum = XSSH.OrgNeedNum and OrgInformation.OrgNeedNum = BMSH.OrgNeedNum";
				if(shzt != null && shzt != ""){
					shzt = new String(shzt.getBytes("ISO-8859-1"),"utf-8");
					strSql += " and BMSH.OrgBMSH = '"+shzt+"'";
				}
				OrgBMName = request.getParameter("OrgBMName");
				if(OrgBMName != null && OrgBMName != ""){
					OrgBMName = new String(OrgBMName.getBytes("ISO-8859-1"),"utf-8");
					strSql += " and BMSH.OrgBMName = '"+OrgBMName+"'";
				}
			}
		}
		
		OrgPutunder = request.getParameter("OrgPutunder");
		if(OrgPutunder != null && OrgPutunder != ""){
			OrgPutunder = new String(OrgPutunder.getBytes("ISO-8859-1"),"utf-8");
			strSql += " and OrgInformation.OrgPutunder = '"+OrgPutunder+"'";
		}
		
		OrgArea = request.getParameter("OrgArea");
		if(OrgArea != null && OrgArea != ""){
			OrgArea = new String(OrgArea.getBytes("ISO-8859-1"),"utf-8");
			strSql += " and OrgInformation.OrgArea = '"+OrgArea+"'";
		}
		
		jgsx1 = request.getParameter("jgsx1");
		if(jgsx1 != null && jgsx1 != ""){
			jgsx1 = new String(jgsx1.getBytes("ISO-8859-1"),"utf-8");
			strSql += " and OrgInformation.OrgAttribute = '"+jgsx1+"'";
		}
		
		jsxujjfs1 = request.getParameter("jsxujjfs1");
		if(jsxujjfs1 != null && jsxujjfs1 != ""){
			jsxujjfs1 = new String(jsxujjfs1.getBytes("ISO-8859-1"),"utf-8");
			strSql += " and OrgInformation.OrgCooperation = '"+jsxujjfs1+"'";
		}
		
		kjhdlx1 = request.getParameter("kjhdlx1");
		if(kjhdlx1 != null && kjhdlx1 != ""){
			kjhdlx1 = new String(kjhdlx1.getBytes("ISO-8859-1"),"utf-8");
			strSql += " and OrgInformation.OrgResearchType = '"+kjhdlx1+"'";
		}
		
		gjz = request.getParameter("gjz");
		if(gjz != null && gjz != ""){
			gjz = new String(gjz.getBytes("ISO-8859-1"),"utf-8");
			strSql += " and OrgInformation.OrgKey = '"+gjz+"'";
		}
		
		tbTime1 = request.getParameter("tbTime1");
		tbTime2 = request.getParameter("tbTime2");
		String tt1 = "";
		String tt2 = "";
		if(tbTime1 != null && tbTime1 != "" && tbTime2 != null && tbTime2 != ""){
			sjsy =  request.getParameter("sjsy");
			sjsy = new String(sjsy.getBytes("ISO-8859-1"),"utf-8");
			if("填报日期".equals(sjsy)){
				tt1 = tbTime1.substring(0, 4) + tbTime1.substring(5, 7) + tbTime1.substring(8, 10) ;
				tt2 = tbTime2.substring(0, 4) + tbTime2.substring(5, 7) + tbTime2.substring(8, 10) ;
				if(tbTime1.equals(tbTime2)){
					strSql += " and substring(OrgInformation.OrgNeedNum,2,8) = '"+tt1+"'";
				}else{
					
					strSql += " and substring(OrgInformation.OrgNeedNum,2,8)  >= '"+tt1+
							"' and substring(OrgInformation.OrgNeedNum,2,8) <= '"+tt2+"'";
				}
			}else if("需求时限".equals(sjsy)){ 
				tt1 = tbTime1.substring(0, 4);
				tt2 = tbTime2.substring(0, 4);
				if(tbTime1.equals(tbTime2)){
					strSql += " and OrgNeedTime = '"+tt1+"'";
				}else{
					
					strSql += " and OrgNeedTime >= '"+tt1+
							"' and OrgNeedTime1 <= '"+tt2+"'";
				}
			}
		}
	%>
	<table style="width: 1100px;">
		<tr>
			<td style="height: 100px; text-align: center;"><span
				style="font-size: 30px; color: black;">河北省重大技术需求征集系统</span></td>
		</tr>
	</table>
	<form action="templete/tongji1.jsp" name="tongji2Form" method="get">
		<table style="width: 1100px;">
			<tr>
				<td style="width: 80px; text-align: left;"><span
					style="color: MediumBlue; font-size: 16px;">审核类型：</span></td>
				<td style="width: 100px; text-align: left;"><select name="shlx"
					id="shlx" style="width: 100px;" onchange="sylx123()">
						<option value=""></option>
						<option value="形式审核">形式审核</option>
						<option value="部门审核">部门审核</option>
				</select></td>
				<td style="width: 210px;"><span id="kkk"> <select
						style="width: 150px; height: 23px;">
							<option value=""></option>
					</select>
				</span> <span id="shshzt1" style="display: none;"> <select
						name="shzt" id="shzt" style="width: 150px;">
							<option value=""></option>
							<option value="未审核">未审核</option>
							<option value="未通过">未通过</option>
							<option value="通过">通过</option>
					</select>
				</span></td>
				<td style="text-align: left;">
					<div id="glcs" style="display: none">
						<select name="OrgBMName" id="OrgBMName">
							<%
							String sql3="select * from GLCS";
							ResultSet rs3=db.executeQuery(sql3);
							while(rs3.next()){
							out.println("<option value="+rs3.getString(2)+">"+rs3.getString(2)+"</option>");
							}
							rs3.close();
						%>
						</select>
					</div>
				</td>
			</tr>
		</table>
		<table style="width: 1100px;">
			<tr>
				<td style="width: 80px; text-align: left;"><span
					style="color: MediumBlue; font-size: 16px;">索引类型：</span></td>
				<td style="width: 313px; text-align: left;">归口管理部门 <select
					name="OrgPutunder" id="OrgPutunder" style="width: 150px">
						<option value=""></option>
						<%
						String sql1="select * from Putunder";
						ResultSet rs1=db.executeQuery(sql1);
						while(rs1.next()){
						out.println("<option value="+rs1.getString(2)+">"+rs1.getString(2)+"</option>");
						}
						rs1.close();
					%>
				</select>
				</td>
				<td style="text-align: left; width: 300px;">所在地域 <select
					name="OrgArea" id="OrgArea" style="width: 150px">
						<option value=""></option>
						<%
						String sql2="select * from AreaCode";
						ResultSet rs2=db.executeQuery(sql2);
						while(rs2.next()){
						out.println("<option value="+rs2.getString(2)+">"+rs2.getString(2)+"</option>");
						}
						rs2.close();
					%>
				</select>
				</td>
				<td style="text-align: left;">机构属性 <select name="jgsx1"
					id="jgsx1" style="width: 150px">
						<option value=""></option>
						<option value="企业">企业</option>
						<option value="高等院校">高等院校</option>
						<option value="研究机构">研究机构</option>
						<option value="其他">其他</option>
				</select>
				</td>
			</tr>
			<tr>
				<td></td>
				<td style="text-align: left;">技术需求解决方式 <select name="jsxujjfs1"
					id="jsxujjfs1" style="width: 150px">
						<option value=""></option>
						<option value="独立开发">独立开发</option>
						<option value="委托开发">委托开发</option>
						<option value="合作开发">合作开发</option>
						<option value="其他">其他</option>
				</select>
				</td>
				<td style="text-align: left;">科技活动类型 <select name="kjhdlx1"
					id="kjhdlx1" style="width: 150px">
						<option value=""></option>
						<option value="基础研究">基础研究</option>
						<option value="应用研究">应用研究</option>
						<option value="试验发展">试验发展</option>
						<option value="研究发展与成果应用">研究发展与成果应用</option>
						<option value="技术推广与科技服务">技术推广与科技服务</option>
						<option value="生产性活动 ">生产性活动</option>
				</select>
				</td>
				<td style="text-align: left;">关键字 <input type="text" name="gjz"
					id="gjz" width="150px;" />
				</td>
			</tr>
			<tr>
				<td style="text-align: left;"><span
					style="color: MediumBlue; font-size: 16px;">时间索引：</span></td>
				<td style="text-align: left;" colspan="3"><select name="sjsy"
					id="sjsy" style="width: 100px">
						<option value="需求时限">需求时限</option>
						<option value="填报日期 ">填报日期</option>
				</select> &nbsp;&nbsp; <input onClick="laydate()" type="text" name="tbTime1"
					id="tbTime1" style="width: 150px;" /> &nbsp;-&nbsp; <input
					type="text" name="tbTime2" id="tbTime2" style="width: 150px;" />&nbsp;
					<input type='submit' name='submit' id="submit" value='查询'
					class="btn" onclick="return Check1()" />&nbsp; <a
					href="templete/tongji.jsp" target="_self"><input type='button'
						name="button" id="button" value='显示全部' class="btn" /></a></td>
			</tr>
			<tr>
				<td
					style="text-align: left; height: 10px; font-size: 15px; color: MidnightBlue"
					colspan="4">
					<%
				String cxtj = "查询条件：";
				if(shlx != null && shlx != ""){
					cxtj += shlx + ">";
				}
				if(shzt != null && shzt != ""){
					cxtj += shzt + ">";
				}
				if(OrgBMName != null && OrgBMName != ""){
					cxtj += OrgBMName + ">";
				}
				if(OrgPutunder != null && OrgPutunder != ""){
					cxtj += OrgPutunder + ">";
				}
				if(OrgArea != null && OrgArea != ""){
					cxtj += OrgArea + ">";
				}
				if(jgsx1 != null && jgsx1 != ""){
					cxtj += jgsx1 + ">";
				}
				if(jsxujjfs1 != null && jsxujjfs1 != ""){
					cxtj += jsxujjfs1 + ">";
				}
				if(kjhdlx1 != null && kjhdlx1 != ""){
					cxtj += kjhdlx1 + ">";
				}
				if(gjz != null && gjz != ""){
					cxtj += gjz + ">";
				}
				if(tbTime1 != null && tbTime1 != "" && tbTime2 != null && tbTime2 != ""){
					cxtj += sjsy +"："+ request.getParameter("tbTime1") +"-" + request.getParameter("tbTime2");
				}
			%> <%=cxtj %>
				</td>
			</tr>
		</table>
		<script>
;!function(){
laydate({
   elem: '#tbTime2'
})
}();
</script>
	</form>
	<table style="width: 1100px;">
		<tr style="background-color: DodgerBlue;">
			<td style="width: 15%"><span>需求编号</span></td>
			<td><span>技术需求名称 </span></td>
			<td style="width: 15%"><span>填报时间 </span></td>
			<td style="width: 10%"><span>形式审核 </span></td>
			<td style="width: 10%"><span>部门审核 </span></td>
			<td style="width: 10%"><span>管理处室 </span></td>
			<td style="width: 8%"><span>征集表 </span></td>
		</tr>
		<%
			ResultSet rs=db.sel(strSql);
			System.out.println(strSql);
			
			int intPageSize; //一页显示的记录数
			int intRowCount; //记录的总数
			int intPageCount; //总页数
			int intPage; //待显示的页码
			String strPage;
			int i;
			//设置一页显示的记录数
			intPageSize = 6;
			//取得待显示的页码
			strPage = request.getParameter("page");
			//判断strPage是否等于null,如果是，显示第一页数据
			if (strPage == null) {
			    intPage = 1;
			} else {
			    //将字符串转换为整型
			    intPage = java.lang.Integer.parseInt(strPage);
			}
			if (intPage < 1) {
			    intPage = 1;
			}
			//获取记录总数
			rs.last();
		    intRowCount = rs.getRow();
			//计算机总页数
			intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
			//调整待显示的页码
			if (intPage > intPageCount)
			    intPage = intPageCount;
			if (intPageCount > 0) {
			    //将记录指针定位到待显示页的第一条记录上
			    rs.absolute((intPage - 1) * intPageSize + 1);
			}
			
			i = 0;
			if(rs.getRow()!=0)
			{
				while(i < intPageSize && !rs.isAfterLast())
				{
					out.println(
						"<tr style='border-bottom: 1px solid black; background-color: white; font-size: 14px;'>"+
						"<td>"+rs.getString("OrgNeedNum")+"</td>"+
						"<td style='text-align: left'>"+rs.getString("OrgTechNeed")+"</td>"+
						"<td>"+rs.getString("OrgNeedNum").substring(1, 5)+"-"+rs.getString("OrgNeedNum").substring(5, 7)+"-"+rs.getString("OrgNeedNum").substring(7, 9)+"</td>"+
						"<td>"+rs.getString("OrgXSSH")+"</td>"+
						"<td>"+rs.getString("OrgBMSH")+"</td>"+
						"<td>"+rs.getString("OrgBMName")+"</td>"+
						"<td>"+"<a href='sh/shtable.jsp?OrgNeedNum="+rs.getString("OrgNeedNum")+"' target='_self'>"+"查看"+"</a>"+"</td>"+
						"</tr>"
						);
					rs.next();
				    i++;
				}
			}
			rs.close();  
			db.close();
		%>
		<tr>
			<td colspan="7" align="center">共<span class="fenye"><%=intRowCount%></span>条,
				当前第<span class="fenye"><%=intPage%></span>页&nbsp;/&nbsp; 共<span
				class="fenye"><%=intPageCount%></span>页 <a
				href='templete/tongji1.jsp?page=<%=intPage-1%>&shlx=<%=shlx%>&shzt=<%=shzt%>&OrgBMName=<%=OrgBMName%>&tbTime1=<%=tbTime1%>&tbTime2=<%=tbTime2%>&OrgPutunder=<%=OrgPutunder%>&OrgArea=<%=OrgArea%>&jgsx1=<%=jgsx1%>&jsxujjfs1=<%=jsxujjfs1%>&kjhdlx1=<%=kjhdlx1%>&sjsy=<%=sjsy%>&gjz=<%=gjz%>'>
					<span class="fenye">上一页</span>
			</a> <span class="fenye"> <%
	                 	for (int j = 1; j <= intPageCount; j++) {
	                 		out.print("&nbsp;<a href='templete/tongji2.jsp?page="+j+"&shlx="+shlx+"&shzt="+shzt+"&OrgBMName="+OrgBMName+"&tbTime1="+tbTime1+"&tbTime2="+tbTime2+"&OrgPutunder="+OrgPutunder+"&OrgArea="+OrgArea+"&jgsx1="+jgsx1+"&jsxujjfs1="+jsxujjfs1+"&kjhdlx1="+kjhdlx1+"&sjsy="+sjsy+"&gjz="+gjz+"'>"+j+"</a>");
	                 	}
	                 %>
			</span> <a
				href='templete/tongji1.jsp?page=<%=intPage+1%>&shlx=<%=shlx%>&shzt=<%=shzt%>&OrgBMName=<%=OrgBMName%>&tbTime1=<%=tbTime1%>&tbTime2=<%=tbTime2%>&OrgPutunder=<%=OrgPutunder%>&OrgArea=<%=OrgArea%>&jgsx1=<%=jgsx1%>&jsxujjfs1=<%=jsxujjfs1%>&kjhdlx1=<%=kjhdlx1%>&sjsy=<%=sjsy%>&gjz=<%=gjz%>'>
					<span class="fenye">下一页</span>
			</a>
			</td>
		</tr>
	</table>
</body>
</html>