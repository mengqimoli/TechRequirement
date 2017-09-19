package com.jee.bmshservlet;

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

public class BMSHServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		Database db = new Database();
		
		String OrgNeedNum = "";
		String BMSHText = "";
		String strSql = "";
		String value = "";

		String strUserName = (String)request.getSession().getAttribute("user_in_session");
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "审核";
		cz.CZMing = "部门审核";
		cz.CZYuan = strUserName;
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();//对象,输出流
		
		OrgNeedNum = request.getParameter("OrgNeedNum");
		BMSHText = request.getParameter("BMSHText");
		value = request.getParameter("submit");
		 
		if("通过".equals(value)){
			
			strSql = "update BMSH set OrgBMSH = '通过', BMSHText = '"+BMSHText+"' where OrgNeedNum = '"+OrgNeedNum+"'";
		}
		else if("不通过".equals(value)){
			
			strSql = "update BMSH set OrgBMSH = '未通过', BMSHText = '"+BMSHText+"' where OrgNeedNum = '"+OrgNeedNum+"'";
		}
		int i = 0;
		i = db.executeUpdate(strSql);
		if(i == 1)
		{
			czSql += ",'成功','部门审核成功')";
			db.executeUpdate(czSql);
			out.print("<script>alert('审核成功!');window.location.href='templete/bmsh.jsp'</script>");
			return;
		}
		else
		{
			czSql += ",'失败','部门审核失败')";
			db.executeUpdate(czSql);
			out.print("<script>alert('审核失败,请重新审核!');window.location.href='templete/bmsh.jsp'</script>");
			return;
		}
	}
}
