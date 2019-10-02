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

function addr_search()  // 우편번호 버튼 클릭시 호출 함수명
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