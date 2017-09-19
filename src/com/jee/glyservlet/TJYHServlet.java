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
		
				// 定义变量
				String strUserName = "";
				String strUserPsd = "";
				String juese = "";
				String glcs = "";
				// 获取数据
				resp.setContentType("text/html;charset=utf-8");
				req.setCharacterEncoding("utf-8");
				
				juese = req.getParameter("js").trim();
				strUserName = req.getParameter("UserName").trim();
				strUserPsd = req.getParameter("UserPsd").trim();
				strUserPsd = MD5.md5(strUserPsd);
				
				//获取管理处室
				if(req.getParameter("glcs") != null)
				{
					glcs = req.getParameter("glcs").trim();
				}
				
				String strUserName1 = (String)req.getSession().getAttribute("user_in_session");
				CZRZGZ cz = new CZRZGZ();
				cz.CZMoKuai = "用户管理";
				cz.CZMing = "新增用户";
				cz.CZYuan = strUserName1;
				cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
				String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
				
				
				String strSql = "";
				String strSql1 = "";
				
				
				try
				{
					//**************************************************************************************校验用户名是否重复
					strSql = "select * from UserTable where UserName = '"+strUserName+"' "; 
					ResultSet rs = db.executeQuery(strSql);
					if(rs.next())//*****************************************************************************用户名已被注册
					{
						czSql += ",'失败','该用户名已被注册')";
						db.executeUpdate(czSql);
						req.setAttribute("msg","该用户名已被注册!");
				        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/gly/tjyh.jsp");
				        requestDispatcher.forward(req,resp);
				        return;
					}
					rs.close();
					//*****************************************************************************************用户名没被注册
					int i = 0;
					strSql1 = "insert into UserTable values('"+strUserName+"','"+strUserPsd+"','','','','','','','','"+glcs+"','"+juese+"')";
					i = db.executeUpdate(strSql1);
					if(i!=1)
					{
						czSql += ",'失败','注册用户失败')";
						db.executeUpdate(czSql);
						PrintWriter out = resp.getWriter();//对象,输出流
						out.print("<script>alert('注册失败!');window.location.href='gly/tjyh.jsp'</script>");
				        return;
					}
					czSql += ",'成功','注册用户成功')";
					db.executeUpdate(czSql);
					db.close();
					//*******************************************************************************************注册成功跳转
					PrintWriter out = resp.getWriter();//对象,输出流
					out.print("<script>alert('注册成功!');window.location.href='gly/tjyh.jsp'</script>");
				}catch(Exception e){
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
		
	}

}
