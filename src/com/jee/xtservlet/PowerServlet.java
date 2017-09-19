package com.jee.xtservlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jee.common.Database;

import net.sf.json.JSONObject;

public class PowerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		Database db = new Database();
		
		JSONObject jsonobject = new JSONObject();
		
		String UserName = "";
		int power = 0;
		int xqzj_qx = 0;
		int xqgl_qx = 0;
		int yhxx_qx = 0;
		int yhxg_qx = 0;
		int xssh_qx = 0;
		int bmsh_qx = 0;
		int tjcx_qx = 0;
		
		UserName = (String) req.getSession().getAttribute("user_in_session");//获得session中的用户名
		
		String strSql = "";
		strSql = "select JueSe.*,UserTable.* from JueSe,UserTable where JueSe.juese = UserTable.juese and UserName = '"+UserName+"'";
		ResultSet rs = db.executeQuery(strSql);
		
		try{
			rs.next();
			power = rs.getInt("power");
			xqzj_qx = rs.getInt("xqzj");
			xqgl_qx = rs.getInt("xqgl");
			yhxx_qx = rs.getInt("yhxx");
			yhxg_qx = rs.getInt("yhxg");
			xssh_qx = rs.getInt("xssh");
			bmsh_qx = rs.getInt("bmsh");
			tjcx_qx = rs.getInt("tjcx");
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		jsonobject.put("power", power);
		jsonobject.put("xqzj_qx", xqzj_qx);
		jsonobject.put("xqgl_qx", xqgl_qx);
		jsonobject.put("yhxx_qx", yhxx_qx);
		jsonobject.put("yhxg_qx", yhxg_qx);
		jsonobject.put("xssh_qx", xssh_qx);
		jsonobject.put("bmsh_qx", bmsh_qx);
		jsonobject.put("tjcx_qx", tjcx_qx);
		resp.getWriter().append(jsonobject.toString());
	}
}
