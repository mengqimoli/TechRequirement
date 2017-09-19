package com.jee.yhservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jee.common.Database;
import com.jee.xtservlet.CZRZGZ;

public class XGXXServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		Database db = new Database();

		String UserName = "";
		String UserPhone = "";
		String UserEmail = "";
		String OrgName = "";
		String OrgZip = "";
		
		String strUserName = (String)req.getSession().getAttribute("user_in_session");
		
		UserName = req.getParameter("UserName").trim();
		UserPhone = req.getParameter("UserPhone").trim();
		UserEmail = req.getParameter("UserEmail").trim();
		OrgName = req.getParameter("OrgName").trim();
		OrgZip = req.getParameter("OrgZip").trim();
		
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "�û���Ϣ";
		cz.CZMing = "�޸��û���Ϣ";
		cz.CZYuan = strUserName;
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		if(UserName==""||UserPhone==""||UserEmail==""||OrgName==""||OrgZip=="")
		{
			req.setAttribute("msg","�޸����ݲ���Ϊ��!");
	        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/yonghu/yhxx.jsp");
	        requestDispatcher.forward(req,resp);
	        return;
		}
		
		String strSql = "";
		strSql = "update UserTable set UserEmail='"+UserEmail+"',UserPhone='"+UserPhone+"',OrgName='"+OrgName+"',OrgZip='"+OrgZip+"' where UserName='"+strUserName+"'";
		int i = db.executeUpdate(strSql);
		if(i == 1)
		{
			czSql += ",'�ɹ�','�޸��û���Ϣ�ɹ�')";
			db.executeUpdate(czSql);
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('�޸ĳɹ�!');history.back()</script>");
			/*req.setAttribute("msg","�޸ĳɹ�!");
	        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/yonghu/yhxx.jsp");
	        requestDispatcher.forward(req,resp);
	        db.close();
	        return;*/
		}
		else
		{ 
			czSql += ",'ʧ��','�޸��û���Ϣʧ��')";
			db.executeUpdate(czSql);
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('�޸�ʧ��,�������޸�!');history.back()</script>");
		}
	}
}
