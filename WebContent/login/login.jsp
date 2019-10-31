<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" type="text/css" href="../etc/main.css?after">
<script src="../etc/main.js"></script>
</head>
<body>
	<!-- login 페이지 -->
	<jsp:include page="../left.jsp" flush="false"/>

	<div id="right">
		<section class="login_section">
		<div id="login_main">
		
		<div id="first">
		LOGIN
		</div>
		
		<div id="second"><!-- 아이디, 비밀번호 부분 -->
		<div id="outer">
		<form method="post" action="login_ok.jsp">
		<input type="hidden" name="pcode" value="<%=request.getParameter("pcode")%>">
		<input type="hidden" name="psize" value="<%=request.getParameter("psize")%>">
		<input type="hidden" name="pnum" value="<%=request.getParameter("pnum")%>">

		<div id="outer_left">
		<div id="userid">
		<label for="uid">아이디</label>
		<input type="text" name="userid" id="uid">
		</div>
		<div id="pwd">
		<label for="pw">비밀번호</label>
		<input type="password" name="pwd" id="pw">
		</div>
		</div>
		<div id="outer_right">
		<input id="login" type="submit" value="Login">
		</div>
		</form>
		</div>
		</div>
		
		<div id="third"><!-- 아이디 저장, 보완접속 -->
		<input type="checkbox" name="id_save" id="id_save"><label for="id_save">아이디 저장</label>
		<img src="img/aa.png" width="10">보안접속
		</div>
		
		<div id="fourth">
		<a href="id_search.jsp">ⓧ 아이디 찾기</a> 
		<a href="pwd_search.jsp">ⓧ 비밀번호 찾기</a>
		</div>
		
		<div id="fifth">
		<span>네이버 로그인</span>
		<span>페이스북 로그인</span>
		<span style="color:block">카카오 로그인</span>
		</div>
		
		<div id="sixth">
		<div id="sixth_left">
		▶ 회원가입을 하시면 다양하고 특별한<br>
		&nbsp;&nbsp;&nbsp;혜택이 준비되어 있습니다.
		</div>
		<div id="sixth_right">
		<button onclick="location='member.jsp'"><xmp>회원가입  》</xmp></button>
		</div>
		</div>
		<%
		  if(request.getParameter("chk") != null) {
		%>
		<div id="seventh">
		<div id=seventh_left> 
                         》비회원님도 상품구매가 가능하나 다양한 <br>
                    회원혜택에서 제외됩니다.
        </div>
		<div id="seventh_right">
		<form method="post" action="../product/pro_order.jsp">
		<input type="hidden" name="pcode" value="<%=request.getParameter("pcode")%>">
		<input type="hidden" name="psize" value="<%=request.getParameter("psize")%>">
		<input type="hidden" name="pnum" value="<%=request.getParameter("pnum")%>">
		<input type="hidden" name="log" value="a">
		<button><xmp> 비회원구매  》</xmp></button>
		</form>
		</div>
		</div>
		<%
		  }
		  else {
		%>
		<div id="seventh"><!-- 비회원 주문조회 : buynow를 통하지 않은것 -->
		<div>비회원 주문조회</div>
		<div>비회원의 경우, 주문시의 주문번호로 주문조회가 가능합니다.</div>

		<div>》 주문자명<input type="text" name="name" class="un_mem1" id="un_mem1"></div>
		<div>》 주문번호<input type="text" name="order_num1" class="un_mem2" id="un_mem2">-
		<input type="text" name="order_num2" class="un_mem2"> 
		</div>
		
		<div>》비회원주문  비밀번호<input type="password" name="pwd" class="un_mem1" id="un_mem3"></div>
		<div><button class="un_mem3">조회 》</button></div>
		</div>
		<%
		  }
		%>
		</div>
		</section>
		<jsp:include page="../footer.jsp" flush="false"/>
	</div>
</body>
</html>