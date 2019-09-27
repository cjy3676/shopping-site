<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function chg_middle(pp) {
	switch(pp) {
	case "01":
	// suits
    document.cjy.middle.options.length = 7;
	document.cjy.middle.options[0].value = 01;
	document.cjy.middle.options[1].value = 02;
	document.cjy.middle.options[2].value = 03;
	document.cjy.middle.options[3].value = 04;
	document.cjy.middle.options[4].value = 05;
	document.cjy.middle.options[5].value = 06;
	document.cjy.middle.options[6].value = 07;
	document.cjy.middle.options[0].text = "싱글 수트";
	document.cjy.middle.options[1].text = "스트라이프 수트";
	document.cjy.middle.options[2].text = "비즈니스 수트";
	document.cjy.middle.options[3].text = "더블 수트";
	document.cjy.middle.options[4].text = "체크 수트";
	document.cjy.middle.options[5].text = "드레스 수트";
	document.cjy.middle.options[6].text = "수트 악세사리";
    break;
	
	case "02":
	// top
	document.cjy.middle.options.length = 4;
	document.cjy.middle.options[0].value = 01;
	document.cjy.middle.options[1].value = 02;
	document.cjy.middle.options[2].value = 03;
	document.cjy.middle.options[3].value = 04;
	document.cjy.middle.options[0].text = "긴팔 티셔츠";
	document.cjy.middle.options[1].text = "반팔 티셔츠";
	document.cjy.middle.options[2].text = "헨리넥";
	document.cjy.middle.options[3].text = "니트";
	break;
	
	case "03":
	// shirts
	document.cjy.middle.options.length = 5;
	document.cjy.middle.options[0].value = 01;
	document.cjy.middle.options[1].value = 02;
	document.cjy.middle.options[2].value = 03;
	document.cjy.middle.options[3].value = 04;
	document.cjy.middle.options[4].value = 05;
	document.cjy.middle.options[0].text = "스트라이프 셔츠";
	document.cjy.middle.options[1].text = "오픈카라 셔츠";
	document.cjy.middle.options[2].text = "솔리드 셔츠";
	document.cjy.middle.options[3].text = "체크 셔츠";
	document.cjy.middle.options[4].text = "Etc.";
    break;
    
	case "04":
	// pants
	document.cjy.middle.options.length = 6;
	document.cjy.middle.options[0].value = 01;
	document.cjy.middle.options[1].value = 02;
	document.cjy.middle.options[2].value = 03;
	document.cjy.middle.options[3].value = 04;
	document.cjy.middle.options[4].value = 05;
	document.cjy.middle.options[5].value = 06;
	document.cjy.middle.options[0].text = "슬랙스";
	document.cjy.middle.options[1].text = "면바지";
	document.cjy.middle.options[2].text = "청바지";
	document.cjy.middle.options[3].text = "반바지";
	document.cjy.middle.options[4].text = "조거팬츠";	
	document.cjy.middle.options[5].text = "Etc.";
	break;
	
	case "05":
	// outer
    document.cjy.middle.options.length = 6;
	document.cjy.middle.options[0].value = 01;
	document.cjy.middle.options[1].value = 02;
	document.cjy.middle.options[2].value = 03;
	document.cjy.middle.options[3].value = 04;
	document.cjy.middle.options[4].value = 05;
	document.cjy.middle.options[5].value = 06;
	document.cjy.middle.options[0].text = "코트";
	document.cjy.middle.options[1].text = "재켓/블레이저";
	document.cjy.middle.options[2].text = "가디건";
	document.cjy.middle.options[3].text = "반바지";
	document.cjy.middle.options[4].text = "베스트";	
	document.cjy.middle.options[5].text = "점퍼";
	break;
	
	case "06":
	// shoes
	document.cjy.middle.options.length = 5;
	document.cjy.middle.options[0].value = 01;
	document.cjy.middle.options[1].value = 02;
	document.cjy.middle.options[2].value = 03;
	document.cjy.middle.options[3].value = 04;
	document.cjy.middle.options[4].value = 05;
	document.cjy.middle.options[0].text = "드레스 슈즈";
	document.cjy.middle.options[1].text = "스니커즈";
	document.cjy.middle.options[2].text = "벨크만 슈즈";
	document.cjy.middle.options[3].text = "부츠/워커";
	document.cjy.middle.options[4].text = "Etc.";
	break;
	
	case "07":
	// accessory
	document.cjy.middle.options.length = 13;
	document.cjy.middle.options[0].value = 01;
	document.cjy.middle.options[1].value = 02;
	document.cjy.middle.options[2].value = 03;
	document.cjy.middle.options[3].value = 04;
	document.cjy.middle.options[4].value = 05;
	document.cjy.middle.options[5].value = 06;
	document.cjy.middle.options[6].value = 07;
	document.cjy.middle.options[7].value = 08;
	document.cjy.middle.options[8].value = 09;
	document.cjy.middle.options[9].value = 10;
	document.cjy.middle.options[10].value = 11;
	document.cjy.middle.options[11].value = 12;
	document.cjy.middle.options[12].value = 13;
	document.cjy.middle.options[0].text = "타이/행커치프";
	document.cjy.middle.options[1].text = "머플러/스카프";
	document.cjy.middle.options[2].text = "목걸이/팔찌";
	document.cjy.middle.options[3].text = "벨트/서스펜더";
	document.cjy.middle.options[4].text = "아이웨어";
	document.cjy.middle.options[5].text = "모자";
	document.cjy.middle.options[6].text = "가방";
	document.cjy.middle.options[7].text = "타이핀/부토니에";
	document.cjy.middle.options[8].text = "양말";
	document.cjy.middle.options[9].text = "시계";
	document.cjy.middle.options[10].text = "벨크만 악세사리";
	document.cjy.middle.options[11].text = "방향제";
	document.cjy.middle.options[12].text = "Etc.";
	break;
	}
}

function code_gen() {
	var l = document.cjy.large.value;
	var m = document.cjy.middle.value;
	var cu = document.cjy.made_cou.value;
	var cm = document.cjy.made_com.value;
	
	document.getElementById("code").innerText = "p"+l+m+cu+cm;
}
</script>
</head>
<body>
<!-- 대분류: suits(01), top(02), shirts(03), pants(04), outer(05), shoes(06), accessory(07)
            중분류(suits): 싱글수트(01), 스트라이프수트(02), 비즈니스수트(03), 더블수트(04), 체크수트(05), 드레스수트(06), 수트악세사리(07)
            소분류: 001, 002
            제조국: 01, 02
            제조사: 01, 02    -->
<form name="cjy">
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
상품코드: <span id="code"></span>	
</form>		
</body>
</html>