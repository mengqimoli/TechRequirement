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
		PrintWriter out = response.getWriter();//����,�����
		
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
		cz.CZMoKuai = "���";
		cz.CZMing = "��ʽ���";
		cz.CZYuan = strUserName;
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		
		if("ͨ��".equals(value)){
			strSql = "update XSSH set OrgXSSH = 'ͨ��', XSSHText='"+XSSHText+"' where OrgNeedNum = '"+OrgNeedNum+"'";
			strSql1 = "update BMSH set OrgBMName = '"+OrgBMName+"' where OrgNeedNum = '"+OrgNeedNum+"'";
			int i = 0;
			i = db.executeUpdate(strSql);
			int j = 0;
			j = db.executeUpdate(strSql1);
			if(i == 1 && j == 1)
			{
				czSql += ",'�ɹ�','ͨ����ʽ��˳ɹ�')";
				db.executeUpdate(czSql);
				out.print("<script>alert('��ʽ��˳ɹ�!');window.location.href='templete/xssh.jsp'</script>");
				return;
			}
			else
			{
				czSql += ",'ʧ��','ͨ����ʽ���ʧ��')";
				db.executeUpdate(czSql);
				out.print("<script>alert('��ʽ���ʧ��,���������!');window.location.href='templete/xssh.jsp'</script>");
				return;
			}
		}
		else if("��ͨ��".equals(value)){
			strSql = "update XSSH set OrgXSSH = 'δͨ��', XSSHText = '"+XSSHText+"' where OrgNeedNum = '"+OrgNeedNum+"'";
			int j = 0;
			j = db.executeUpdate(strSql);
			if(j == 1) 
			{
				czSql += ",'�ɹ�','��ͨ����ʽ��˳ɹ�')";
				db.executeUpdate(czSql);
				out.print("<script>alert('��ʽ��˳ɹ�!');window.location.href='templete/xssh.jsp'</script>");
				return;
			}
			else
			{
				czSql += ",'ʧ��','��ͨ����ʽ���ʧ��')";
				db.executeUpdate(czSql);
				out.print("<script>alert('��ʽ���ʧ��,���������!');window.location.href='templete/xssh.jsp'</script>");
				return;
			}
		}
	}
}
