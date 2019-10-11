<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shopping_site.Dto.Board_Dto"%>
<%@ page import="shopping_site.Command.Write"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- useBean을 통해 Dto 값을 전달 -->
	<jsp:useBean id="dto" class="shopping_site.Dto.Board_Dto">
		<jsp:setProperty name="dto" property="*" />
	</jsp:useBean>

	<%
		//shopping_site 패키지에 있는 write클래스 호출
		Write w = new Write();
		w.write(dto);
		response.sendRedirect("list.jsp");
	%>
</body>
</html>