<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String name = request.getParameter("name");
	//String id = request.getParameter("id");
	String name = (String)session.getAttribute("memName");
	String id = (String)session.getAttribute("memId");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img alt="투미가방" src="../image/tumi.png" width="30" height="30"
		style="cursor: pointer;"
		onclick="location.href='../main/index.jsp'">
	<%=id%>(<%=name%>)님이 로그인 
</body>
</html>