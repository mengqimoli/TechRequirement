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
		cz.CZMoKuai = "���";
		cz.CZMing = "�������";
		cz.CZYuan = strUserName;
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();//����,�����
		
		OrgNeedNum = request.getParameter("OrgNeedNum");
		BMSHText = request.getParameter("BMSHText");
		value = request.getParameter("submit");
		 
		if("ͨ��".equals(value)){
			
			strSql = "update BMSH set OrgBMSH = 'ͨ��', BMSHText = '"+BMSHText+"' where OrgNeedNum = '"+OrgNeedNum+"'";
		}
		else if("��ͨ��".equals(value)){
			
			strSql = "update BMSH set OrgBMSH = 'δͨ��', BMSHText = '"+BMSHText+"' where OrgNeedNum = '"+OrgNeedNum+"'";
		}
		int i = 0;
		i = db.executeUpdate(strSql);
		if(i == 1)
		{
			czSql += ",'�ɹ�','������˳ɹ�')";
			db.executeUpdate(czSql);
			out.print("<script>alert('��˳ɹ�!');window.location.href='templete/bmsh.jsp'</script>");
			return;
		}
		else
		{
			czSql += ",'ʧ��','�������ʧ��')";
			db.executeUpdate(czSql);
			out.print("<script>alert('���ʧ��,���������!');window.location.href='templete/bmsh.jsp'</script>");
			return;
		}
	}
}
