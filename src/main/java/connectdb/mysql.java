package connectdb;

import java.sql.Connection;
import java.sql.DriverManager;

public class mysql {
	public static Connection getConnection() {
		try {
			String DBurl = "jdbc:mysql://akotis.kr:3306/commIT";
			String DBid = "commITroot";
			String DBpw = "P@ssw0rd!";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(DBurl, DBid, DBpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
