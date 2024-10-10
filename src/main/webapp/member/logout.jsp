<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	// 세션 삭제
	session.removeAttribute("memName");
	session.removeAttribute("memId");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		alert("로그아웃");
		location.href = "../main/index.jsp";
	}
</script>
</head>
<body>

</body>
</html>