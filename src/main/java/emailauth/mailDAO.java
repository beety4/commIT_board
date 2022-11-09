package emailauth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import connectdb.mysql;

public class mailDAO {
	Connection conn = mysql.getConnection();
	
	public int getemailcheck(String userID) {
		String SQL = "SELECT emailcheck FROM user_table WHERE id = ?";
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1) == 1) {
					return 1;
				}
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	

	public int setemailcheck(String userID) {
		String SQL = "UPDATE user_table SET emailcheck = '1' WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	

	public String getemail(String userID) {
		String SQL = "SELECT email FROM user_table WHERE id = ?";
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

}
