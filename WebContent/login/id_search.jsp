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
	<!-- 메인페이지 -->
	<jsp:include page="../left.jsp" flush="false"/>

	<div id="right">
		<section class="member_section">
		<div id="in_div" align="center">아이디 찾기</div>
		<div>가입하신 방법에 따라 아이디 찾기가 가능합니다.</div><p>
		<div>법인사업자 회원 또는 외국인 회원의 경우 법인명과 법인번호 또는 이름과 등록번호를 입력해 주세요.</div>
		
		<div align="center"><input id="mem_submit" type="submit" value="확인"></div>
		</form>
		</section>
		<jsp:include page="../footer.jsp" flush="false"/>
	</div>
</body>
</html>