<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
		src="../script/boardScript.js"></script>
</head>
<body>
	<form action="boardWrite.jsp" name="form1" method="post">
		<table border="1" width="500">
			<tr>
            	<th width="70">제목</th>
            	<td><input type="text" name="subject" 
            			style="width: 30em"></td>
			</tr>
			<tr>
	            <th>내용</th>
	            <td><textarea name="content" 
	            	style="width: 30em; height: 15em"></textarea>
	            </td>
	        </tr>
			<tr>
	            <td colspan="2" align="center">
	               <input type="button" value="글쓰기" 
	               			onclick="inputCheck()">
	               <input type="reset" value="다시 작성">
	            </td>
	        </tr>			
		</table>
	</form>
</body>
</html>