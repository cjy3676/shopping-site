<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../etc/main.css?after">
<script src="../etc/main.js?abc"></script>
</head>
<body>
	<jsp:include page="../left.jsp" flush="false" />
	<div id="right">
		<section class="list_section">
			<!-- pro_list.jsp 시작 -->
			<%@ page import="java.sql.*"%>
			<%@ page import="shopping_site.jdbc.Connect"%>
			<%@ page import="java.text.DecimalFormat"%>
			<%
				// DB연결
				Connection conn = Connect.connection2();
				Statement stmt = conn.createStatement();

				// 가져올 쿼리 작성
				String sql = "select * from product where pcode like 'p01%' limit 0,24";

				// 쿼리 실행 
				ResultSet rs = stmt.executeQuery(sql);
			%>
			<table width="800" cellspacing="30" border="0">
				<tr>
					<%
						// 출력 
						DecimalFormat df = new DecimalFormat("#,###");
						int i = 1;
						while (rs.next()) {
					%>
					<td>
					<p align="center">
					<img width="125" height="250" src="img/<%=rs.getString("plist")%>">
					</p>
					<p align="center" width="600"><%=rs.getString("pname")%></p>
					<p align="right">♨<%=df.format(rs.getInt("price"))%></p>
					</td>
					<%
						if (i % 4 == 0) {
					%>
				</tr>
				<tr>
					<%
						}
							i++;
						}
					%>
				</tr>
			</table>
		</section>
		<jsp:include page="../footer.jsp" flush="false" />
	</div>
</body>
</html>