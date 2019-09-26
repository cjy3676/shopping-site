package shopping_site.jdbc;

import java.sql.*;

public class Connect {
	public Connection connection() throws SQLException {
		String aa = "jdbc:mysql://localhost:3307/shopping_site?useSSL=false";
		String bb = "root";
		String cc = "1234";
		Connection conn = DriverManager.getConnection(aa, bb, cc);
		return conn;
	}
	
	public static Connection connection2() throws SQLException {
		String aa = "jdbc:mysql://localhost:3307/shopping_site?useSSL=false";
		String bb = "root";
		String cc = "1234";
		Connection conn = DriverManager.getConnection(aa, bb, cc);
		return conn;
	}
}
