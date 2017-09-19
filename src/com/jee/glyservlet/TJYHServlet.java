package com.jee.glyservlet;

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
import com.jee.common.MD5;
import com.jee.xtservlet.CZRZGZ;

public class TJYHServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
				Database db = new Database();
		
				// �������
				String strUserName = "";
				String strUserPsd = "";
				String juese = "";
				String glcs = "";
				// ��ȡ����
				resp.setContentType("text/html;charset=utf-8");
				req.setCharacterEncoding("utf-8");
				
				juese = req.getParameter("js").trim();
				strUserName = req.getParameter("UserName").trim();
				strUserPsd = req.getParameter("UserPsd").trim();
				strUserPsd = MD5.md5(strUserPsd);
				
				//��ȡ������
				if(req.getParameter("glcs") != null)
				{
					glcs = req.getParameter("glcs").trim();
				}
				
				String strUserName1 = (String)req.getSession().getAttribute("user_in_session");
				CZRZGZ cz = new CZRZGZ();
				cz.CZMoKuai = "�û�����";
				cz.CZMing = "�����û�";
				cz.CZYuan = strUserName1;
				cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
				String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
				
				
				String strSql = "";
				String strSql1 = "";
				
				
				try
				{
					//**************************************************************************************У���û����Ƿ��ظ�
					strSql = "select * from UserTable where UserName = '"+strUserName+"' "; 
					ResultSet rs = db.executeQuery(strSql);
					if(rs.next())//*****************************************************************************�û����ѱ�ע��
					{
						czSql += ",'ʧ��','���û����ѱ�ע��')";
						db.executeUpdate(czSql);
						req.setAttribute("msg","���û����ѱ�ע��!");
				        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/gly/tjyh.jsp");
				        requestDispatcher.forward(req,resp);
				        return;
					}
					rs.close();
					//*****************************************************************************************�û���û��ע��
					int i = 0;
					strSql1 = "insert into UserTable values('"+strUserName+"','"+strUserPsd+"','','','','','','','','"+glcs+"','"+juese+"')";
					i = db.executeUpdate(strSql1);
					if(i!=1)
					{
						czSql += ",'ʧ��','ע���û�ʧ��')";
						db.executeUpdate(czSql);
						PrintWriter out = resp.getWriter();//����,�����
						out.print("<script>alert('ע��ʧ��!');window.location.href='gly/tjyh.jsp'</script>");
				        return;
					}
					czSql += ",'�ɹ�','ע���û��ɹ�')";
					db.executeUpdate(czSql);
					db.close();
					//*******************************************************************************************ע��ɹ���ת
					PrintWriter out = resp.getWriter();//����,�����
					out.print("<script>alert('ע��ɹ�!');window.location.href='gly/tjyh.jsp'</script>");
				}catch(Exception e){
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
		
	}

}
