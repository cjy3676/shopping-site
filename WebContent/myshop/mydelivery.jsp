<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<%@ page import="shopping_site.jdbc.Connect"%>
<%@ page import="shopping_site.Util.Util"%>
<%
    String day = request.getParameter("day");
    String extra = "";
    if(day == null) // 기본(3개월)
    	extra = "and order_deli.writeday > date_sub(curdate(),interval 3 month)";
    else if(day.equals("0")) // 오늘
    	extra = "and order_deli.writeday > curdate()";
    else if(day.equals("1")) // 일주일
    	extra = "and order_deli.writeday > date_sub(curdate(),interval 7 day)";
    else if(day.equals("2")) // 1개월
    	extra = "and order_deli.writeday > date_sub(curdate(),interval 1 month)";
    else if(day.equals("3")) // 3개월
    	extra = "and order_deli.writeday > date_sub(curdate(),interval 3 month)";
    else if(day.equals("4")) // 6개월
    	extra = "and order_deli.writeday > date_sub(curdate(),interval 6 month)";
    else if(day.equals("5")) { // 기간
    	String s = request.getParameter("s");
    	String e = request.getParameter("e");
    	extra = "and order_deli.writeday >= '"+s+"' and order_deli.writeday <= date_add('"+e+"',interval 1 day)";
    }	
    Connection conn = Connect.connection2();
    String sql = "select order_deli.id, substring(order_deli.writeday,1,10) as writeday, product.plist, product.pname, psize";
    sql = sql + ", pnum, product.price, deli_step from order_deli, product where ";
    sql = sql + "order_deli.userid='"+session.getAttribute("userid")+"'";
    sql = sql + " and product.pcode=order_deli.pcode"+extra;
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
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
<script>
function mydelivery(n) {
	switch(n) {
	case 0: location = "mydelivery.jsp?day=0"; break;
	case 1: location = "mydelivery.jsp?day=1"; break;
	case 2: location = "mydelivery.jsp?day=2"; break;
	case 3: location = "mydelivery.jsp?day=3"; break;
	case 4: location = "mydelivery.jsp?day=4"; break;
	case 5: 
		s = document.getElementById("start").value;
		e = document.getElementById("end").value;
		location = "mydelivery.jsp?day=5&s="+s+"&e="+e;
	}
	location = "mydelivery.jsp";
}
$(function() {
	$("#start").datepicker({
		dateFormat:"yy-mm-dd"
	});
	$("#end").datepicker({
		dateFormat:"yy-mm-dd"
	});
});
</script>
</head>
<body>
	<!-- 메인페이지 -->
	<jsp:include page="../left.jsp" flush="false"/>

	<div id="right">
		<section class="mydelivery_section">
		<div id="first">주문조회</div>
		<div id="second">
		<ul>
		<li>주문내역조회</li>
		<li>취소/반품/교환 내역</li>
		<li></li>
		</ul>
		</div>
		
		<div id="third">
		<select>
		<option>전체주문처리상태</option>
		</select>
		<ul>
		<li onclick="mydelivery(0)">오늘</li>
		<li onclick="mydelivery(1)">1주일</li>
		<li onclick="mydelivery(2)">1개월</li>
		<li onclick="mydelivery(3)">3개월</li>
		<li onclick="mydelivery(4)">6개월</li>
		</ul>
		<input type="text" name="start"> ~
		<input type="text" name="end">
		<input type="button" onclick="mydelivery()" value="조회">
		</div>
		
		<div id="fourth">
		<div>주문 상품 정보</div>
		<table width="800">
		<tr>
		<td>주문일자<br>[주문번호]</td>
		<td>이미지</td>
		<td>상품정보</td>
		<td>수량</td>
		<td>상품구매금액</td>
		<td>주문처리상태</td>
		<td>취소/교환/반품</td>
		</tr>
		<%
		while(rs.next()) {
		%>
		<tr>
		<%
		String wday = rs.getString("writeday").replace("-","");
		String num = rs.getString("id");
		for(int i=0; i<5-num.length(); i++)
			num = "0" + num;
		num = wday+"-"+num;
		String psize;
		switch(rs.getInt("psize")) {
		case 0: psize="95"; break;
		case 1: psize="100"; break;
		case 2: psize="105"; break;
		default: psize="Free Size";
		}
		
		String deli_step = "";
		switch(rs.getInt("deli_step")) {
		case 0: deli_step="입금전"; break;
		case 1: deli_step="결제완료"; break;
		case 2: deli_step="배송준비중"; break;
		case 3: deli_step="배송중"; break;
		case 4: deli_step="배송완료"; break;
		case 5: deli_step="취소"; break;
		case 6: deli_step="교환"; break;
		case 7: deli_step="반품"; break;
		}
		%>
		<td><%=rs.getString("writeday")%><br>[<%=num%>]</td>
		<td><img src="../product/img/<%=rs.getString("plist")%>" width="50"></td>
		<td><%=rs.getString("pname")%><p>[옵션:사이즈<%=psize%>]</td>
		<td><%=rs.getString("pnum")%></td>
		<td><%=Util.comma(rs.getInt("price")*rs.getInt("pnum"))%></td>
		<td><%=deli_step%></td>
		<td>-</td>
		</tr>
		<%
		}
		%>
		</table>
		</div>
		</section>	
		<jsp:include page="../footer.jsp" flush="false"/>
	</div>
</body>
</html>