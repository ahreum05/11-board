<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	// db
	MemberDAO dao = new MemberDAO();
	boolean exist = dao.isExistId(id);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkIdClose() {
		// opener : 부모 브라우저를 관리하는 자바스크립트 내장 객체
		opener.form1.id.value = "<%=id%>";
		// window : 현재 브라우저를 관리하는 자바스크립트 내장 객체
		window.close();
		// 커서를 pwd로 옮기기
		opener.form1.pwd.focus();
	}
</script>
</head>
<body>
	<% if(exist) { %>
		<%=id %>는 사용중 입니다.<br><br>
		<form action="checkId.jsp" method="post">
			아이디 <input type="text" name="id">
				 <input type="submit" value="중복 체크">
		</form>
	<% } else { %>
		<%=id %>는 사용 가능합니다.<br><br>
		<input type="button" value="사용" onclick="checkIdClose()">
	<% } %>
</body>
</html>

