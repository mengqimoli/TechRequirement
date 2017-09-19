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

public class SCJSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		Database db = new Database();
		
		String juese = req.getParameter("yhjuese123");
		juese = new String(juese.getBytes("ISO-8859-1"),"UTF-8");
		
		String sql = "";
		String strUserName = (String)req.getSession().getAttribute("user_in_session");
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "管理员";
		cz.CZMing = "删除角色";
		cz.CZYuan = strUserName;
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		String sql1 = "delete from UserTable where juese = '"+juese+"'";
		sql = "delete from JueSe where juese = '"+juese+"'";
		int j = 0;
		int i = 0;
		j = db.executeUpdate(sql1);
		i = db.executeUpdate(sql);
		if(i == 1 && j == 1 || i == 1 && j == 0){
			czSql += ",'成功','角色删除成功')";
			db.executeUpdate(czSql);
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('删除成功!');window.location.href='templete/jsgl.jsp'</script>");
		}else{
			czSql += ",'失败','角色删除失败')";
			db.executeUpdate(czSql);
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('删除失败,请重新操作!');window.location.href='templete/jsgl.jsp'</script>");
		}
	}
}
