<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>     
<%
	Connection conn = Connect.connection2();
	// order_deli 테이블의 id
	String num = request.getParameter("num");
	String sql = "";
	if(request.getParameter("cc") == null)
		sql = "select * from order_deli,product where userid='"+session.getAttribute("userid")+"' and order_deli.pcode=product.pcode and order_deli.id > "+num;
	else if(request.getParameter("cc").equals("1"))		
		sql = "select * from order_deli,product where order_deli.pcode = product.pcode and order_deli.id="+request.getParameter("id");
	else
		sql = "select * from order_deli as od, product as p where od.pcode and p.userid='"+request.getParameter("userid")+"'";
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
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
<body onload="view_price()">
<jsp:include page="../left.jsp" flush="false" />
	<div id="right">
		<section class="orderview_section">
	
	<div id="fourth">
	<div>결제정보</div>
	<table width="800">
	<tr>
	<td width="150">최종결제금액</td>
	<!-- 상품개당가격 * 구입수량 -->
	<td><span id="tot_dis"></span></td>
	</tr>
	<tr>
	<td>결제수단</td>
	<!-- order_deli의 pay_method -->
	<td><span id="pay_method"></span></td>
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
	<%
	String imsi = "";
	int tot_dis = 0;
	int pay_method = 0;
	while(rs.next()) {
		pay_method = rs.getInt("pay_method");
		imsi = rs.getString("id");
		tot_dis = tot_dis + (rs.getInt("price")*rs.getInt("pnum"));
	%>
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
	<%
	}
	%>
	<tr>
	<td colspan="2">[기본배송]</td>
	<td colspan="5">
	상품구매금액<%=tot_dis%>+
	배송비 0 + 지역배송비 0 = 합계 : <%=tot_dis%> 
	</td>
	</tr>
	</table>
    <script>
    function view_price() {
    	var tot_dis = <%=tot_dis%>; // 총결제금액(hap)
	    document.getElementById("tot_dis").innerText = comma(tot_dis);
	    var pay_method = <%=pay_method%>;
	    var cjy = document.getElementById("pay_method");
	    switch(pay_method) {
	    case 0: cjy.innerText="무통장입금"; break;
	    case 1: cjy.innerText="카드 결제"; break;
	    case 2: cjy.innerText="에스크로(실시간 계좌이체)"; break;
	    case 3: cjy.innerText="휴대폰결제"; break;
	    default: cjy.innerText="결제수단을 선택해주세요";
	    }
    }
    </script>
	</div>
	<%
	  // 배송정보가 비회원은 unmember에 있고, 회원은 order_addr테이블에 있으므로
	  if(request.getParameter("cc").equals("2")) 
		  sql = "select * from unmember where order_num='"+request.getParameter("userid")+"'";
	  else 
		  sql = "select * from order_deli as od , order_addr as oa where od.id="+imsi+" and od.id=oa.oid";
	rs = stmt.executeQuery(sql);
	rs.next();
	
	// name필드는 필드명이 틀리므로, deli_msg는 unmember에는 없는 필드
	String name = "";
	String deli_msg = "";
	if(request.getParameter("cc").equals("2")) {
		name = rs.getString("name");
	}
	else {
		name = rs.getString("oname");
		deli_msg = rs.getString("deli_msg");
	}
	%>
	<div id="sixth">
	<div>배송지 정보</div>
	<table width="800">
	<tr>
	<td>받으시는 분</td>
	<td><%=name%></td>
	</tr>
	<tr>
	<td>우편번호</td>
	<td><%=rs.getString("zip")%></td>
	</tr>
	<tr>
	<td>주소</td>
	<td><%=rs.getString("addr1")%><%=rs.getString("addr2")%></td>
	</tr>
	<tr>
	<td>일반전화</td>
	<td><%=rs.getString("phone")%></td>
	</tr>
	<tr>
	<td>휴대전화</td>
	<td><%=rs.getString("hphone")%></td>
	</tr>
	<tr>
	<td>배송메세지</td>
	<td><%=deli_msg%></td>
	</tr>
	</table>
	<div>
	<input type="button" value="쇼핑계속하기">
	<input type="button" value="주문확인하기">
	</div>
	</div>
	</section>
		<jsp:include page="../footer.jsp" flush="false" />
		</div>
</body>
</html>