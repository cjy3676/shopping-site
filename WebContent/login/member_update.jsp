<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shopping_site.Command.Update"%>
<%
    Update up = new Update();
    up.update_exe(session.getAttribute("userid").toString()); // Update클래스에 update_exe() 메소드 호출
    
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" type="text/css" href="../etc/main.css?after">
<script src="../etc/main.js?abc"></script>
</head>
<body onload="load_init()">
	<!-- 메인페이지 -->
	<jsp:include page="../left.jsp" flush="false"/>

	<div id="right">
		<section class="member_update_section"></section>
		<jsp:include page="../footer.jsp" flush="false"/>
	</div>
</body>
</html>