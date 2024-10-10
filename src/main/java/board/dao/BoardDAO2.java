package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import board.bean.BoardDTO;

public class BoardDAO2 {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "C##jspexam";
	String password = "m1234";

	// ojdbc8.jar 등록확인
	public BoardDAO2() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// db 접속하기
	public Connection getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	// db 접속끊기
	public void close() {
		try {
			if (rs != null)	rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// insert
	public int boardwrite(BoardDTO dto) {
		int result = 0;
		String sql = "insert into board values "
				   + "(seq_board.nextval, ?, ?, ?, ?, 0, sysdate)";
		// 1. db 접속하기
	    conn = getConnection();
	    try {
	    	// 2. db 작업
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
	        pstmt.setString(2, dto.getName());
	        pstmt.setString(3, dto.getSubject());
	        pstmt.setString(4, dto.getContent());
	        
	        result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 3. 접속끊기
			close();
		}
	    return result;
	}

}
