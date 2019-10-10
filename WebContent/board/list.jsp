<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shopping_site.Command.ListCommand" %>    
<%@ page import="shopping_site.Dto.Board_Dto" %>
<%@ page import="java.util.ArrayList" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// Command에 list관련클래스, Dao에 list 동작하는 메소드추가 
		// DB 커넥션
		// 쿼리 실행
		// 레코드를 가져오기
		ListCommand listCommand = new ListCommand();
		ArrayList<Board_Dto> list = listCommand.listCom();
	%>
	<table width="600" border="0">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>조회수</td>
			<td>작성일</td>
		</tr>
		<%
			// list의 갯수만큼 출력
			for (int i = 0; i < list.size(); i++) {
		%>
		<tr>
			<td><%=list.get(i).getId()%></td>
			<td><%=list.get(i).getName()%></td>
			<td>
			<a href="content.jsp?id=<%=list.get(i).getId()%>"><%=list.get(i).getTitle()%></a>
			</td>
			<td><%=list.get(i).getReadnum()%></td>
			<td><%=list.get(i).getWriteday()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>