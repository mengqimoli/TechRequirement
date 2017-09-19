package com.jee.yhservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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

public class XGMMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();//对象,输出流
		
		Database db = new Database();

		String UserPsd0 = "";
		String UserPsd = "";
		String UserPsd1 = "";
		
		String strUserName = (String)req.getSession().getAttribute("user_in_session");
		
		UserPsd0 = req.getParameter("UserPsd0").trim();
		UserPsd0 = MD5.md5(UserPsd0);
		UserPsd = req.getParameter("UserPsd").trim();
		UserPsd = MD5.md5(UserPsd);
		UserPsd1 = req.getParameter("UserPsd1").trim();
		UserPsd1 = MD5.md5(UserPsd1);
		
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "用户信息";
		cz.CZMing = "修改用户密码";
		cz.CZYuan = strUserName;
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		if(!UserPsd.equals(UserPsd1))
		{
			req.setAttribute("msg","两次输入的密码不正确!");
	        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/yonghu/mmxg.jsp");
	        requestDispatcher.forward(req,resp);
	        return;
		}
		
		if(UserPsd0==""||UserPsd==""||UserPsd1=="")
		{
			req.setAttribute("msg","修改内容不能为空!");
	        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/yonghu/mmxg.jsp");
	        requestDispatcher.forward(req,resp);
	        return;
		}
		String strSql0 = "";
		strSql0 = "select * from UserTable where UserName = '"+strUserName+"'";
		ResultSet rs1 = db.executeQuery(strSql0);
		try {
			if(rs1.next()){
				if(UserPsd0.equals(rs1.getString("UserPsd")))
				{
					String strSql2 = "";
					strSql2 = "update UserTable set UserPsd = '"+UserPsd+"' where UserName = '"+strUserName+"'";
					int i = db.executeUpdate(strSql2);
					if(i == 1)
					{
						czSql += ",'成功','密码修改成功!')";
						db.executeUpdate(czSql);
						out.print("<script>alert('密码修改成功!');window.location.href='yonghu/mmxg.jsp'</script>");
						db.close();
						return;
					}
					else
					{
						czSql += ",'失败','密码修改失败')";
						db.executeUpdate(czSql);
						out.print("<script>alert('修改失败,请重新修改!');window.location.href='yonghu/mmxg.jsp'</script>");
						db.close();
						return;
					}
				}
				else
				{
					czSql += ",'失败','旧密码输入错误!')";
					db.executeUpdate(czSql);
					req.setAttribute("msg","旧密码错误!");
			        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/yonghu/mmxg.jsp");
			        requestDispatcher.forward(req,resp);
			        db.close();
			        return;
				}
			}
			rs1.close();
			db.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
