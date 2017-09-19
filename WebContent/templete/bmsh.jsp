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
		request.setCharacterEncoding("utf-8");
		Database db = new Database();
		
		String strUserName = (String)request.getSession().getAttribute("user_in_session"); 
		String beizhu = "";
		String sql1 = "select * from UserTable where UserName = '"+strUserName+"'";
		ResultSet rs1 = db.executeQuery(sql1);
		while(rs1.next()){
			beizhu = rs1.getString("beizhu");
		}
		
		String sql="select OrgInformation.*,XSSH.*,BMSH.* from OrgInformation,XSSH,BMSH where BMSH.OrgBMName = '"+beizhu+"' and XSSH.OrgXSSH = '通过' and BMSH.OrgBMSH = '未审核' and OrgInformation.OrgNeedNum = XSSH.OrgNeedNum and OrgInformation.OrgNeedNum = BMSH.OrgNeedNum";
		ResultSet rs=db.sel(sql);
		
		int intPageSize; //一页显示的记录数
		int intRowCount; //记录的总数
		int intPageCount; //总页数
		int intPage; //待显示的页码
		String strPage;
		int i;
		//设置一页显示的记录数
		intPageSize =8;
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
	%>
	<table style="width: 900px;">
		<tr>
			<td style="height: 100px; text-align: center;"><span
				style="font-size: 30px; color: black;">河北省重大技术需求征集未审核清单</span></td>
		</tr>
	</table>
	<table style="width: 1100px;">
		<tr style="background-color: DodgerBlue;">
			<td style="width: 15%;"><span>需求编号</span></td>
			<td><span>技术需求名称 </span></td>
			<td style="width: 15%;"><span>归口管理部门</span></td>
			<td style="width: 15%;"><span>填报时间 </span></td>
			<td style="width: 10%;"><span>查看原件</span></td>
		</tr>
		<% 
			i = 0;
			if(rs.getRow()!=0)
			{
				while(i < intPageSize && !rs.isAfterLast())
				{
					out.println(
							"<tr style='border-bottom: 1px solid black; background-color: white; font-size: 14px;'>"+
							"<td>"+rs.getString("OrgNeedNum")+"</td>"+
							"<td style='text-align: left;'>"+rs.getString("OrgTechNeed")+"</td>"+
							"<td>"+rs.getString("OrgPutunder")+"</td>"+
							"<td>"+rs.getString("OrgNeedNum").substring(1, 5)+"-"+rs.getString("OrgNeedNum").substring(5, 7)+"-"+rs.getString("OrgNeedNum").substring(7, 9)+"</td>"+
							"<td>"+"<a href='sh/bmtable.jsp?OrgNeedNum="+rs.getString("OrgNeedNum")+"' target='_self'>"+"查看"+"</a>"+
							"</td>"+
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
			<td colspan="11" align="center">共<span class="fenye"><%=intRowCount%></span>条,
				当前第<span class="fenye"><%=intPage%></span>页&nbsp;/&nbsp; 共<span
				class="fenye"><%=intPageCount%></span>页 <a
				href='templete/bmsh.jsp?page=<%=intPage-1%>'><span class="fenye">上一页</span></a>
				<span class="fenye"> <%
	                 	for (int j = 1; j <= intPageCount; j++) {
	                 		out.print("&nbsp;<a href='templete/bmsh.jsp?page="+j+"'>"+j+"</a>");
	                 	}
	                 %>
			</span> <a href='templete/bmsh.jsp?page=<%=intPage+1%>'><span
					class="fenye">下一页</span></a>
			</td>
		</tr>
	</table>
</body>
</html>