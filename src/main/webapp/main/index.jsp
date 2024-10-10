<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<h3>*** 메인 화면 ***</h3>
<% if(session.getAttribute("memId") == null ) { // 로그아웃 상태 %>
	<!-- http://localhost:8080/11-board/member/loginForm.jsp -->
	<a href="../member/loginForm.jsp">로그인</a><br>
	<a href="../member/writeForm.jsp">회원가입</a><br>
<% } else { // 로그인 상태 %>
	<a href="../member/logout.jsp">로그아웃</a><br>
	<a href="../member/modifyForm.jsp">회원정보수정</a><br>
	<a href="../board/boardWriteForm.jsp">글쓰기</a><br>
<% } %>		

   <a href="../board/boardList.jsp">목록</a><br>
</body>
</html>