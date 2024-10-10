<%@page import="java.net.URLEncoder"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	// 1. 데이터 저장
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	// 2. db 작업
	MemberDAO dao = new MemberDAO();
	String name  = dao.login(id, pwd);
	// 3. 페이지 이동
	if(name != null) {
		// 로그인 성공
		/* 세션에 데이터 저장 */
		session.setAttribute("memName", name);
		session.setAttribute("memId", id);
		// 페이지 이동
		response.sendRedirect("loginOk.jsp");
		
		// 페이지 이동시 데이터 전송을 get방식으로 전송하면 이름과 id가 오픈되기 
		// 때문에 보안에 안좋다.
		// 그래서 보안에 관련된 데이터를 전송할 경우, 쿠키 또는 세션을 사용한다.
		//response.sendRedirect("loginOk.jsp?name="
		//			+ URLEncoder.encode(name, "utf-8") +"&id=" + id);
	} else {
		// 로그인 실패
		response.sendRedirect("loginFail.jsp");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	<!-- 3. 결과 출력 -->
	<% if(name != null) { %>
		<p><%=name%>님이 로그인</p>
	<% } else { %>
		<p>아이디 또는 비밀번호가 틀렸으니 다시 로그인하세요.</p>
	<% } %>
--%>	
</body>
</html>