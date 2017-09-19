package com.jee.yhservlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jee.common.Database;
import com.jee.common.MD5;
import com.jee.xtservlet.CZRZGZ;

public class DengLuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		// �������
		String strUserName = "";
		String strUserPsd = "";
		String reqCode ="";
		// ��ȡ����
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		Database db = new Database();
		
		strUserName = request.getParameter("user").trim();
		strUserPsd = request.getParameter("pwd").trim();
		strUserPsd = MD5.md5(strUserPsd);
		//��֤��
		reqCode = request.getParameter("randcode").trim();
		//��ȡ��֤��
		String sessionCode = (String)request.getSession().getAttribute("rand");
		//System.out.println(sessionCode);
		//���session�е���֤��
		request.getSession().removeAttribute("rand");
		
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "��¼";
		cz.CZMing = "��¼";
		cz.CZYuan = strUserName;
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		try
		{
			//****************************************************************************************��֤���Ƿ�Ϊ��
			if(strUserName=="")
			{
				request.setAttribute("msg","�û�������Ϊ��!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			if(strUserPsd=="")
			{
				request.setAttribute("msg","���벻��Ϊ��!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			if(reqCode=="")
			{
				request.setAttribute("msg","��֤�벻��Ϊ��!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			
			if(!reqCode.equals(sessionCode))//**********************************************************��֤�����
			{
				request.setAttribute("msg1",strUserName);
				request.setAttribute("msg2",strUserPsd);
				request.setAttribute("msg","��֤�����!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			
			String strSql = "";
			strSql = "select * from UserTable where UserName = '"+strUserName+"'";
			ResultSet rs=db.executeQuery(strSql);
			if(rs.next())
			{
				if(strUserPsd.equals(rs.getString("UserPsd")))//*****************************************��¼�ɹ�
				{
					czSql += ",'�ɹ�','��¼�ɹ�')";
					db.executeUpdate(czSql);
					request.getSession().setAttribute("user_in_session", strUserName);
					response.sendRedirect(basePath + "Main.jsp");
				}
				else//***********************************************************************************�������
				{
					czSql += ",'ʧ��','�������')";
					db.executeUpdate(czSql);
					request.setAttribute("msg1",strUserName);
					request.setAttribute("msg","�������!");
			        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
			        requestDispatcher.forward(request,response);
			        return;
				}
				
			}
			else//*************************************************************************************�û���������
			{
				czSql += ",'ʧ��','�û���������')";
				db.executeUpdate(czSql);
				request.setAttribute("msg1",strUserName);
				request.setAttribute("msg2",strUserPsd);
				request.setAttribute("msg","�û���������!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			rs.close();
			db.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
}
