<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	// 데이터 저장
	request.setCharacterEncoding("utf-8");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String id = (String)session.getAttribute("memId");
	String name = (String)session.getAttribute("memName");
	// db 작업
	BoardDTO dto = new BoardDTO();
	dto.setId(id);
	dto.setName(name);
	dto.setSubject(subject);
	dto.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	int result = dao.boardwrite(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    if(<%=result > 0 %>) {
    	alert("작성하신 글을 저장하였습니다.")
    } else {
    	alert("작성하신 글을 저장하지 못하였습니다.")
    }
    location.href = "boardList.jsp?pg=1";
    
</script>

</head>
<body>
	<% if(result > 0) { %>
		작성하신 글을 저장하였습니다.
	<% } else { %>
		작성하신 글을 저장하지 못했습니다.
	<% } %>
<%--
	<p>글쓴이: <%=name %></p>
    <p>제목: <%=subject %></p>
    <p>내용: <%=content %></p>
 --%>    
</body>
</html>