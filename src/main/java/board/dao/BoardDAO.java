package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;   // 커넥션풀을 관리하는 클래스

	public BoardDAO() {
		Context context;
		try {
			context = new InitialContext();
			// 톰캣인 경우, 자바에서 DataSource 객체를 찾을 경우,
			// 반드시 커넥션풀 설정 앞에, "java:comp/env/"를 붙여야한다.
			// 이것은 context.xml -> <Context> -> <Resource> -> name
			// 속성 까지를 나타낸다.
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}		
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
		
	    try {
	    	// 1. db 접속하기
		    conn = ds.getConnection();
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
    // 목록보기
	public List<BoardDTO> boardList(int startNum, int endNum) {
	      List<BoardDTO> list = new ArrayList<BoardDTO>();
	      String sql = "select seq, id, name, subject, content, hit, "
	            + " to_char(logtime, 'YYYY.MM.DD') as logtime from "
	            + " (select rownum rn, tt.* from "
	            + " (select * from board order by seq desc) tt) "
	            + " where rn>=? and rn<=?";

			
			try {
		    	// 1. db 접속하기
			    conn = ds.getConnection();
		    	// 2. db 작업
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startNum);
		        pstmt.setInt(2, endNum);
		        rs = pstmt.executeQuery();
		        
		        while(rs.next()) {
		        	BoardDTO dto = new BoardDTO();
		        	dto.setSeq(rs.getInt("seq"));
		        	dto.setId(rs.getString("id"));
		        	dto.setName(rs.getString("name"));
		        	dto.setSubject(rs.getString("subject"));
		        	dto.setContent(rs.getString("content"));
		            dto.setHit(rs.getInt("hit"));
		            dto.setLogtime(rs.getString("logtime"));
		            // 리스트에 저장
		            list.add(dto);
		        }
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				// 3. 접속끊기
				close();
			}
		    return list;
		}
	  
	    // 상세보기
	    public BoardDTO boardView(int seq) {
	    	BoardDTO dto = null;
	    	String sql = "select * from board where seq=?";
	    	try {
				conn = ds.getConnection();
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, seq);
                rs = pstmt.executeQuery();
                
                if(rs.next()) {
                	dto = new BoardDTO();
                    dto.setSeq(rs.getInt("seq"));
                    dto.setId(rs.getString("id"));
                    dto.setName(rs.getString("name"));
                    dto.setSubject(rs.getString("subject"));
                    dto.setContent(rs.getString("content"));
                    dto.setHit(rs.getInt("hit"));
                    dto.setLogtime(rs.getString("logtime"));
                }
	    	} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
	    	return dto;
	    }
        // 총글수 구하기
	    public int getTotalA() {
	    	int totalA = 0;
	    	String sql = "select count(*) as cnt from board";
            try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					totalA = rs.getInt("cnt");
				}
			} catch (SQLException e) {
			
				e.printStackTrace();
			} finally {
				close();
			}
            return totalA;
	    }
	    // 조회수 증가
	    public int updateHit(int seq) {
	    	int result = 0;
	    	String sql = "update board set hit=hit+1 where seq=?";
	    	
	    	try {
		    	// 1. db 접속하기
			    conn = ds.getConnection();
		    	// 2. db 작업
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, seq); 
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				// 3. 접속끊기
				close();
			}
		    return result;
		}
	    // 삭제하기
	    public int boardDelete(int seq) {
	    	int result = 0;
	    	String sql = "delete board where seq=?";
			//insert/delete/update => executeupdate
	    	try {
				conn = ds.getConnection();
	    		pstmt = conn.prepareStatement(sql);
	    		pstmt.setInt(1, seq);
	    		result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
	    	
	    	return result;
	    	
	    	
	    }
	    // 글수정
	    public int boardModify(BoardDTO dto) {
	    	int result = 0;
	    	String sql = "update board set subject=?, content=? where seq=?";
	    	
	    	try {
		    	// 1. db 접속하기
			    conn = ds.getConnection();
		    	// 2. db 작업
				pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, dto.getSubject());
		        pstmt.setString(2, dto.getContent());
		        pstmt.setInt(3, dto.getSeq());
		        
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
