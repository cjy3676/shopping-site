<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shopping_site.Command.Update"%>
<%@ page import="shopping_site.Dto.Dto"%>
<%
    Update up = new Update();
    Dto dto = up.update_exe(session.getAttribute("userid").toString()); // Update클래스에 update_exe() 메소드 호출
%>    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" type="text/css" href="../etc/main.css?after">
<script src="../etc/main.js?abc"></script>
<script>
function load_init() {
	 // 비밀번호 확인질문
	 document.cjy.pwd_qu.selectedIndex=<%=dto.getPwd_qu()%>;
	 // 전화번호
	 var phone="<%=dto.getPhone()%>".split("-");
	 document.cjy.p1.value=phone[0];
	 document.cjy.p2.value=phone[1];
	 document.cjy.p3.value=phone[2];
	 // 휴대폰
	 var hphone="<%=dto.getHphone()%>".split("-");
	 document.cjy.hp1.value=hphone[0];
	 document.cjy.hp2.value=hphone[1];
	 document.cjy.hp3.value=hphone[2];
	 // 이메일
	 var email="<%=dto.getEmail()%>".split("@");
	 document.cjy.email1.value=email[0];
	 document.cjy.email2.value=email[1];
	 // 생일
	 var birth="<%=dto.getBirth()%>".split("-");
	 document.cjy.yy.value=birth[0];
	 document.cjy.mm.value=birth[1];
	 document.cjy.dd.value=birth[2];
	 // 성별
	 document.cjy.gender[<%=dto.getGender()%>].checked=true;
	 // sms수신여부, 이메일수신여부
	 <%  
	   int chk3=Math.abs(dto.getChk3()-1); // Math.abs(값)=> 값을 절대값으로
	   int chk4=Math.abs(dto.getChk4()-1);
	   // get값이 1일때는 1-1 => 0 , 0일때는 0-1 => -1 => 절대값 1
	 %>
	 document.pkc.chk3[<%=chk3%>].checked=true;
	 document.pkc.chk4[<%=chk4%>].checked=true;
}
</script>
</head>
<body onload="load_init()">
	<!-- 메인페이지 -->
	<jsp:include page="../left.jsp" flush="false"/>

	  <div id="right">
    <section class="member_update_section">
 <!-- 회원정보 수정 시작 -->    
 <div id="first"> 회 원 정 보 수 정 </div>
 
 <div id="second">
	<table width="800">
	 <tr>
	    <td>사진</td>
		<td>
		저희 쇼핑몰을 이용해 주셔서 감사합니다. <%=session.getAttribute("name")%> 님은 [일반회원] 회원이십니다.
		</td>
	 </tr>
	</table>
  </div>
  
 <div id="third"> <!-- 회원정보수정 폼 -->
  <form name="cjy" method="post" action="member_update_ok.jsp" onsubmit="return member_in(this)">
      <input type="hidden" name="phone">
      <input type="hidden" name="hphone">
      <input type="hidden" name="email">
      <input type="hidden" name="birth">
     <div id="in_div">
       <div id="tb_left">기본정보</div>
       <div id="tb_right">*필수입력사항</div>
     </div>
     <table width="800" border="0">  <!-- 회원정보 입력칸이 있는 두번째 테이블 -->
       <tr>
        <td class="td1"> 아이디 *</td>
        <td> 
        <input type="text" name="userid" class="in1" readonly value="<%=dto.getUserid()%>"> (영문소문자/숫자, 4~16자) 
        </td>
       </tr> 
       <tr>
        <td class="td1"> 비밀번호* </td>
        <td> 
        <input type="text" name="pwd" class="in1" onblur="check_len(this)" maxlength="16"> (영문대소문자/숫자, 4자~16자)
        </td>
       </tr> 
       <tr>
        <td class="td1"> 비밀번호확인* </td>
        <td> 
        <input type="text" name="pwd2" class="in1" onblur="check_equal()" maxlength="16"> 
        </td>
       </tr> 
       <tr>
        <td class="td1"> 비밀번호 확인 질문* </td>
        <td> 
          <select name="pwd_qu">
            <option value="0"> 기억에 남는 추억의 장소는?  </option>
            <option value="1"> 자신의 인생 좌우명은? </option>
            <option value="2"> 자신의 보물 제 1호는? </option>
            <option value="3"> 가장 기억에 남는 선생님 성함은?</option>
            <option value="4"> 타인이 모르는 자신만의 신체비밀이 있다면? </option>
            <option value="5"> 추억하고 싶은 날짜가 있다면? </option>
            <option value="6"> 내가 좋아하는 캐릭터는?</option>
          </select>
        </td>
       </tr> 
       <tr>
        <td class="td1"> 비밀번호 확인 답변*</td>
        <td> 
        <input type="text" name="pwd_an" class="in1"  value="<%=dto.getPwd_an()%>"> 
        </td>
       </tr> 
       <tr>
        <td class="td1"> 이름* </td>
        <td> 
        <input type="text" name="name" class="in1"  value="<%=dto.getName()%>"> 
        </td>
       </tr> 
       <tr>
        <td class="td1"> 주소 </td>
        <td style="line-height:30px"> 
            <input type="text" name="zip" class="in2"  value="<%=dto.getZip()%>">
            <input type="button" class="zip" value="우편번호" onclick="addr_search()"> <br>
            <input type="text" name="addr1" class="in1" value="<%=dto.getAddr1()%>"> 기본주소 <br>
            <input type="text" name="addr2" class="in1" value="<%=dto.getAddr2()%>"> 나머지주소 
        </td>
       </tr> 
       <tr>
        <td class="td1"> 일반전화 </td>
        <td> 
            <select name="p1">
              <option value="02"> 02 </option>
              <option value="031"> 031 </option>
              <option value="032"> 032 </option>
              <option value="033"> 033 </option>
            </select>
            <input type="text" name="p2" class="in2" maxlength="4">
            <input type="text" name="p3" class="in2" maxlength="4">
        </td>
       </tr> 
       <tr>
        <td class="td1"> 휴대전화* </td>
        <td> 
            <select name="hp1">
              <option value="010"> 010 </option>
              <option value="011"> 011 </option>
              <option value="016"> 016 </option>
              <option value="017"> 017 </option>
            </select>
            <input type="text" name="hp2" class="in2" maxlength="4">
            <input type="text" name="hp3" class="in2" maxlength="4">
        </td>
       </tr> 
       <tr>
        <td> SMS수신여부* </td>
        <td>
          <input type="radio" name="chk3" value="1">수신함
          <input type="radio" name="chk3" value="0">수신안함  <br>
            쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.      
       </tr>
       <tr>
        <td class="td1"> 이메일* </td>
        <td> 
             <input type="text" name="email1" class="in3"> @
             <input type="text" name="email2" class="in3">
             <select name="email_server" onchange="email_chg(this)">
		<option value="">-이메일 선택-</option>
		<option value="naver.com">naver.com</option>
		<option value="daum.net">daum.net</option>
		<option value="gmail.com">gmail.com</option>
		<option value="">직접입력</option>
             </select>
        </td>
       </tr> 
       <tr>
        <td> 이메일수신여부* </td>
        <td>
          <input type="radio" name="chk4" value="1">수신함
          <input type="radio" name="chk4" value="0">수신안함  <br>
            쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.      
       </tr>
     </table>
     
     <div class="top">추가정보</div>
     <table width="800" border="0">
       <tr>
         <td class="td1"> 성별* </td>
         <td>
            <input type="radio" name="gender" value="0">남자
            <input type="radio" name="gender" value="1">여자
       </tr>
       <tr>
         <td class="td1"> 생년월일* </td>
         <td>
            <input type="text" name="yy" class="birth1" maxlength="4">년
            <input type="text" name="mm" class="birth2" maxlength="2">월
            <input type="text" name="dd" class="birth2" maxlength="2">일
       </tr>
       <tr>
         <td colspan="2">
            <input type="submit" value="수정하기">
            <input type="button" value="취소" onclick="location='../main/index.jsp'">
         </td>
       </tr>
     </table>
   </form>
 </div>
<!-- 회원정보 수정 끝 -->   
		</section>
		<jsp:include page="../footer.jsp" flush="false"/>
	</div>
</body>
</html>