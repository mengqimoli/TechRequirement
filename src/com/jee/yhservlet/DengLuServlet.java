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
		// 定义变量
		String strUserName = "";
		String strUserPsd = "";
		String reqCode ="";
		// 获取数据
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		Database db = new Database();
		
		strUserName = request.getParameter("user").trim();
		strUserPsd = request.getParameter("pwd").trim();
		strUserPsd = MD5.md5(strUserPsd);
		//验证码
		reqCode = request.getParameter("randcode").trim();
		//获取验证码
		String sessionCode = (String)request.getSession().getAttribute("rand");
		//System.out.println(sessionCode);
		//清除session中的验证码
		request.getSession().removeAttribute("rand");
		
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "登录";
		cz.CZMing = "登录";
		cz.CZYuan = strUserName;
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		try
		{
			//****************************************************************************************验证码是否为空
			if(strUserName=="")
			{
				request.setAttribute("msg","用户名不能为空!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			if(strUserPsd=="")
			{
				request.setAttribute("msg","密码不能为空!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			if(reqCode=="")
			{
				request.setAttribute("msg","验证码不能为空!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			
			if(!reqCode.equals(sessionCode))//**********************************************************验证码错误
			{
				request.setAttribute("msg1",strUserName);
				request.setAttribute("msg2",strUserPsd);
				request.setAttribute("msg","验证码错误!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			
			String strSql = "";
			strSql = "select * from UserTable where UserName = '"+strUserName+"'";
			ResultSet rs=db.executeQuery(strSql);
			if(rs.next())
			{
				if(strUserPsd.equals(rs.getString("UserPsd")))//*****************************************登录成功
				{
					czSql += ",'成功','登录成功')";
					db.executeUpdate(czSql);
					request.getSession().setAttribute("user_in_session", strUserName);
					response.sendRedirect(basePath + "Main.jsp");
				}
				else//***********************************************************************************密码错误
				{
					czSql += ",'失败','密码错误')";
					db.executeUpdate(czSql);
					request.setAttribute("msg1",strUserName);
					request.setAttribute("msg","密码错误!");
			        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
			        requestDispatcher.forward(request,response);
			        return;
				}
				
			}
			else//*************************************************************************************用户名不存在
			{
				czSql += ",'失败','用户名不存在')";
				db.executeUpdate(czSql);
				request.setAttribute("msg1",strUserName);
				request.setAttribute("msg2",strUserPsd);
				request.setAttribute("msg","用户名不存在!");
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
