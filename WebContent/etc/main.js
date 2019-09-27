function check_method(n) { // 정리
	if(n == 0) {
		document.getElementById("chk_method").innerText = "》 이메일로 찾기";
		document.getElementById("email").style.display = "inline-block";
		document.getElementById("hphone").style.display = "none";
		document.getElementById("hphone").value = "";
	} else {
		document.getElementById("chk_method").innerText = "》 휴대폰 번호로 찾기";
		document.getElementById("email").style.display = "inline-block";
		document.getElementById("hphone").style.display = "none";
		document.getElementById("hphone").value = "";
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