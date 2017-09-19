package com.jee.glyservlet;

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

public class GLXGXXServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		Database db = new Database();

		String UserName = "";
		String UserTrue = "";
		String UserID = "";
		String UserPhone = "";
		String UserEmail = "";
		String OrgNum = "";
		String OrgName = "";
		String OrgZip = "";
		String juese = "";
		
		juese = req.getParameter("js").trim();
		UserName = req.getParameter("UserName").trim();
		UserTrue = req.getParameter("UserTrue").trim();
		UserID = req.getParameter("UserID").trim();
		UserPhone = req.getParameter("UserPhone").trim();
		UserEmail = req.getParameter("UserEmail").trim();
		OrgNum = req.getParameter("OrgNum").trim();
		OrgName = req.getParameter("OrgName").trim();
		OrgZip = req.getParameter("OrgZip").trim();
		
		String strUserName = (String)req.getSession().getAttribute("user_in_session");
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "�û�����";
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
		strSql = "update UserTable set juese='"+juese+"',UserEmail='"+UserEmail+"',UserTrue='"+UserTrue+"',UserID='"+UserID+"',UserPhone='"+UserPhone+"',OrgNum='"+OrgNum+"',OrgName='"+OrgName+"',OrgZip='"+OrgZip+"' where UserName='"+UserName+"'";
		int i = db.executeUpdate(strSql);
		if(i == 1)
		{
			czSql += ",'�ɹ�','�û���Ϣ�޸ĳɹ�')";
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
			czSql += ",'ʧ��','�û���Ϣ�޸�ʧ��')";
			db.executeUpdate(czSql);
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('�޸�ʧ��,�������޸�!');history.back()</script>");
		}
	}
}
