<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/memberScript.js"></script>
<!-- 
<script type="text/javascript" 
	src="http://localhost:8080/10-member/script/memberScript.js"></script>
 -->	
</head>
<body>
	<form action="write.jsp" name="form1" method="post">
		<table border="1" width="370">
			<tr>
	            <td width="70" align="center">이름</td>
	            <td><input type="text" name="name" placeholder="이름 입력"></td>
	        </tr>
			<tr>
	            <td align="center">아이디</td>
	            <td>
	            	<input type="text" name="id">
	            	<input type="button" value="중복체크" onclick="checkId()">
	            </td>
	        </tr>
			<tr>
	            <td align="center">비밀번호</td>
	            <td><input type="password" name="pwd"></td>
	        </tr>
	        <tr>
	            <td align="center">재확인</td>
	            <td><input type="password" name="repwd"></td>
	        </tr> 
	        <tr>
	            <td align="center">성별</td>
	            <td>
		            <input type="radio" name="gender" value="m" checked>남
		            <input type="radio" name="gender" value="f">여
	            </td>
	        </tr> 
	        <tr>
	            <td align="center">이메일</td>
	            <td>
		            <input type="text" name="email1" size="17">@
		            <select name="email2">
		               <option>naver.com</option>
		               <option>daum.net</option>
		               <option>google.com</option>
		            </select>
	            </td>            
	        </tr>         
	        <tr>
	            <td align="center">핸드폰</td>
	            <td>
		            <select name="tel1">
		               <option value="010">010</option>
		               <option value="011">011</option>
		               <option value="019">019</option>
		            </select>-
		            <input type="text" name="tel2" size="10">-
		            <input type="text" name="tel3" size="10">
	            </td>
	        </tr>         
	        <tr>
	            <td align="center">주소</td>
	            <td><input type="text" name="addr" size="35"></td>
	        </tr>  
	        <tr>
	            <td colspan="2" align="center">
	               <input type="button" value="회원가입" onclick="inputCheck()">
	               <input type="reset" value="다시 작성">
	            </td>
	        </tr>	             
		</table>
	</form>
	<a href="../main/index.jsp">메인화면</a>
</body>
</html>


