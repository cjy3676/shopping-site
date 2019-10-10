<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shopping_site.Command.ContentCommand"%>    
<%@ page import="shopping_site.Dto.Board_Dto"%>
<%@ page import="java.util.ArrayList"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		ContentCommand contentCommand = new ContentCommand();
		ArrayList<Board_Dto> list = contentCommand.content(id);
	%>
	<table width="600">
		<tr>
			<td>제목</td>
			<td colspan="3"><%=list.get(0).getTitle()%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=list.get(0).getName()%></td>
			<td>조회수</td>
			<td><%=list.get(0).getReadnum()%></td>
		</tr>

		<tr>
			<td>내용</td>
			<td colspan="3"><%=list.get(0).getContent()%></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td colspan="3"><%=list.get(0).getWriteday()%></td>
		</tr>
		<td colspan="4">
		<a href="update.jsp?id=<%=id%>">수정</a>&nbsp;&nbsp; 
		<a href="delete.jsp?id=<%=id%>">삭제</a>
		</td>
	</table>
</body>
</html>