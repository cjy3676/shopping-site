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
		<input type="checkbox" name="id_save" id="id_save"><label for="id_save"></label>
		<img src="img/aa.png" width="10">보안접속
		</div>
		
		<div id="fourth">
		ⓧ 아이디 찾기 ⓧ 비밀번호 찾기
		</div>
		
		<div id="fifth">
		<span>네이버 로그인</span>
		<span>페이스북 로그인</span>
		<span>카카오 로그인</span>
		</div>
		
		<div id="sixth">
		<div id="sixth_left">
		▶ 회원가입을 하시면 다양하고 특별한<br>
		&nbsp;&nbsp;&nbsp;혜택이 준비되어 있습니다.
		</div>
		<div id="sixth_right">
		<button id="mem_join"><a href="member.jsp">회원가입  &nbsp 》</a></button>
		</div>
		</div>
		
		<div id="seventh">
		<div>비회원 주문조회</div>
		<div>비회원의 경우, 주문시의 주문번호로 주문조회가 가능합니다.</div>
		<div>》 주문자명<input type="text" name="name" class="un_mem1" id="un_mem1"></div>
		<div>》 주문번호<input type="text" name="num1" class="un_mem2" id="un_mem2">-
		<input type="text" name="num2" class="un_mem2"> 
		</div>
		
		<div>》비회원주문  비밀번호<input type="password" name="pwd" class="un_mem1" id="un_mem3"></div>
		<div><button class="un_mem3">조회 》</button></div>
		</div>
		</div>
		</section>
		<jsp:include page="../footer.jsp" flush="false"/>
	</div>
</body>
</html>