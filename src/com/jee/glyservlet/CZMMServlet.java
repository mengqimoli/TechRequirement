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
import com.jee.common.MD5;
import com.jee.xtservlet.CZRZGZ;

public class CZMMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		Database db = new Database();
		
		String UserName = req.getParameter("UserName");
		
		String strUserName = (String)req.getSession().getAttribute("user_in_session");
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "用户管理";
		cz.CZMing = "重置密码";
		cz.CZYuan = strUserName;
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		String strPwd = "123456";
		strPwd = MD5.md5(strPwd);
		String sql = "update UserTable set UserPsd = '"+strPwd+"' where UserName = '"+UserName+"'";
		int i = db.executeUpdate(sql);
		if(i == 1){
			czSql += ",'成功','重置密码成功')";
			db.executeUpdate(czSql);
			PrintWriter out = resp.getWriter();//对象,输出流
			out.print("<script>alert('重置密码成功!');window.location.href='templete/yhgl.jsp'</script>");
			return;
		}
		else{
			czSql += ",'失败','重置密码失败')";
			db.executeUpdate(czSql);
			PrintWriter out = resp.getWriter();//对象,输出流
			out.print("<script>alert('重置密码失败!');window.location.href='templete/yhgl.jsp'</script>");
			return;
		}
	}

}
