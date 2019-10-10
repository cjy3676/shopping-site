package shopping_site.jdbc;

import java.sql.*;

public class Connect
{
	   static String aa="jdbc:mysql://localhost:3307/amudo?useSSL=false";
	   static String bb="root";
	   static String cc="1234";
	   public static Connection getConnection() throws SQLException
	   {
	     Connection conn = DriverManager.getConnection(aa,bb,cc);
	     
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
