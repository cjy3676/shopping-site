<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
$(function(){
	$("#logo").mouseover(function(){
		$(this).stop().animate({
			color: "#bbbbbb"
		},500);
	});
	$("#logo").mouseout(function(){
		$(this).animate({
			color: "black"
		},500);
	});
});

function view_search() {
	document.getElementById("search_form").style.display = "inline";
}

function search_submit(pp) {
	if(event.keyCode == 13)
		document.search_form.submit();
}
</script> 
</head>
<body>
	<!-- 메인페이지 왼쪽부분 -->
	<nav>
	<div id="logo"><span style="cursor:'pointer' onclick="location='../main/index.jsp'">R u l e r  D r a g o n</span></div>	
		<ul id="start_menu">
			<li class="main" onclick="view(0,this,180)"><a href="../product/pro_list.jsp?pcode=p01">SUITS</a>
			<ul class="menu">
				<li><a href="../product/pro_list.jsp?pcode=p0101" id="p0101">싱글 수트</a></li>
				<li><a href="../product/pro_list.jsp?pcode=p0102" id="p0102">스트라이프 수트</a></li>
				<li><a href="../product/pro_list.jsp?pcode=p0103" id="p0103">비즈니스 수트</a></li>
				<li><a href="../product/pro_list.jsp?pcode=p0104" id="p0104">더블 수트</a></li>
				<li><a href="../product/pro_list.jsp?pcode=p0105" id="p0105">체크 수트</a></li>
				<li><a href="../product/pro_list.jsp?pcode=p0106" id="p0106">드레스 수트</a></li>
				<li><a href="../product/pro_list.jsp?pcode=p0107" id="p0107">수트 악세사리</a></li>
			</ul>
			</li>
			
			<li class="main" onclick="view(1,this,120)"><a href="../product/pro_list.jsp?pcode=p02">TOP</a>
			<ul class="menu">
				<li><a href="../product/pro_list.jsp?pcode=p0201" id="p0201">긴팔 티셔츠</a></li>
				<li><a href="../product/pro_list.jsp?pcode=p0202" id="p0202">반팔 티셔츠</a></li>
				<li><a href="../product/pro_list.jsp?pcode=p0203" id="p0203">헨리넥</a></li>
				<li><a href="../product/pro_list.jsp?pcode=p0204" id="p0204">니트</a></li>
			</ul>
			</li>
			
			<li class="main" onclick="view(2,this,140)"><a href="../product/pro_list.jsp?pcode=p03">SHIRTS</a>
			<ul class="menu">
				<li><a href="../product/pro_list.jsp?pcode=p0301" id="p0301">스트라이프 셔츠</a></li>
				<li><a href="../product/pro_list.jsp?pcode=p0302" id="p0302">오픈카라 셔츠</a></li>
				<li><a href="../product/pro_list.jsp?pcode=p0303" id="p0303">솔리드 셔츠</a></li>
				<li><a href="../product/pro_list.jsp?pcode=p0304" id="p0304">체크 셔츠</a></li>
				<li><a href="../product/pro_list.jsp?pcode=p0305" id="p0305">Etc.</a></li>
			</ul>
			</li>
			
			<li class="main" onclick="view(3,this,165)">PANTS
			<ul class="menu">
				<li>슬랙스</li>
				<li>면바지</li>
				<li>청바지</li>
				<li>반바지</li>
				<li>조거팬츠</li>
				<li>Etc.</li>
			</ul>
			</li>
			
			<li class="main" onclick="view(4,this,140)">OUTER
			<ul class="menu">
				<li>코트</li>
				<li>재켓/블레이저</li>
				<li>가디건</li>
				<li>베스트</li>
				<li>점퍼</li>
			</ul>
			</li>
			
			<li class="main" onclick="view(5,this,140)">SHOES
			<ul class="menu">
				<li>드레스 슈즈</li>
				<li>스니커즈</li>
				<li>벨크만 슈즈</li>
				<li>부츠/워커</li>
				<li>Etc.</li>
			</ul>
			</li>
			
			<li class="main" onclick="view(6,this,300)">ACCESSORY
			<ul class="menu">
				<li>타이/행커치프</li>
				<li>머플러/스카프</li>
				<li>목걸이/팔찌</li>
				<li>벨트/서스펜더</li>
				<li>아이웨어</li>
				<li>모자</li>
				<li>가방</li>
				<li>타이핀/부토니에</li>
				<li>양말</li>
				<li>시계</li>
				<li>벨크만 악세사리</li>
				<li>방향제</li>
				<li>Etc.</li>
			</ul>
			</li>
		</ul>
		
		<ul>
		    <li>&nbsp;</li>
			<li><a href="../product/pro_list.jsp?pbest=1">BEST</a></li>
			<li><a href="../product/pro_list.jsp?pnew=2">NEW</a></li>
		</ul>

		<ul>
			<li>
				<form name="search_form" method="post" action="../product/pro_list.jsp">
				<img src="../aa.png" onclick="view_search()"> 
				<input type="hidden" name="search_num" value="1"> 
				<span id="search_form" style="display: none"> 
				<input type="text" name="search_num" size="14" onkeyup="search_submit(this.form)">
				</span>
				</form>
			</li>
		</ul>

		<ul>
		<li>
		<%
		if(session.getAttribute("userid") == null) {
		%>
		<a href="../login/login.jsp">LOGIN</a>
		<%
		}
		else {	
		%>
		<a href="../login/logout.jsp">LOGOUT</a>
		<%
		}
		%>
		</li>
		
		<li>
		<%
		if(session.getAttribute("userid") == null) {
		%>
		<a href="../login/login.jsp">MY ACCOUNT</a>
		<%
		}
		else {
		%>
		<a href="../myshop/myinfo.jsp">MY ACCOUNT</a>
		<%
		}
		%>
		</li>
		
		<li>
		<%
		if(session.getAttribute("userid") == null) {
		%>
		<a href="../login/login.jsp">CART</a>
		<%
		}
		else {
		%>
		<a href="../myshop/cart_list.jsp">CART</a>
		<%
		}
		%>
		</li>
		<li>Q & A / REVIEW</li>
		</ul>
	</nav>
</body>
</html>