package com.jee.common;

import java.sql.*;

public class Database {
	private String driverStr = "com.microsoft.sqlserver.jdbc.SQLServerDriver";//加载JDBC驱动 
	private String connStr = "jdbc:sqlserver://localhost:1433; DatabaseName=dbHeibeiSurvey";//连接服务器和数据库
	private String dbusername = "茉莉";//数据库用户名
	private String dbpassword = "wang513901";//数据库密码
	private Connection conn = null;
	private Statement stmt = null;

	public Database() {
		try {
			Class.forName(driverStr);//加载驱动器类
			conn = DriverManager.getConnection(connStr, dbusername, dbpassword);//建立连接
			stmt = conn.createStatement();//建立处理的SQL语句
		} catch (Exception ex) {
			System.out.println("无法同数据库建立连接！");
		}
	}

	public int executeUpdate(String s) {
		int result = 0;
		try {
			result = stmt.executeUpdate(s);//形成结果集
		} catch (Exception ex) {
			System.out.println("执行更新错误！");
		}
		return result;
	}

	public ResultSet executeQuery(String s) {
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(s);
		} catch (Exception ex) {
			System.out.println("执行查询错误！");
		}
		return rs;
	}
	public ResultSet sel(String s) throws SQLException
	{
		ResultSet rs = null;
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		rs=stmt.executeQuery(s);
		return rs;
	}

	public void close() {
		try {
			stmt.close();//关闭SQL语句集
			conn.close();//关闭SQL语句集
		} catch (Exception e) {
		}
	}

}
