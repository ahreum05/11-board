<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/memberScript.js?v=2"></script>
</head>
<body>
	<form name="form1" action="login.jsp" method="post">
		<table border="1">
			<tr>
               <td>아이디</td>
               <td><input type="text" name="id"></td>
            </tr>
			<tr>
               <td>비밀번호</td>
               <td><input type="password" name="pwd"></td>
            </tr>
			<tr>
               <td colspan="2" align="center">
	               <input type="button" value="로그인" onclick="login()">
	               <input type="button" value="회원가입" 
	               			onclick="location.href='writeForm.jsp'">
               </td>
            </tr>			
		</table>
	</form>
	<a href="../main/index.jsp">메인화면</a>
</body>
</html>


