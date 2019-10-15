<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>
<%@ page import="java.text.DecimalFormat"%>
<%  
    Connection conn = Connect.connection2();
    Statement stmt = conn.createStatement();
    ResultSet rs;
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
<body>
	<!-- 메인페이지 -->
	<jsp:include page="../left.jsp" flush="false"/>

	<div id="right">
		<section class="myinfo_section">
		<div id="first">MY ACCOUNT</div>
		
		<div id="second"><!-- 포인트 내역, 주문내역 -->
		<%
		String userid = session.getAttribute("userid").toString();
		String sql = "select price,pnum,member.point, mem_point, cou_point, order_deli.point";
		sql = sql + " as opoint from order_deli, member, product where member.userid='"+userid+"'";
		sql = sql + " and member.userid=order_deli.userid and order_deli.pcode=product.pcode";
		rs = stmt.executeQuery(sql);
		// mem_point, cou_point, opoint의 값을 모두 누적한다
		int mem_point = 0;
		int cou_point = 0;
		int opoint = 0;
		int tot_price = 0;
		int order_num = 0;
		while(rs.next()) {
			mem_point = mem_point + rs.getInt("mem_point");
			cou_point = cou_point + rs.getInt("cou_point");
			opoint = opoint + rs.getInt("opoint");
			tot_price = tot_price + (rs.getInt("price")*rs.getInt("pnum"));
			order_num++;
		}
		
		int point;
		if(order_num != 0) { // 레코드가 있을때
		    rs.first();
		    point = rs.getInt("point");	
		}
		else { // 레코드가 없을때
			sql = "select point from member where userid='"+userid+"'";
			rs = stmt.executeQuery(sql);
			rs.next();
			point = rs.getInt("point");
		}
		DecimalFormat df = new DecimalFormat("#,###");
		String tot = df.format(tot_price);
		%>
		<ul>
		<li>가용포인트<%=rs.getString("point")%>P</li>
		<li>총포인트<%=opoint%>P</li>
		<li>사용포인트<%=(cou_point+mem_point)%>P</li>
		<li>총주문<%=tot%>(<%=order_num%>회)</li>
		</ul>
		</div>
		
		<div id="third"><!-- 주문처리현황 -->
		<div>나의 주문 처리 현황</div>
		<%
          // order_deli테이블에서 나의 주문을 전부 읽어와서 해당되는 현황	
          sql = "select * from order_deli where userid='"+userid+"'";
		  rs = stmt.executeQuery(sql);
		  // 반복문을 통해 각 현황의 변수에 값을 1씩 더한다
		  int[] arr = new int[8]; 
		  while(rs.next()) {
			  arr[rs.getInt("deli_step")]++;
		  }
		%>
		<ul>
		<li>입금전<p><%=arr[0]%></li>
		<li>결제완료<p><%=arr[1]%></li>
		<li>배송준비중<p><%=arr[2]%></li>
		<li>배송중<p><%=arr[3]%></li>
		<li>배송완료<p><%=arr[4]%></li>
		<li>취소<p><%=arr[5]%></li>
		<li>교환<p><%=arr[6]%></li>
		<li>반품<p><%=arr[7]%></li>
		</ul>
		</div>
		
		<div id="fourth"><!-- 조회, 정보변경, 게시판등등 -->
		<table width="800">
		<tr>
		<td>ORDER 주문내역조회</td>
		<td onclick="location='../login/member_update.jsp'">PROFILE 회원정보</td>
		</tr>
		<tr>
		<td>POINT 포인트</td>
		<td>BOARD 게시물관리</td>
		</tr>
		<tr>
		<td>WISHLIST 관심상품</td>
		<td>ADDRESS 배송주소록관리</td>
		</tr>
		</table>
		</div>
		</section>
		<jsp:include page="../footer.jsp" flush="false"/>
	</div>
</body>
</html>