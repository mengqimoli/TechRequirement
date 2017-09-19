package com.jee.yhservlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jee.common.Database;
import com.jee.xtservlet.CZRZGZ;
import com.jee.common.MD5;

public class ZhuCeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		// �������
		String strUserName = "";
		String strUserPsd = "";
		String strUserTrue = "";
		String strUserID = "";
		String strUserEmail = "";
		String strUserPhone = "";
		String strOrgNum = "";
		String strOrgName = "";
		String strOrgZip = "";
		// ��ȡ����
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		strUserName = request.getParameter("UserName").trim();
		strUserPsd = request.getParameter("UserPsd").trim();
		strUserTrue = request.getParameter("UserTrue").trim();
		strUserID = request.getParameter("UserID").trim();
		strUserEmail = request.getParameter("UserEmail").trim();
		strUserPhone = request.getParameter("UserPhone").trim();
		strOrgNum = request.getParameter("OrgNum").trim();
		strOrgName = request.getParameter("OrgName").trim();
		strOrgZip = request.getParameter("OrgZip").trim();
		
		String strSql = "";
		String strSql1 = "";
		
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "ע��";
		cz.CZMing = "ע��";
		cz.CZYuan = "";
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		Database db = new Database();
		try
		{
			//*************************************************************************************У��ע�������Ƿ�Ϊ��
			if(strUserName==""||strUserPsd==""||strUserTrue==""||strUserID==""||strUserEmail==""||strUserPhone==""||strOrgNum==""||strOrgName==""||strOrgZip=="")
			{
				request.setAttribute("msg","ע�����ݲ���Ϊ��!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/zhu/zhuce.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}	
			//**************************************************************************************У���û����Ƿ��ظ�
			
			strSql = "select * from UserTable where UserName = '"+strUserName+"' "; 
			ResultSet rs = db.executeQuery(strSql);
			if(rs.next())//*****************************************************************************�û����ѱ�ע��
			{
				czSql += ",'ʧ��','ע�����ݲ���Ϊ��!')";
				db.executeUpdate(czSql);
				request.setAttribute("msg","���û����ѱ�ע��!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/zhu/zhuce.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			rs.close();
			strUserPsd = MD5.md5(strUserPsd);	
			System.out.println(strUserPsd);
			//*****************************************************************************************�û���û��ע��
			int i = 0;
			strSql1 = "insert into UserTable values('"+strUserName+"','"+strUserPsd+"','"+strUserTrue+"','"+strUserID+"','"+strUserEmail+"','"+strUserPhone+"','"+strOrgNum+"','"+strOrgName+"','"+strOrgZip+"','','��ͨ�û�')";
			i = db.executeUpdate(strSql1);
			if(i!=1)
			{
				czSql += ",'ʧ��','���ݿ�����ʧ��!')";
				db.executeUpdate(czSql);
				request.setAttribute("msg","ע��ʧ��!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/zhu/zhuce.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			czSql += ",'�ɹ�','ע��ɹ�')";
			db.executeUpdate(czSql);
			db.close();
			//*******************************************************************************************ע��ɹ���ת
			PrintWriter out = response.getWriter();//����,�����
			out.print("<script>alert('ע��ɹ�!');window.parent.frames.location.href='Login.jsp'</script>");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
}
