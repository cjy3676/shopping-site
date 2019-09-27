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
<script src="../etc/main.js?abc"></script>
</head>
<body>
	<!-- 아이디 찾기 페이지 -->
	<jsp:include page="../left.jsp" flush="false"/>

	<div id="right">
		<section class="idsearch_section">
		<div id="in_div" align="center">아이디 찾기</div>
		<div>가입하신 방법에 따라 아이디 찾기가 가능합니다.</div><p>
		<div>법인사업자 회원 또는 외국인 회원의 경우 법인명과 법인번호 또는 이름과 등록번호를 입력해 주세요.</div>
		<table width="800" border="0">
		<tr>
		<td>》 회원유형</td>
		<td>
		<select>
		<option>개인회원</option>
		<option>개인 사업자회원</option>
		<option>법인 사업자회원</option>
		<option>외국인회원</option>
		</select>
		</td>
		</tr>
		<tr>
		<td></td>
		<td>
		<input type="radio" name="ch_method" value="0" onclick="check_method(0)" checked>이메일 
		<input type="radio" name="ch_method" value="1" onclick="check_method(1)">휴대폰번호
		</td>
		</tr>
		<tr>
		<td>》 이름</td>
		<td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td><span id="chk_method">》 이메일로 찾기</span></td>
		<td> <!-- 정리 미완성 -->
		<input type="text" name="email" id="email">
		<div style="display:none;" id="hphone_text">
		<input type="text" name="hphone" id="hphone">-
		<input type="text" name="hphone" id="hphone">-
		<input type="text" name="hphone" id="hphone">
		</div>
		</td>
		</tr>
		</table>
		<div align="center"><input id="idsearch_submit" type="submit" value="확인"></div>
		</section>
		<jsp:include page="../footer.jsp" flush="false"/>
	</div> 
</body>
</html>