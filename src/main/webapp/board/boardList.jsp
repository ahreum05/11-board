<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    int pg = 1;
    if(request.getParameter("pg") != null && 
    		!request.getParameter("pg").equals("")){
    	pg = Integer.parseInt(request.getParameter("pg"));
    }
    //System.out.println("pg = " + pg);
    
    // (1) db : 목록얻어오기
    
    // 1페이지당 5개씩 목록 출력
    // pg = 1  rn >=1 and rn <= 5
    // pg = 2  rn >=6 and rn <= 10
    // pg = 3  rn >=11 and rn <= 15
    int endNum = pg * 5;
    int startNum = endNum - 4;
    
    BoardDAO dao  = new BoardDAO();
    List<BoardDTO> list = dao.boardList(startNum, endNum);
    
    // (2) 페이징 처리
    // 총글수 : 12    총페이지 수 : 3
    // 총글수 : 23    총페이지 수 : 5
    // 총글수 : 25    총페이지 수 : 5
    // 총페이지수 계산식 : (총글수 + 4)/5
    int totalA = dao.getTotalA();  // 총글수
    int totalP = (totalA + 4) / 5; // 총페이지수
    
    // 3블럭
    // 총페이지수 : 8
    //           [1][2][3][다음]
    //      [이전][4][5][6][다음]
    //      [이전][7][8]
    int startPage = (pg-1)/3*3 + 1; 
    int endPage = startPage + 2;
    if(endPage > totalP) endPage = totalP;
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
     function isLogin(seq){
    	 if(<%=session.getAttribute("memId") == null%>){
    		 alert("먼저 로그인하세요.");
    	 } else {
    		 location.href="boardView.jsp?seq=" + seq + "&pg=" + <%=pg%>
    	 }
     }

</script>
<style type="text/css">
#subjectA:link {color:black; text-decoration: none;}   <%--link는 아직 방문하지 않은 링크 상태를 나타냅니다 --%>
#subjectA:visited {color:black; text-decoration: none;} <%--visited는 이미 방문한 링크 상태를 나타냅니다.--%>
#subjectA:hover {color:green; text-decoration: underline;}<%--hover는 마우스를 링크 위에 올렸을 때의 상태를 나타냅니다.--%>
#subjectA:active {color:black; text-decoration: none;} <%--클릭했을 때의 링크 상태를 나타냅니다 --%>

.paging {color: blue; text-decoration: none;}
.currentPaging {color: red; text-decoration: underline;}

</style>
</head>
<body>
    <table border="1" width="500">
       <tr style="background:yellow; text-align: center;">
           <td><b>글번호</b></td>
           <td><b>제목</b></td>
           <td><b>작성자</b></td>
           <td><b>작성일</b></td>
           <td><b>조회수</b></td>
       </tr>
   <%-- for(int i=0; i<list.size(); i++) {
	   BoardDTO dto = list.get(i);
   --%>
   <% for(BoardDTO dto : list) { %>
       <tr style="background: #ffffdd; text-align: center;">
           <td><%=dto.getSeq()%></td>
           <td width="200">
              <a href="#" id="subjectA"
              onclick="isLogin(<%=dto.getSeq()%>)"><%=dto.getSubject()%></a>
           </td>
           <td><%=dto.getName()%></td>
           <td><%=dto.getLogtime()%></td>
           <td><%=dto.getHit()%></td>   
       </tr>            
   <% } %>
       <tr>
           <td colspan="5" align="center">
           <% if(startPage >3) { %>
               [<a href="boardList.jsp?pg=<%=startPage-1 %>"
                   class="paging">이전</a>]
           <% } %>
               
           <% for(int i=startPage; i<=endPage; i++){ %>
               <%if(pg == i) { // 현재페이지  %>
               [<a href="boardList.jsp?pg=<%=i%>"
                   class="currentPaging"><%=i%></a>] 
               <% } else { // 다른페이지 %>
               [<a href="boardList.jsp?pg=<%=i%>"
                   class="paging"><%=i%></a>]    
               <% } %>
           <% } %>
           
           <% if(endPage < totalP) { %>
               [<a href="boardList.jsp?pg=<%=endPage+1%>">다음</a>]
           <% } %>
<%--           <% if(startPage > 3) { %>    
               [<a href="boardList.jsp?pg=<%=startPage - 1%>"
                   class = "paging">>이전</a>]
           <% } %>
            
           <% for(int i=startPage; i<=endPage; i++) { %>
               <% if(pg == i) {    // 현재페이지 이면 %>
               [<a href="boardList.jsp?pg=<%=i%>"
                   class = "currentPaging"><%=i%></a>]
               <% } else {  // 현재페이지가 아니면 %>
               [<a href="boardList.jsp?pg=<%=i%>"
                   class = "paging"><%=i%></a>]
               <% } %>
           <% } %>
           
           <% if(endPage < totalP) { %> 
               [<a href="boardList.jsp?pg=<%=endPage + 1%>">다음</a>]
           <% } %>
--%>            
           </td>
       </tr>
    </table>
    <%if(session.getAttribute("memId") != null) { %>
       <a href="boardWriteForm.jsp">글쓰기</a>
    <% } else { %>
       <a href="../member/loginForm.jsp">로그인</a>
    <% } %>  
    <a href="../main/index.jsp">메인화면</a>
</body>
</html>