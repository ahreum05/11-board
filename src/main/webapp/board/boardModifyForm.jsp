<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  // 데이터 저장
   
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
    // db 작업 : 1줄 데이터 읽기
    BoardDAO dao = new BoardDAO();
    BoardDTO dto = dao.boardView(seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
		src="../script/boardScript.js?v=1">
</script>
</head>
<body>
   <form action="boardModify.jsp" name="form1" method="post">
        <input type="hidden" name="seq" value="<%=seq %>">
        <input type="hidden" name="pg" value="<%=pg %>">
        
		<table border="1" width="500">
			<tr>
            	<th width="70">제목</th>
            	<td><input type="text" name="subject" 
            			style="width: 30em"
            	        value="<%=dto.getSubject()%>">
                </td>
			</tr>
			<tr>
	            <th>내용</th>
	            <td><textarea name="content" 
	            	style="width: 30em; height: 15em">
	            	<%=dto.getContent() %></textarea>
	            </td>
	        </tr>
			<tr>
	            <td colspan="2" align="center">
	               <input type="button" value="글수정" 
	               			onclick="checkBoardModify()">
	               <input type="button" value="다시 작성"
	                        onclick="reset1()">
	            </td>
	        </tr>			
		</table>
	</form>

</body>
</html>