function pay_view() { // 결제수단에 따른 하위내용 변화
	// 기존에 보였던 내용을 숨기기
	var pay = document.getElementsByClassName("pay_method");
	for(i=0; i<4; i++)
		pay[i].style.display = "none"; // 모두 숨기기
	// 선택된 결제수단의 내용을 보이기
	pay[n].style.display = "block";
}

/*function payment() { // 정리필요
	// 결제예정금액 출력부분 
	// 총 주문금액
	var tot = <%=pnum%> * <%=rs.getInt("price")%>;
	// 총 할인금액, 부가결제금액
	var tot_dis, extra_cost = 0;
	// 총 할인, 부가결제금액
	var dis_cost = tot_dis+extra_cost;
	// 총 결제금액
	var tot_cost = 
	// 총 할인금액
	// 부가결제금액
}*/

function addrlist_update(p,hp) {
	   var phone= p;
	   var hphone= hp;
	   var pho=p.split("-");
	   var hpho=hp.split("-");
	   document.cjy.p1.value=pho[0];
	   document.cjy.p2.value=pho[1];
	   document.cjy.p3.value=pho[2];
	   document.cjy.hp1.value=hpho[0];
	   document.cjy.hp2.value=hpho[1];
	   document.cjy.hp3.value=hpho[2];
}

function opener_input(oid,n,z,a1,a2,p,hp) { // 이름, 우편번호, 주소1, 주소2, 전화번호, 휴대폰
	opener.document.cjy.oid.value = oid;
	opener.document.cjy.oname.value = n;
	opener.document.cjy.ozip.value = z;
	opener.document.cjy.oaddr1.value = a1;
	opener.document.cjy.oaddr2.value = a2;
	var pp = p.split("-");	
	var hh = hp.split("-");	
	opener.document.cjy.op1.value = pp[0];
	opener.document.cjy.op2.value = pp[1];
	opener.document.cjy.op3.value = pp[2];
	opener.document.cjy.ohp1.value = hh[0];
	opener.document.cjy.ohp2.value = hh[1];
	opener.document.cjy.ohp3.value = hh[2];
	close();
}

function chk_state2() { // 하위에 있는 체크박스가 하나라도 해제되어있다면 메인체크박스가 해제
	// 하위에 있는 체크박스의 해제 여부를 판단
	var n = document.getElementsByClassName("addr_sub").length;
	var chk = 0;
	for(i=0; i<n; i++)
		if(document.getElementsByClassName("addr_sub")[i].checked == false)
			chk = 1;
	
	if(chk == 0)
		document.getElementById("addr_sub").checked = true;
	else
		document.getElementById("addr_sub").checked = false;
}

function chk_state(pp) {
	var n = document.getElementsByClassName(addr_sub).length;
	if(pp.checked) {// input type = checkbox의 체크여부(true, false)
		// 밑에 있는 체크박스를 전부 체크시킨다.
		for(i=0; i<n; i++)
			document.getElementsByClassName("addr_sub")[i].checked = true;
	}
	else {
		// 밑에 있는 체크박스를 전부 체크해제
		for(i=0; i<n; i++)
			document.getElementsByClassName("addr_sub")[i].checked = false;
	}
}

function addr_del(tt) {
	if(tt == 0)
		document.getElementById("addr_del").style.display = "none";
	
}

function addrlist_search() { // 우편번호 버튼 클릭시 호출 함수명(배송지 등록, addr_list)
  new daum.Postcode({
      oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } 
          else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }
          
              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.cjy.zip.value = data.zonecode; // 우편번호
              document.cjy.addr1.value = addr;  // 주소
              // 커서를 상세주소 필드로 이동한다.
              document.cjy.addr2.value = "";
              document.cjy.addr2.focus();
      }
  }).open();
}

function addr_chg() {
	document.getElementById("first").style.display = "none";
	document.getElementById("second").style.display = "block";
}

function addr_chg2() {
	document.getElementById("first").style.display = "block";
	document.getElementById("second").style.display = "none";
}

function order_open() {
	window.open("addr_list.jsp","","width=800,height=900");
}

function oaddr_search(n)  // 우편번호 버튼 클릭시 호출 함수명(주문시, pro_order.jsp)
{
  new daum.Postcode({
      oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } 
          else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }
          
          if(n == 0) {
              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.cjy.zip.value = data.zonecode; // 우편번호
              document.cjy.addr1.value = addr;  // 주소
              // 커서를 상세주소 필드로 이동한다.
              document.cjy.addr2.value = "";
              document.cjy.addr2.focus();
          }
          else {
              document.cjy.ozip.value = data.zonecode; // 우편번호
              document.cjy.oaddr1.value = addr;  // 주소
              // 커서를 상세주소 필드로 이동한다.
              document.cjy.oaddr2.value = "";
              document.cjy.oaddr2.focus();
          }
      }
  }).open();
}

function order_init() {
	var p = "<%=pho[0]%>"; // 02
	var hp = "<%=hpho[0]%>"; // 010
	var p1 = document.getElementById("p1");
	var hp1 = document.getElementById("hp1");

	for (i = 0; i < p1.length; i++) { // alert(p1[i].value+" "+p)
		if (p1[i].value == p) {
			p1.selectedIndex = i;
			bp1.selectedIndex = i;
		}
	}

	for (i = 0; i < hp1.length; i++) { // alert(hp1[i].value+" "+hp)
		if (hp1[i].value == hp) {
			hp1.selectedIndex = i;
			bhp1.selectedIndex = i;
		}
	}
}

function order_addr(chk) {
	if(chk == 1) { // 주문자정보와 동일
		
	}
	else { // 비우기
		document.cjy.bname.value = "";
		document.cjy.bzip.value = "";
		document.cjy.baddr1.value = "";
		document.cjy.baddr2.value = "";
		document.cjy.bp1.selectedIndex = 0;
		document.cjy.bp2.value = "";
		document.cjy.bp3.value = "";
		document.cjy.bhp1.selectedIndex = 0;
		document.cjy.bhp1.value = "";
		document.cjy.bhp1.value = "";
	}
}

function comma(price) {
	price = price + "";
	price = price.replace(/\B(?=(\d{3})+(?!\d))/g,",");
	
	return price;
}

function page_wish() {
	location = "wish_view.jsp";
}

function not_wish() {
	document.getElementById("wish_layer").style.display = "none";
}

var wish = new XMLHttpRequest(); 
function move_wish(pid) {
	url = "wish_ok.jsp?pid="+pid;
	wish.open("get",url);
	wish.send();
}
wish.onreadystatechange = function() {
	if(wish.readyState == 4) {
		if(wish.responseText.trim() == "ok") {
			document.getElementById("wish_layer").style.display = "block";
		}
	}
}

function page_cart() {
	location = "cart_view.jsp";
}

function not_cart() {
	document.getElementById("cart_layer").style.display = "none";
}

var cart = new XMLHttpRequest(); 
function move_cart(pid) {
	var size = document.getElementById("size").value;
	var pnum = document.getElementById("pnum").value;
	url = "cart_ok.jsp?pid="+pid+"&psize="+psize+"&pnum="+pnum;
	cart.open("get",url);
	cart.send();
}
cart.onreadystatechange = function() {
	if(cart.readyState == 4) {
		if(cart.responseText.trim() == "ok") {
			document.getElementById("cart_layer").style.display = "block";
		}
	}
}

function move_content(id) { // 상품상세 페이지 이동
	location="pro_content.jsp?id="+id;
}

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
	
	document.cjy.pcode.value = "p"+l+m+cu+cm;
}

function check_method(n) { 
	if(n == 0) {
		document.getElementById("chk_method").innerText = "》 이메일로 찾기";
		document.getElementById("email").style.display = "inline-block";
		document.getElementById("hphone_text").style.display = "none";
		document.getElementById("hphone_text").value = "";
	} else {
		document.getElementById("chk_method").innerText = "》 휴대폰 번호로 찾기";
		document.getElementById("hphone_text").style.display = "inline-block";
		document.getElementById("email").style.display = "none";
		document.getElementById("email").value = "";
	}
}

function main_check() {
	// 4개의 체크중에 하나라도 체크가 해제되면 => 메인체크를 해제
	var ch = 0;
	var memchk = document.getElementsByClassName("chk");
	for(i=0; i<=3; i++) {
		if(memchk[i].checked == false) {			
			ch = 1;
		}
	}
	if(ch = 0) {
		document.getElementById("chk_main").checked = true;
	}
	else {
		document.getElementById("chk_main").checked = false;		
	}
}

function check_onoff(pp) {
	// check가 되면 4개의 checkbox를 true, check가 해제되면 4개의 checkbox false
	var memchk = document.getElementsByClassName("chk");
	if(pp.checked) {
		for(i=0; i<=3; i++) {
			memchk[i].checked = true;
		}		
	}
	else {		
		for(i=0; i<=3; i++) {
			memchk[i].checked = false;
		}	
	}
}

function email_chg(pp) {
	document.cjy.email2.value = pp.value;
}

function check_equal() {
	// 두개의 값을 다 가져된다
	var p1 = document.cjy.pwd.value;
	var p2 = document.cjy.pwd2.value;
	if(p1 != p2) {
		alert("비밀번호가 다릅니다.");
		document.cjy.pwd1.value = "";
		document.cjy.pwd2.value = "";
		document.cjy.pwd1.focus();
	}
}

function check_userid(pp) {
	/*form에 입력된 값 => document.폼이름.입력양식이름.value
	1개의 양식을 처리할때는 this하는게 편하다*/
	var len = pp.value.length;
	if(len >= 4 && len <= 16) {
		alert("사용 가능한 아이디입니다.");
	}
	else {
		alert("아이디는 영문소문자 또는 숫자 4~16자로 입력해 주세요.");
		pp.value = "";
		pp.focus();
	}
}

function member_in(pp)
{
	  pp.phone.value=pp.p1.value+"-"+pp.p2.value+"-"+pp.p3.value;
	  pp.hphone.value=pp.hp1.value+"-"+pp.hp2.value+"-"+pp.hp3.value;
	  pp.birth.value=pp.yy.value+"-"+pp.mm.value+"-"+pp.dd.value;
	  pp.email.value=pp.email1.value+"@"+pp.email2.value;
}

function addr_search()  // 우편번호 버튼 클릭시 호출 함수명(회원가입시, member.jsp)
{
  new daum.Postcode({
      oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.cjy.zip.value = data.zonecode; // 우편번호
          document.cjy.addr1.value = addr;  // 주소
          // 커서를 상세주소 필드로 이동한다.
          document.cjy.addr2.focus();
      }
  }).open();
}

function view(n,pp,hei) {
	// 하위메뉴에 해당되는 class=menu 에게 display => block : 보이기
	for(i=0; i<=6; i++){
		// 하위메뉴를 숨기기
		document.getElementsByClassName("menu")[i].style.display = "none";
		// 하위메뉴가 속한 li태그의 높이를 원래대로
		document.getElementsByClassName("main")[i].style.height = "25px";
	}
	document.getElementsByClassName("menu")[n].style.display = "block";
	pp.style.height = hei+"px";
}

$(function() {
	$("#logo").mouseover(function() {
		$(this).animate({
			color : "#bbbbbb"
		}, 200);
	});
	$("#logo").mouseout(function() {
		$(this).animate({
			color : "black"
		}, 200);
	});
});