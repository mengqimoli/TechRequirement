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
<script type="text/javascript">
	function czmm(){
		var sure = confirm("　　确认要重置密码吗?\n重置之后密码安全级别将降低!");
		if(sure == true){
			return true;
		}else{
			return false;
		}
	}
	function sc(){
		var sure = confirm("确认要删除该用户?");
		if(sure == true){
			return true;
		}else{
			return false;
		}
	}
	function Check1()
	{
		var juese = document.getElementById("UserName"); 
		if(juese.value == ""){
			alert("请输入用户名查询");
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
	width: 1100px;
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
	<br />
	<div style="font-size: 25px; text-align: center;">用户管理</div>
	<div style="text-align: center;">
		<a href="gly/tjyh.jsp" target="_self"> <input type="submit"
			name="submit" value="新增用户" class="btn" />
		</a>
	</div>
	<div style="text-align: center;"></div>
	<br />
	<form action="templete/yhgl.jsp" method="post" name="yhgl1Form">
		<div style="text-align: center;">
			用户名: <input type="text" name="UserName" id="UserName"
				style="width: 250px" /> <input type='submit' name='submit'
				id="submit" value='查询' class="btn" onclick="return Check1()" /> <a
				href="templete/yhgl.jsp"><input type='button' name='btnxsqb'
				id="btnxsqb" value='显示全部' class="btn" /></a>
		</div>
	</form>
	<br />
	<table>
		<tr style="background-color: DodgerBlue;">
			<td style="width: 15%"><span>用户名</span></td>
			<td style="width: 10%"><span>姓名</span></td>
			<td><span>机构名称</span></td>
			<td style="width: 10%"><span>角色</span></td>
			<td style="width: 10%"><span>管理处室</span></td>
			<td style="width: 10%;" colspan="3"><span>操作</span></td>
			<td style="width: 10%;"><span>密码</span></td>
		</tr>
		<% 
			Database db = new Database();
			
			String sql="select * from UserTable where juese != '管理员'";
			
			String UserName = request.getParameter("UserName");
			if(UserName != "" && UserName != null)
			{
				sql += "and UserName like '%"+UserName+"%' ";
			}
			
			sql += " order by juese ASC";
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
			i = 0;
			if(rs.getRow()!=0)
			{
				while(i < intPageSize && !rs.isAfterLast())
				{
					out.println(
							"<tr style='border-bottom: 1px solid black; background-color: white; font-size: 14px;'>"+
							"<td>"+rs.getString("UserName")+"</td>"+
							"<td>"+rs.getString("UserTrue")+"</td>"+
							"<td>"+rs.getString("OrgName")+"</td>"+
							"<td>"+rs.getString("juese")+"</td>"+
							"<td>"+rs.getString("beizhu")+"</td>"+
							"<td>"+"<a href='gly/xgyhxx.jsp?UserName="+rs.getString("UserName")+"' target='_self'>"+"编辑"+"</a>"+"</td>"+
							"<td>"+"<a href='gly/yhxx.jsp?UserName="+rs.getString("UserName")+"' target='_self'>"+"详情"+"</a>"+"</td>"+
							"<td>"+"<a href='scyhServlet?UserName="+rs.getString("UserName")+"' target='_self' onclick='return sc()'>"+"删除"+"</a>"+"</td>"+
							"<td>"+"<a href='czmmServlet?UserName="+rs.getString("UserName")+"' target='_self' onclick='return czmm()'>"+"重置密码"+"</a>"+"</td>"+
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
				href='templete/yhgl1.jsp?page=<%=intPage-1%>'><span
					class="fenye">上一页</span></a> <span class="fenye"> <%
	                 	for (int j = 1; j <= intPageCount; j++) {
	                 		out.print("&nbsp;<a href='templete/yhgl1.jsp?page="+j+"'>"+j+"</a>");
	                 	}
	                 %>
			</span> <a href='templete/yhgl1.jsp?page=<%=intPage+1%>'><span
					class="fenye">下一页</span></a>
			</td>
		</tr>
	</table>
</body>
</html>