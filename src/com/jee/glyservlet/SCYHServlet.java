package com.jee.glyservlet;

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

public class SCYHServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		Database db = new Database();
		
		String UserName = "";
		UserName = req.getParameter("UserName");
		
		String sql1 = "";
		String sql2 = "";
		String sql3 = "";
		String sql4 = "";
		
		sql1 = "delete from BMSH where UserName = '"+UserName+"'";
		sql2 = "delete from XSSH where UserName = '"+UserName+"'";
		sql3 = "delete from OrgInformation where UserName = '"+UserName+"'";
		sql4 = "delete from UserTable where UserName = '"+UserName+"'";
		
		String strUserName = (String)req.getSession().getAttribute("user_in_session");
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "用户管理";
		cz.CZMing = "删除用户";
		cz.CZYuan = strUserName;
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		
		int i1 = db.executeUpdate(sql1);
		int i2 = db.executeUpdate(sql2);
		int i3 = db.executeUpdate(sql3);
		int i4 = db.executeUpdate(sql4);
		System.out.println(i1+"23");
		if(i1 == 0 && i2 == 0 && i3 == 0 && i4 == 1){
			czSql += ",'成功','用户删除成功')";
			db.executeUpdate(czSql);
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('删除成功!');window.location.href='templete/yhgl.jsp'</script>");
		}
		if(i1 == 1 && i2 == 1 && i3 == 1 && i4 == 1){
			czSql += ",'成功','用户删除成功')";
			db.executeUpdate(czSql);
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('删除成功!');window.location.href='templete/yhgl.jsp'</script>");
		}else{
			czSql += ",'失败','用户删除失败')";
			db.executeUpdate(czSql);
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('删除失败,请重新操作!');window.location.href='templete/yhgl.jsp'</script>");
		}
	}

}
