<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shopping_site.Dto.Board_Dto" %>
<%@ page import="shopping_site.Command.UpdateCommand" %> 
<%@ page import="java.util.ArrayList" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		UpdateCommand updateCommand = new UpdateCommand();
		ArrayList<Board_Dto> list = updateCommand.update(id);
	%>
	
	<form method="post" action="update_ok.jsp">
	<input type="hidden" name="id" value="<%=id%>">
		이름 <input type="text" name="name" value="<%=list.get(0).getName()%>"><p>
		제목 <input type="text" name="title" size="50" value="<%=list.get(0).getTitle()%>"><p>
		내용<textarea name="content" rows="4" cols="50"><%=list.get(0).getContent()%></textarea><p>
		<input type="submit" value="저장">
	</form>
</body>
</html>