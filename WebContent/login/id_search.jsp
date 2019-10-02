<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" type="text/css" href="../etc/main.css?abc">
<script src="../etc/main.js?abc"></script>
</head>
<body>
	<!-- 아이디 찾기 페이지 -->
	<jsp:include page="../left.jsp" flush="false"/>

	<div id="right">
		<section class="id_search_section">		
     <form name="cjy" method="post" action="id_search_ok.jsp">
      <div id="idsearch"> 아이디 찾기 </div>
      <div id="idsearch_sub">가입하신 방법에 따라 아이디 찾기가 가능합니다.</div><p>
	  <div id="idsearch_sub">법인사업자 회원 또는 외국인 회원의 경우 법인명과 법인번호 또는 이름과 등록번호를 입력해 주세요.</div>
      <div id="search_main" align="center">
        <div id="sub"> 아이디 찾기 </div>
        <div id="sub">
            <div id="aa"> 》회원유형 </div>
            <div id="bb"> 
               <select name="mem_type" class="mem_type">
                 <option value="1"> 개인회원 </option>
                 <option value="2"> 개인사업자 회원 </option>
                 <option value="3"> 법인사업자 회원 </option>
                 <option value="4"> 외국인회원 </option>
               </select>
            </div>
            </div>
		<div id="sub">
            <div id="aa"> </div>
            <div id="bb">
		<input type="radio" name="ch_method" value="0" onclick="check_method(0)" checked>이메일 
		<input type="radio" name="ch_method" value="1" onclick="check_method(1)">휴대폰번호
		</div>
		</div>
		<div id="sub">
		<div id="aa"> 》이름 </div>
		<div id="bb"><input type="text" name="name"></div>
		</div>
		
		<div id="sub">
		<span id="chk_method">》 이메일로 찾기</span>
		<div id="bb">
		<input type="text" name="email" id="email">
		<div  id="hphone_text" style="display:none;">
		<input type="text" name="hphone" id="hphone">-
		<input type="text" name="hphone" id="hphone">-
		<input type="text" name="hphone" id="hphone">
		</div>
		</div>
		<input id="idsearch_submit" type="submit" value="확인">
		</div>
		</div>
		</form>
		</section>
		<jsp:include page="../footer.jsp" flush="false"/>
	</div> 
</body>
</html>