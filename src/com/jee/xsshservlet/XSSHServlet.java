package com.jee.xsshservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jee.common.Database;
import com.jee.xtservlet.CZRZGZ;

public class XSSHServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();//对象,输出流
		
		Database db = new Database();
		
		String OrgNeedNum = "";
		String XSSHText = "";
		String OrgBMName = "";
		String strSql = "";
		String strSql1 = "";
		String value = "";
		
		OrgNeedNum = request.getParameter("OrgNeedNum");
		XSSHText = request.getParameter("XSSHText");
		OrgBMName = request.getParameter("OrgBMName");
		value = request.getParameter("submit");
		
		String strUserName = (String)request.getSession().getAttribute("user_in_session");
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "审核";
		cz.CZMing = "形式审核";
		cz.CZYuan = strUserName;
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		
		if("通过".equals(value)){
			strSql = "update XSSH set OrgXSSH = '通过', XSSHText='"+XSSHText+"' where OrgNeedNum = '"+OrgNeedNum+"'";
			strSql1 = "update BMSH set OrgBMName = '"+OrgBMName+"' where OrgNeedNum = '"+OrgNeedNum+"'";
			int i = 0;
			i = db.executeUpdate(strSql);
			int j = 0;
			j = db.executeUpdate(strSql1);
			if(i == 1 && j == 1)
			{
				czSql += ",'成功','通过形式审核成功')";
				db.executeUpdate(czSql);
				out.print("<script>alert('形式审核成功!');window.location.href='templete/xssh.jsp'</script>");
				return;
			}
			else
			{
				czSql += ",'失败','通过形式审核失败')";
				db.executeUpdate(czSql);
				out.print("<script>alert('形式审核失败,请重新审核!');window.location.href='templete/xssh.jsp'</script>");
				return;
			}
		}
		else if("不通过".equals(value)){
			strSql = "update XSSH set OrgXSSH = '未通过', XSSHText = '"+XSSHText+"' where OrgNeedNum = '"+OrgNeedNum+"'";
			int j = 0;
			j = db.executeUpdate(strSql);
			if(j == 1) 
			{
				czSql += ",'成功','不通过形式审核成功')";
				db.executeUpdate(czSql);
				out.print("<script>alert('形式审核成功!');window.location.href='templete/xssh.jsp'</script>");
				return;
			}
			else
			{
				czSql += ",'失败','不通过形式审核失败')";
				db.executeUpdate(czSql);
				out.print("<script>alert('形式审核失败,请重新审核!');window.location.href='templete/xssh.jsp'</script>");
				return;
			}
		}
	}
}
