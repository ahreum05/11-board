<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  // 데이터 저장하기
    int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	BoardDAO dao = new BoardDAO();
	int result = dao.boardDelete(seq);
    System.out.println("result = " + result);
   
    
    // 데이터 삭제하기
   
        
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
if(<%=result > 0 %>) {
	alert("삭제 성공")
} else {
	alert("삭제 실패")
}
location.href = "boardList.jsp?pg=<%=pg%>";
</script>
</head>
<body>
 

</body>
</html>