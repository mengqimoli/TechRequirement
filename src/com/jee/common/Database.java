package com.jee.common;

import java.sql.*;

public class Database {
	private String driverStr = "com.microsoft.sqlserver.jdbc.SQLServerDriver";//����JDBC���� 
	private String connStr = "jdbc:sqlserver://localhost:1433; DatabaseName=dbHeibeiSurvey";//���ӷ����������ݿ�
	private String dbusername = "����";//���ݿ��û���
	private String dbpassword = "wang513901";//���ݿ�����
	private Connection conn = null;
	private Statement stmt = null;

	public Database() {
		try {
			Class.forName(driverStr);//������������
			conn = DriverManager.getConnection(connStr, dbusername, dbpassword);//��������
			stmt = conn.createStatement();//���������SQL���
		} catch (Exception ex) {
			System.out.println("�޷�ͬ���ݿ⽨�����ӣ�");
		}
	}

	public int executeUpdate(String s) {
		int result = 0;
		try {
			result = stmt.executeUpdate(s);//�γɽ����
		} catch (Exception ex) {
			System.out.println("ִ�и��´���");
		}
		return result;
	}

	public ResultSet executeQuery(String s) {
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(s);
		} catch (Exception ex) {
			System.out.println("ִ�в�ѯ����");
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
			stmt.close();//�ر�SQL��伯
			conn.close();//�ر�SQL��伯
		} catch (Exception e) {
		}
	}

}
