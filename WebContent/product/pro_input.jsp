<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../etc/main.js?abc"></script>
</head>
<body>
<!-- 대분류: suits(01), top(02), shirts(03), pants(04), outer(05), shoes(06), accessory(07)
            중분류(suits): 싱글수트(01), 스트라이프수트(02), 비즈니스수트(03), 더블수트(04), 체크수트(05), 드레스수트(06), 수트악세사리(07)
            소분류: 001, 002
            제조국: 01, 02
            제조사: 01, 02    -->
<form name="cjy" method="post" action="pro_input_ok.jsp" enctype="multipart/form-data">
<input type="hidden" name="pcode">
대분류<select name="large" onchange="chg_middle(this.value)">
		<option value="01">suits</option>
		<option value="02">top</option>
		<option value="03">shirts</option>
		<option value="04">pants</option>
		<option value="05">outer</option>
		<option value="06">shoes</option>
		<option value="07">accessory</option>
	</select>

중분류<select name="middle">
		<option value="01">싱글 수트</option>
		<option value="02">스트라이프 수트</option>
		<option value="03">비즈니스 수트</option>
		<option value="04">더블 수트</option>
		<option value="05">체크 수트</option>
		<option value="06">드레스 수트</option>
		<option value="07">수트 악세사리</option>
	</select>
	
제조국<select name="made_cou">
       <option value="01">없음</option>
       <option value="02">대한민국</option>
       <option value="03">미국</option>
       <option value="04">일본</option>
       <option value="05">중국</option>
	</select>
	
제조사<select name="made_com" onchange="code_gen()">
       <option value="01">없음</option>
       <option value="02">엘지 패션</option>
       <option value="03">코오롱</option>
       <option value="04">제일모직</option>
       <option value="05">두타</option>
	</select><p>
	상품이름 <input type="text" name="pname"><p>
	상품가격 <input type="text" name="price"><p>
	세탁정보 <select name="pwash">
			<option value="0">물세탁</option>
			<option value="1">손세탁</option>
			<option value="2">드라이크리닝</option>
			<option value="3">울세탁</option>
		  </select> 
	생산일자 <select name="yy">
			<option value="2019">2019</option>
			<option value="2018">2018</option>
			<option value="2017">2017</option>
		  </select> 
		  
		  <select name="mm">
			<%
				for (int i = 1; i <= 12; i++) {
			%>
				<option value=<%=i%>><%=i%>월
			<%
				}
			%>
				
		  </select> 
			
		  <select name="dd">
			<%
				for (int i = 1; i <= 31; i++) {
			%>
				<option value=<%=i%>><%=i%>일
			<%
				}
			%>
		  </select><p>
	상뭄입고수량 <input type="text" name="pinput"><p>
	상품그림(list)<input type="file" name="plist"><p>
	상품그림(메인)<input type="file" name="pmain"><p>
	상품상세정보<input type="file" name="pdt_img"><p>
	<input type="submit" value="상품저장">
	</form>		
</body>
</html>