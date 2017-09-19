package com.jee.yhservlet;

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

public class SCTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		Database db = new Database();
		
		String OrgNeedNum = "";
		OrgNeedNum = req.getParameter("OrgNeedNum");
		
		String sql0 = "";
		String sql = "";
		String sql1 = "";
		
		String strUserName = (String)req.getSession().getAttribute("user_in_session");
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "������";
		cz.CZMing = "ɾ��������";
		cz.CZYuan = strUserName;
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		sql0 = "delete from BMSH where OrgNeedNum = '"+OrgNeedNum+"'";
		sql = "delete from XSSH where OrgNeedNum = '"+OrgNeedNum+"'";
		sql1 = "delete from OrgInformation where OrgNeedNum = '"+OrgNeedNum+"'";
		
		int k = db.executeUpdate(sql0);
		int i = db.executeUpdate(sql);
		int j = db.executeUpdate(sql1);
		if(k == 1 && i == 1 && j == 1){
			czSql += ",'�ɹ�','������ɾ���ɹ�')";
			db.executeUpdate(czSql);
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('ɾ���ɹ�!');window.location.href='templete/mywj.jsp'</script>");
		}else{
			czSql += ",'ʧ��','������ɾ��ʧ��')";
			db.executeUpdate(czSql);
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('ɾ��ʧ��,�����²���!');window.location.href='templete/mywj.jsp'</script>");
		}
	}
}
