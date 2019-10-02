<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../etc/main.css?after">
<script src="../etc/main.js"></script>
</head>
<body>
	<jsp:include page="../left.jsp" flush="false" />
	<div id="right">
		<section class="list_section">
			<!-- pro_list.jsp 시작 -->
			<%@ page import="java.sql.*"%>
			<%@ page import="shopping_site.jdbc.Connect"%>
			<%@ page import="java.text.DecimalFormat"%>
			<%@ page import="shopping_site.Command.Pro_list"%>			
			<%@ page import="shopping_site.Dto.Product"%>			
			<%@ page import="java.util.ArrayList"%>			
			<%
				// DB연결
/* 				Connection conn = Connect.connection2();
				Statement stmt = conn.createStatement();

				// 가져올 쿼리 작성
				String sql = "select * from product where pcode like 'p01%' limit 0,24";

				// 쿼리 실행 
				ResultSet rs = stmt.executeQuery(sql); */
			%>
			<table width="800" cellspacing="30" border="0">
				<tr>
					<%
						// 출력 
						/* DecimalFormat df = new DecimalFormat("#,###"); */
						String pcode = request.getParameter("pcode");
						Pro_list plist = new Pro_list();
						ArrayList<Product> list = plist.pro_list(pcode);

                        for(int i=1; i<=list.size(); i++) {
					%>
					<td>
					<p align="center">
					<img width="125" height="250" src="img/<%=list.get(i-1).getPlist()%>">
					</p>
					<p align="center"><%=list.get(i-1).getPname()%></p>
					<p align="right">♨<%=list.get(i-1).getPrice()%></p>
					</td>
					<%
						if (i % 4 == 0) {
					%>
				</tr>
				<tr>
					<%
						}
						}
					%>
				</tr>
			</table>
		</section>
		<jsp:include page="../footer.jsp" flush="false" />
	</div>
</body>
</html>