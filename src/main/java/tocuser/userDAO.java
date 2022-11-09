package tocuser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import connectdb.mysql;

public class userDAO {
	Connection conn = mysql.getConnection();
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT pw,name FROM user_table WHERE id = ?";
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			String digest = encrypt.getSHA512(userPassword);
			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(digest)) {
					return 1;
				}
				else
					return 0;
			}
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	public int join(String userID, String userPassword, String Name, String Email, String Emailhash, int Emailcheck) {
		String SQL = "INSERT INTO user_table (id,pw,name,email,emailhash,emailcheck) VALUES (?,?,?,?,?,0)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			String digest = encrypt.getSHA512(userPassword);
			pstmt.setString(1, userID);
			pstmt.setString(2, digest);
			pstmt.setString(3, Name);
			pstmt.setString(4, Email);
			pstmt.setString(5, Emailhash);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	

	
}
