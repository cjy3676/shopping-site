<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<%@ page import="shopping_site.jdbc.Connect"%>
<%@ page import="shopping_site.Util.Util"%>
<%@ page import="java.time.LocalDate"%>
<%
    String day = request.getParameter("day");
    String extra = "";
    
    // Util.datefx() 메소드에 전달할 3개의 값을 여기서 생성
    int param1 = 0; // 년,월,일
    int param2 = 0; // 이전, 이후
    int param3 = 0; // 기간
    String s = "";
    String e = "";
    if(day == null) { // 기본(3개월)
    	day = "";
        param1 = 2;
        param2 = 1;
        param3 = 3;
    	extra = "and order_deli.writeday > date_sub(curdate(),interval 3 month)";
    }	
    else if(day.equals("0")) { // 오늘
  	    param1 = 3;
  	    param2 = 1;
  	    param3 = 0;
    	extra = "and order_deli.writeday > curdate()";
    }	
    else if(day.equals("1")) { // 일주일
  	    param1 = 3;
  	    param2 = 1;
  	    param3 = 7;
    	extra = "and order_deli.writeday > date_sub(curdate(),interval 7 day)";
    }	
    else if(day.equals("2")) { // 1개월
  	    param1 = 2;
  	    param2 = 1;
  	    param3 = 1;
    	extra = "and order_deli.writeday > date_sub(curdate(),interval 1 month)";
    }	
    else if(day.equals("3")) { // 3개월
  	    param1 = 2;
  	    param2 = 1;
  	    param3 = 3;
    	extra = "and order_deli.writeday > date_sub(curdate(),interval 3 month)";
    }	
    else if(day.equals("4")) { // 6개월
  	    param1 = 2;
  	    param2 = 1;
  	    param3 = 6;
    	extra = "and order_deli.writeday > date_sub(curdate(),interval 6 month)";
    }	
    else if(day.equals("5")) { // 기간
    	s = request.getParameter("s");
    	e = request.getParameter("e");
    	extra = "and order_deli.writeday >= '"+s+"' and order_deli.writeday <= date_add('"+e+"',interval 1 day)";
    }	
    
    // 처음에 mydelivery.jsp를 읽을때는 deli_step값이 존재하지 않는다 => select에서 선택시에만 deli_step이 존재
    String deli;		
    if(request.getParameter("deli_step") == null)
    	deli = "-1";
    else
    	deli = request.getParameter("deli_step");
    
    String extra2 = "";
    switch(deli) {
    case "-1": extra2 = ""; break;
    case "0": extra2 = " and deli_step=0"; break;
    case "1": extra2 = " and deli_step=1"; break;
    case "2": extra2 = " and deli_step=2"; break;
    case "3": extra2 = " and deli_step=3"; break;
    case "4": extra2 = " and deli_step=4"; break;
    case "5": extra2 = " and deli_step=5"; break;
    case "6": extra2 = " and deli_step=6"; break;
    case "7": extra2 = " and deli_step=7"; break;
    }
    
    // 주문내역조회와 취소/반품/교환내역 클릭여부
    String extra3 = "";
    int deliv_ck; // 취소/반품/교환 체크
    if(request.getParameter("deliv") == null) {
    	extra3 = "";
    	deliv_ck = 0;
    }
    else {
    	extra3 = " and deli_step between 5 and 7";
    	deliv_ck = 1;
    }
    
    Connection conn = Connect.connection2();
    String sql = "select order_deli.id, substring(order_deli.writeday,1,10) as writeday, product.plist, product.pname, psize";
    sql = sql + ", pnum, product.price, deli_step from order_deli, product where ";
    sql = sql + "order_deli.userid='"+session.getAttribute("userid")+"'";
    sql = sql + " and product.pcode=order_deli.pcode"+extra+extra2+extra3;
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

function step_check(deli_step) {
	location = "mydelivery.jsp?deli_step="+deli_step;
}

function bgcolor() {
	<%
	  if(day != "") {
	%>
	  document.getElementByClassName("ddd")[<%=day%>].style.background = "#cccccc";
	<%
	  }
	%>
	
	// 배송단계에 따른 검색
	<%
	  if(request.getParameter("deli_step") != null) {
	%>
	  document.getElementById("sel").value=<%=request.getParameter("deli_step")%>
	<%
	  }
	%>
	
	// 현재 주문내역조회인지, 취소/반품/교환내역인지 알수있게 반전
	document.getElementsByClassName("sec")[0].style.background = "pink";
	document.getElementsByClassName("sec")[0].style.color = "white";
}
</script>
</head>
<body onload="bgcolor()">
	<!-- 메인페이지 -->
	<jsp:include page="../left.jsp" flush="false"/>

	<div id="right">
		<section class="mydelivery_section">
		<div id="first">주문조회</div>
		<div id="second">
		<ul>
		<li class="sec" onclick="location='mydelivery.jsp'">주문내역조회</li>
		<li class="sec" onclick="location='mydelivery.jsp?deliv=1'">취소/반품/교환 내역</li>
		<li></li>
		</ul>
		</div>
		
		<div id="third">
		<select onchange="step_check(this.value)" id="sel">
		<option value="-1">전체주문처리상태</option>
		<option value="0">입금전</option>
		<option value="1">결제완료</option>
		<option value="2">배송준비</option>
		<option value="3">배송중</option>
		<option value="4">배송완료</option>
		<option value="5">취소</option>
		<option value="6">교환</option>
		<option value="7">반품</option>
		</select>
		<ul>
		<li onclick="mydelivery(0)" class="ddd">오늘</li>
		<li onclick="mydelivery(1)" class="ddd">1주일</li>
		<li onclick="mydelivery(2)" class="ddd">1개월</li>
		<li onclick="mydelivery(3)" class="ddd">3개월</li>
		<li onclick="mydelivery(4)" class="ddd">6개월</li>
		</ul>
		<%
		  LocalDate today = LocalDate.now();
		  String now_date = today.toString();
		  
		  if(day.equals("5")) { // 검색을 기간으로 할 경우
		%>
		<input type="text" name="start" id="start" value="<%=s%>"> ~
		<input type="text" name="end" id="end" value="<%=e%>">
		<input type="button" onclick="mydelivery(5)" value="조회">
		<%
		  }
		  else {
		%>
		<input type="text" name="start" id="start" value="<%=Util.datefx(now_date, param1, param2, param3)%>"> ~
		<input type="text" name="end" id="end" value="<%=today%>">
		<input type="button" onclick="mydelivery(5)" value="조회">
		<%
		  }
		%>
		   <script>
     function myjumun(n) // myjumun.jsp에 검색할 날짜를 가지고 간다..
     {   // ul태그내의 날짜 혹은 start,end값이 있는지 여부
 
    	switch(n)
    	{
    	  case 0: location="myjumun.jsp?nal=0"; break;
    	  case 1: location="myjumun.jsp?nal=1"; break;
    	  case 2: location="myjumun.jsp?nal=2"; break;
    	  case 3: location="myjumun.jsp?nal=3"; break;
    	  case 4: location="myjumun.jsp?nal=4"; break;
    	  case 5: 
    		  s=document.getElementById("start").value;
    		  e=document.getElementById("end").value;
    		  location="myjumun.jsp?nal=5&s="+s+"&e="+e;
    		                       // nal=5&s=2019-10-16&e=2019-10-17
    	}
     }
     
     $(function()
     {
    	$("#start").datepicker(
        {
           dateFormat:"yy-mm-dd" 	
        });
    	$("#end").datepicker(
 	    {
    	   dateFormat:"yy-mm-dd" 	
    	});
     });
   </script>
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
<%
  conn.close();
%>  