<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shopping_site.jdbc.Connect"%>  
<%@ page import="java.sql.*"%>  
<%@ page import="shopping_site.Util.Util"%>
<%
    Connection conn = Connect.connection2();
    Statement stmt = conn.createStatement();
    
    String sql = "select userid, pmain, pname, pnum, price, deli_step from";
    sql = sql + " porder, product where porder.pcode = product.pcode ";
    
    ResultSet rs = stmt.executeQuery(sql);
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="800">
		<tr>
			<td>구입자</td>
			<td>상품</td>
			<td>상품명</td>
			<td>구입수량</td>
			<td>합계금액</td>
			<td>배송현황</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("userid")%></td>
			<td><img src="../product/img/<%=rs.getString("pmain")%>"
				width="50"></td>
			<td><%=rs.getString("pname")%></td>
			<td><%=rs.getString("pnum")%></td>
			<td><%=Util.comma(rs.getInt("price") * rs.getInt("pnum"))%></td>
			<td><select onchange="">
					<option value="0">입금전</option>
					<option value="1">결제완료</option>
					<option value="2">배송준비</option>
					<option value="3">배송중</option>
					<option value="4">배송완료</option>
					<option value="5">취소</option>
					<option value="6">교환</option>
					<option value="7">반품</option>
			</select></td>
		</tr>
		<%
            }
        %>
	</table>
</body>
</html>