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
<script src="laydate/laydate.js"></script>
<script type="text/javascript">
	function Check1(){
		var sure = confirm("确认删除?");
		if(sure == true){
			return true;
		}else{
			return false;
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
	String strUserName = (String)request.getSession().getAttribute("user_in_session") ;
	Database db = new Database();
	request.setCharacterEncoding("utf-8");
	
	String OrgTechNeed = "";
	String tbTime1 = "";
	String tbTime2 = "";
	String zhuangtai = "";
	String bianji = "";
	String xiangqing = "";
	String shanchu = "";
	String chakansh = "";
	
	String sql = "select OrgInformation.*,XSSH.*,BMSH.* from OrgInformation,XSSH,BMSH where OrgInformation.UserName = '"+strUserName+"' and OrgInformation.OrgNeedNum = XSSH.OrgNeedNum and OrgInformation.OrgNeedNum = BMSH.OrgNeedNum ";
	
	OrgTechNeed = request.getParameter("OrgTechNeed");
	if(OrgTechNeed != null && OrgTechNeed != ""){
		sql += " and OrgInformation.OrgTechNeed = '"+OrgTechNeed+"'";
	}
	
	tbTime1 = request.getParameter("tbTime1");
	tbTime2 = request.getParameter("tbTime2");
	if(tbTime1 != null && tbTime1 != "" && tbTime2 != null && tbTime2 != ""){
		String tt1 = tbTime1.substring(0, 4) + tbTime1.substring(5, 7) + tbTime1.substring(8, 10) ;
		String tt2 = tbTime2.substring(0, 4) + tbTime2.substring(5, 7) + tbTime2.substring(8, 10) ;
		if(tbTime1.equals(tbTime2)){
			sql += " and substring(OrgInformation.OrgNeedNum,2,8) = '"+tt1+"'";
		}else{
			
			sql += " and substring(OrgInformation.OrgNeedNum,2,8)  >= '"+tt1+
					"' and substring(OrgInformation.OrgNeedNum,2,8) <= '"+tt2+"'";
		}
	}
	System.out.println(sql);
%>
	<table style="width: 900px; border: none;">
		<tr>
			<td style="width: 90%; height: 80px; border: none;"><span
				style="font-size: 30px; color: black;">河北省重大技术需求征集清单</span></td>
			<td style="border: none; text-align: left; text-align: center;">
				<a href="templete/table.jsp" target="_self"> <input
					type="submit" name="submit" value="添加技术需求" class="btn" />
			</a>
			</td>
		</tr>
	</table>
	<form action="templete/mywj.jsp" name="mywj1Form" method="post">
		<table style="width: 1100px;">
			<tr>
				<td style="text-align: left;">技术需求名称: <select name=OrgTechNeed
					id="OrgTechNeed" style="width: 200px">
						<option value=""></option>
						<%
								String sql1="select OrgTechNeed from OrgInformation where UserName = '"+strUserName+"'";
								ResultSet rs1=db.executeQuery(sql1);
								while(rs1.next()){
								out.println("<option value="+rs1.getString(1)+">"+rs1.getString(1)+"</option>");
								}
								rs1.close();
							%>
				</select> 填报日期:&nbsp; <input onClick="laydate()" type="text" name="tbTime1"
					id="tbTime1" style="width: 150px;" /> &nbsp;-&nbsp; <input
					type="text" name="tbTime2" id="tbTime2" style="width: 150px;" />&nbsp;
					<input type='submit' name='submit' value='查询' class="btn" />&nbsp;
					<a href="templete/mywj.jsp" target="_self"> <input
						type='button' name='button' value='显示全部' class="btn" />&nbsp;
				</a>
				</td>
			</tr>
			<tr>
				<td style="text-align: left; height: 10px; font-size: 12px;">
					<%
					String cxtj = "";
					if(OrgTechNeed != null && OrgTechNeed != ""){
						cxtj += "查询条件>技术需求名称: " + OrgTechNeed;
					}
					if(tbTime1 != null && tbTime1 != "" && tbTime2 != null && tbTime2 != ""){
						cxtj += "查询条件>填报日期: " + request.getParameter("tbTime1") +"-" + request.getParameter("tbTime2");
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
			<td style="width: 15%; height: 8px;"><span>需求编号</span></td>
			<td><span>技术需求名称 </span></td>
			<td style="width: 15%;"><span>填报时间 </span></td>
			<td style="width: 8%;"><span>状态 </span></td>
			<td style="width: 8%;"><span>形式审核 </span></td>
			<td style="width: 8%;"><span>部门审核 </span></td>
			<td style="width: 12%;"><span>操作</span></td>
		</tr>
		<%
			ResultSet rs=db.sel(sql);
		
			int intPageSize; //一页显示的记录数
			int intRowCount; //记录的总数
			int intPageCount; //总页数
			int intPage; //待显示的页码
			String strPage;
			int i;
			//设置一页显示的记录数
			intPageSize = 7;
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
					%>
		<tr
			style='border-bottom: 1px solid black; background-color: white; font-size: 14px;'>
			<td><%=rs.getString("OrgNeedNum") %></td>
			<td style='text-align: left;'><%=rs.getString("OrgTechNeed") %></td>
			<td><%=rs.getString("OrgNeedNum").substring(1, 5)+"-"+rs.getString("OrgNeedNum").substring(5, 7)+"-"+rs.getString("OrgNeedNum").substring(7, 9)%></td>
			<td>
				<%
									if(rs.getString("OrgXSSH").equals("未审核")){
										zhuangtai = "已保存";
									}else{
										zhuangtai = "已保存";
									}
								%> <%=zhuangtai %>
			</td>
			<td><%=rs.getString("OrgXSSH") %></td>
			<td><%=rs.getString("OrgBMSH") %></td>
			<td>
				<%
									if(rs.getString("OrgXSSH").equals("未审核")){
								%> <a
				href='templete/cktable.jsp?OrgNeedNum=<%=rs.getString("OrgNeedNum") %>'
				target='_self'>查看</a>&nbsp; <a
				href='templete/xgtable.jsp?OrgNeedNum=<%=rs.getString("OrgNeedNum") %>'
				target='_self'>修改</a>&nbsp; <a
				href='sctableServlet?OrgNeedNum=<%=rs.getString("OrgNeedNum") %>'
				onclick='return Check1()'>删除</a> <%
									}else{
								%> <a
				href='sh/shtable.jsp?OrgNeedNum=<%=rs.getString("OrgNeedNum") %>'
				target='_self'>查看审核</a> <%
									}
								%>
			</td>
		</tr>
		<%
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
				href='templete/mywj1.jsp?page=<%=intPage-1%>&tbTime1=<%=tbTime1%>&tbTime2=<%=tbTime2%>'><span
					class="fenye">上一页</span></a> <span class="fenye"> <%
	                 	for (int j = 1; j <= intPageCount; j++) {
	                 		out.print("&nbsp;<a href='templete/mywj1.jsp?page="+j+"'>"+j+"</a>");
	                 	}
	                 %>
			</span> <%
					System.out.println(tbTime1+"qwe");
					if(tbTime1 != null && tbTime1 != "" && tbTime2 != null && tbTime2 != ""){
						%> <a
				href='templete/mywj1.jsp?page=<%=intPage+1%>&tbTime1=<%=tbTime1%>&tbTime2=<%=tbTime2%>'><span
					class="fenye">下一页</span></a> <%
					}else{
						%> <a href='templete/mywj1.jsp?page=<%=intPage+1%>'><span
					class="fenye">下一页</span></a> <%
					}
				%>

			</td>
		</tr>
	</table>
</body>
</html>