<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  // 한글 인코딩 설정 
	request.setCharacterEncoding("UTF-8");
	// 1. 클라이언트로부터 전달된 데이터 저장
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String gender = request.getParameter("gender");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String addr = request.getParameter("addr");
	// 2. db 작업
	MemberDTO dto = new MemberDTO();
	dto.setName(name);
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setGender(gender);
	dto.setEmail1(email1);
	dto.setEmail2(email2);
	dto.setTel1(tel1);
	dto.setTel2(tel2);
	dto.setTel3(tel3);
	dto.setAddr(addr);
	// db에 저장
	MemberDAO dao = new MemberDAO();
	int result = dao.write(dto);	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
p {margin: 0;}
</style>
</head>
<body>
	<% if(result > 0) { %>
		<p>저장 성공</p>
	<% } else { %>
		<p>저장 실패</p>
	<% } %>

<%-- 
	<p>이름: <%=name %></p>
    <p>아이디: <%=id %></p>
    <p>비밀번호: <%=pwd %></p>
    <p>성별: <%=gender %></p>
    <p>이메일: <%=email1 %>@<%=email2 %></p>
    <p>핸드폰: <%=tel1 %>-<%=tel2 %>-<%=tel3 %></p>
    <p>주소: <%=addr %></p>
--%>    	
</body>
</html>