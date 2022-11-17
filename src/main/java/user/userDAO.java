package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import util.DatabaseUtil;
import java.sql.ResultSet;

public class userDAO {
	Connection conn=DatabaseUtil.getConnection();
	
	public int join(String UserID, String UserName, String UserEmail, String UserPhone, String UserPW) {
		String SQL = "INSERT INTO members VALUES (?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, UserID);
			pstmt.setString(2, UserName);
			pstmt.setString(3, UserEmail);
			pstmt.setString(4, UserPhone);
			pstmt.setString(5, UserPW);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return -1;
	}
	
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public int login(String UserID, String UserPW) {
		String sql = "SELECT UserPW FROM members WHERE UserID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql); //mysql db 연결
			
			pstmt.setString(1,UserID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(UserPW)) {
					return 1; //로그인 성공
				} else
					return 0; //비밀번호 틀림
			
			}
			return -1; //아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //오류

	}
}
