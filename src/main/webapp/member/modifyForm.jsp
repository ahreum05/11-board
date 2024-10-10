<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  // 한글 인코딩 설정 
	request.setCharacterEncoding("UTF-8");
    String id = (String)session.getAttribute("memId");
    // db에 저장
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMember(id);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/memberScript.js?v=1"></script>
<style type="text/css">
table, th, td {
    border : 1px solid black;
}
</style>
</head>
<body>
<body>
	<form action="modify.jsp" name="form1" method="post">
		<table width="500">
			<tr>
	            <td>이름</td>
	            <td><input type="text" name="name"
	                       value=<%=dto.getName()%> readonly></td>
	        </tr>
			<tr>
	            <td>아이디</td>
	            <td>
	            	<input type="text" name="id"
	            	       value=<%=dto.getId()%> readonly></td>
	  
	        </tr>
			<tr>
	            <td align="center">비밀번호</td>
	            <td><input type="password" name="pwd"
	                       value="<%=dto.getPwd()%>"></td>
	        </tr>
	        <tr>
	            <td align="center">재확인</td>
	            <td><input type="password" name="repwd"
	                       value="<%=dto.getPwd()%>"></td>
	        </tr> 
	        <tr>
	            <td>성별</td>
	            <td>
	               <% if(dto.getGender().equals("m")){ %>
		            <input type="radio" name="gender" value="m" checked>남
		            <input type="radio" name="gender" value="f">여
		           <% } else { %>
		            <input type="radio" name="gender" value="m" >남
		            <input type="radio" name="gender" value="f" checked>여
		           <% } %>
	            </td>
	        </tr> 
	        <tr>
	            <td align="center">이메일</td>
	            <td>
		            <input type="text" name="email1" 
		                   value="<%=dto.getEmail1()%>">@
		            <input type="text" name="email2"
		                   value="<%=dto.getEmail2()%>">
	            </td>            
	        </tr>         
	        <tr>
	            <td>핸드폰</td>
	            <td>
	                <input type="text" name="tel1" 
		                   value="<%=dto.getTel1()%>">-
		            <input type="text" name="tel2"
		                   value="<%=dto.getTel2()%>">-
		            <input type="text" name="tel3"
		                   value="<%=dto.getTel3()%>">
		    
	            </td>            
	        </tr>         
	        <tr>
	            <td align="center">주소</td>
	            <td><input type="text" name="addr" size="50"
	                       value="<%=dto.getAddr() %>"></td>
	        </tr>  
	        <tr>
	            <td colspan="2" align="center">
	               <input type="button" value="회원정보수정" 
	                      onclick="checkModify()">
	               <input type="reset" value="다시 작성">
	            </td>
	        </tr>	             
		</table>
	</form>
	<a href="../main/index.jsp">메인화면</a>
</body>
</html>