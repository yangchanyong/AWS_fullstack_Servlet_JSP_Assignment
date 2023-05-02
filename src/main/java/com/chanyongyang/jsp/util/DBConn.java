package com.chanyongyang.jsp.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("DB접속정보", "DB계정", "PW");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
		
	}

}
