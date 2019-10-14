<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>     
<%
	Connection conn = Connect.connection2();
	// order_deli 테이블의 id
	String id = request.getParameter("id");
	String sql = "select * from order_deli,product where order_deli.pcode = product.pcode and order_deli.id="+ id;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../etc/main.css?after">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../etc/main.js?qwe22"></script>
</head>
<body>
<jsp:include page="../left.jsp" flush="false" />
	<div id="right">
		<section class="orderview_section">
	<div id="fourth">
	<div>결제정보</div>
	<table width="800">
	<tr>
	<td>최종결제금액</td>
	<td><%=rs.getInt("price")*rs.getInt("pnum")%></td>
	</tr>
	<tr>
	<td>결제수단</td>
	<%
	String pay = "";
	switch(rs.getInt("pay_method")) {
	case 0: pay = "무통장 입금"; break;
	case 1: pay = "카드 결제"; break;
	case 2: pay = "에스크로"; break;
	case 3: pay = "휴대폰 결제"; break;
	default: pay = "문의바람";
	}
	%>
	<td><%=pay%></td>
	</tr>
	</table>
	</div>
	<div id="fifth">
	<div>주문 상품 정보</div>
	<table width="800">
	<tr>
	<td>이미지</td>
	<td>상품정보</td>
	<td>판매가</td>
	<td>수량</td>
	<td>point</td>
	<td>배송구분</td>
	<td>합계</td>
	</tr>
	<tr>
	<td><img src="img/<%=rs.getString("pmain")%>" width="150"></td>
	<td>
	<%=rs.getString("pname")%><p>
	[옵션 : <%=rs.getString("psize")%>]
    </td>
	<td><%=rs.getString("price")%></td>
	<td><%=rs.getString("pnum")%></td>
	<td><%=rs.getString("point")%></td>
	<td>기본배송</td>
	<td><%=rs.getInt("price")*rs.getInt("pnum")%></td>
	</tr>
	<tr>
	<td colspan="2">[기본배송]</td>
	<td colspan="5">
	상품구매금액<%=rs.getInt("price")*rs.getInt("pnum")%>+
	배송비 0 + 지역배송비 0 = 합계 : <%=rs.getInt("price")*rs.getInt("pnum")%> 
	</td>
	</tr>
	</table>
	</div>
	</section>
		<jsp:include page="../footer.jsp" flush="false" />
		</div>
</body>
</html>