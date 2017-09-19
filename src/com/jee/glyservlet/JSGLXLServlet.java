package com.jee.glyservlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jee.common.Database;

import net.sf.json.JSONObject;

public class JSGLXLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		Database db = new Database();
		
		JSONObject jsonobject = new JSONObject();
		
		String juese = "";
		String xqzj = "";
		String xqgl = "";
		String yhxx = "";
		String yhxg = "";
		String xssh = "";
		String bmsh = "";
		String tjcx = "";
		
		juese = req.getParameter("js");
		
		String sql = "select * from JueSe where juese = '"+juese+"'";
		ResultSet rs = db.executeQuery(sql);
		try {
			rs.next();
			xqzj = rs.getString("xqzj");
			xqgl = rs.getString("xqgl");
			yhxx = rs.getString("yhxx");
			yhxg = rs.getString("yhxg");
			xssh = rs.getString("xssh");
			bmsh = rs.getString("bmsh");
			tjcx = rs.getString("tjcx");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(xqzj);
		jsonobject.put("xqzj_qx", xqzj);
		jsonobject.put("xqgl_qx", xqgl);
		jsonobject.put("yhxx_qx", yhxx);
		jsonobject.put("yhxg_qx", yhxg);
		jsonobject.put("xssh_qx", xssh);
		jsonobject.put("bmsh_qx", bmsh);
		jsonobject.put("tjcx_qx", tjcx);
		resp.getWriter().append(jsonobject.toString());
			
		
	}

}
