package com.kh.myapp;

import static org.junit.Assert.fail;


import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;


public class JDBCTest {
	
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "khfinal", "0630")){
			System.out.println(con);
			System.out.println("연결 성공");
			
			
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}

}
