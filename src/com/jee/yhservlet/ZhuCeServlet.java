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
		
		// 定义变量
		String strUserName = "";
		String strUserPsd = "";
		String strUserTrue = "";
		String strUserID = "";
		String strUserEmail = "";
		String strUserPhone = "";
		String strOrgNum = "";
		String strOrgName = "";
		String strOrgZip = "";
		// 获取数据
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
		cz.CZMoKuai = "注册";
		cz.CZMing = "注册";
		cz.CZYuan = "";
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		Database db = new Database();
		try
		{
			//*************************************************************************************校验注册内容是否为空
			if(strUserName==""||strUserPsd==""||strUserTrue==""||strUserID==""||strUserEmail==""||strUserPhone==""||strOrgNum==""||strOrgName==""||strOrgZip=="")
			{
				request.setAttribute("msg","注册内容不能为空!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/zhu/zhuce.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}	
			//**************************************************************************************校验用户名是否重复
			
			strSql = "select * from UserTable where UserName = '"+strUserName+"' "; 
			ResultSet rs = db.executeQuery(strSql);
			if(rs.next())//*****************************************************************************用户名已被注册
			{
				czSql += ",'失败','注册内容不能为空!')";
				db.executeUpdate(czSql);
				request.setAttribute("msg","该用户名已被注册!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/zhu/zhuce.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			rs.close();
			strUserPsd = MD5.md5(strUserPsd);	
			System.out.println(strUserPsd);
			//*****************************************************************************************用户名没被注册
			int i = 0;
			strSql1 = "insert into UserTable values('"+strUserName+"','"+strUserPsd+"','"+strUserTrue+"','"+strUserID+"','"+strUserEmail+"','"+strUserPhone+"','"+strOrgNum+"','"+strOrgName+"','"+strOrgZip+"','','普通用户')";
			i = db.executeUpdate(strSql1);
			if(i!=1)
			{
				czSql += ",'失败','数据库连接失败!')";
				db.executeUpdate(czSql);
				request.setAttribute("msg","注册失败!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/zhu/zhuce.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			czSql += ",'成功','注册成功')";
			db.executeUpdate(czSql);
			db.close();
			//*******************************************************************************************注册成功跳转
			PrintWriter out = response.getWriter();//对象,输出流
			out.print("<script>alert('注册成功!');window.parent.frames.location.href='Login.jsp'</script>");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
}
