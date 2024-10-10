package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import board.bean.BoardDTO;
import member.bean.MemberDTO;

public class MemberDAO {
   Connection conn;
   PreparedStatement pstmt;
   ResultSet rs;
   String driver = "oracle.jdbc.driver.OracleDriver";
   String url = "jdbc:oracle:thin:@localhost:1521:xe";
   String username = "C##jspexam";
   String password = "m1234";
   
   // ojdbc8.jar 등록확인
   public MemberDAO() {
      try {
         Class.forName(driver);
      } catch (ClassNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
   
   // db 접속하기
   public Connection getConnection() {
      try {
         conn = DriverManager.getConnection(url, username, password);
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return conn;
   }
   
   // db 접속 끊기
   public void close() {
      try {
         if(rs != null) rs.close();
         if(pstmt != null) pstmt.close();
         if(conn != null) conn.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }   
   // insert 
   public int write(MemberDTO dto) {
      int result = 0;
      String sql = "insert into member values "
            + "(?,?,?,?,?,?,?,?,?,?,sysdate)";
      // 1. db 접속하기
      conn = getConnection();
      try {
         // 2. db 작업
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, dto.getName());
         pstmt.setString(2, dto.getId());
         pstmt.setString(3, dto.getPwd());
         pstmt.setString(4, dto.getGender());
         pstmt.setString(5, dto.getEmail1());
         pstmt.setString(6, dto.getEmail2());
         pstmt.setString(7, dto.getTel1());
         pstmt.setString(8, dto.getTel2());
         pstmt.setString(9, dto.getTel3());
         pstmt.setString(10, dto.getAddr());
         // 1) db에 sql문 전송 2) 응답 기다림 3) 응답 온 데이터 저장
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         // 3. db 접속 끊기
         close();
      }
      return result;
   }
   // select 
   public String login(String id, String pwd) {
      String name = null;
      String sql = "select * from member where id=? and pwd=?";
      MemberDTO dto = null;
      // 1. db 접속하기
      conn = getConnection();
      try {
         // 2. db 작업
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         pstmt.setString(2, pwd);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            name = rs.getString("name");
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
         }
         catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return name;
   }
   // id가 존재하는지 검사
   public boolean isExistId(String id) {
      boolean exist = false;
      String sql = "select * from member where id=?";
      conn = getConnection();
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            exist = true;
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close();
      }
      return exist;
   }
   // 1명 데이터 읽어오기
   public MemberDTO getMember(String id) {
      MemberDTO dto = null;
      String sql = "select * from member where id=?";
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            dto = new MemberDTO();
            dto.setName(rs.getString("name"));
            dto.setId(rs.getString("id"));
            dto.setPwd(rs.getString("pwd"));
            dto.setGender(rs.getString("gender"));
            dto.setEmail1(rs.getString("email1"));
            dto.setEmail2(rs.getString("email2"));
            dto.setTel1(rs.getString("tel1"));
            dto.setTel2(rs.getString("tel2"));
            dto.setTel3(rs.getString("tel3"));
            dto.setAddr(rs.getString("addr"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      }
      return dto;
   }
   // 수정하기
   public int modify(MemberDTO dto) {
      int result = 0;
      String sql = "update member set pwd=?, gender=?, "
            + "email1=?, email2=?, tel1=?, tel2=?, tel3=?, "
            + "addr=? where id=?";
      try {
         // 1. db 접속하기
         conn = getConnection();
         // 2. db 작업
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, dto.getPwd());
         pstmt.setString(2, dto.getGender());
         pstmt.setString(3, dto.getEmail1());
         pstmt.setString(4, dto.getEmail2());
         pstmt.setString(5, dto.getTel1());
         pstmt.setString(6, dto.getTel2());
         pstmt.setString(7, dto.getTel3());
         pstmt.setString(8, dto.getAddr());
         pstmt.setString(9, dto.getId());
         // 1) db에 sql문 전송 2) 응답 기다림 3) 응답 온 데이터 저장
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         // 3. db 접속 끊기
         close();
      }
      return result;
   }
   
   
}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	





