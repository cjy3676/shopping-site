<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>
<%@ page import="shopping_site.Util.Util"%> 
<%
    String pcode = request.getParameter("pcode");
    String psize = request.getParameter("psize");
    String pnum = request.getParameter("pnum");
    String log = request.getParameter("log");
    
    if(session.getAttribute("userid") != null || log != null) { // 회원이 맞다면
        Connection conn = Connect.connection2();
        Statement stmt = conn.createStatement();
       
        String sql="select * from product where pcode='"+pcode+"'";
        ResultSet rs=stmt.executeQuery(sql);
        rs.next();
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../etc/main.css?after">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../etc/main.js?qwe22"></script>
<script>
function payment()
{  // 결제예정금액 출력부분 

	 var tot=<%=pnum%>*<%=rs.getInt("price")%>;// 총주문금액
	 var tot_dis=0;// 총할인금액
	 var extra_cost=0;// 부가결제금액
	 var dis_cost=tot_dis+extra_cost;// 총할인, 부가결제금액
	 var tot_cost=tot-tot_dis+extra_cost;// 총결제금액
	 document.getElementById("tot").innerText=tot;
	 document.getElementById("tot_dis").innerText=tot_dis;
	 document.getElementById("tot_cost").innerText=tot_cost;
	 document.getElementById("tot_dis").innerText=tot_dis;
	 document.getElementById("extra_cost").innerText=extra_cost;
	 //  결제수단영역에 값넘기기
	 document.getElementById("tot_pay").innerText=tot;// 총결제금액
	 // 적립될 point
	 <%
	    int point_save=Integer.parseInt(pnum)*rs.getInt("price");
	    point_save=point_save/100;
	 %>
	 var point=<%=point_save%>;
	 document.getElementById("tot_save").innerText=point;
	 document.getElementById("pro_save").innerText=point;
	 document.getElementById("mem_save").innerText="0";
	 document.getElementById("cou_save").innerText="0";
} 
</script>
</head>
<body onload="order_init(), payment()">
<input type="hidden" name="pcode" value="<%=pcode%>">
<input type="hidden" name="psize" value="<%=psize%>">
<input type="hidden" name="pnum" value="<%=pnum%>">
<input type="hidden" name="tot_dis" value="<%=0%>">
<input type="hidden" name="extra_cost" value="<%=0%>">
<input type="hidden" name="point" value="<%=point_save%>">
<input type="hidden" name="mem_point" value="<%=0%>">
<input type="hidden" name="cou_point" value="<%=0%>">
	<jsp:include page="../left.jsp" flush="false" />
	<div id="right">
	<section class="order_section">
		<form method="post" action="pro_order_ok.jsp" name="cjy">
	<div id="first" align="center">주문서 작성</div>
	<div id="second">
		<img src="img2/img_order_step2.gif" width="800">
	</div>
	<div id="third">
	     <div id="left">혜택정보</div>
		 <div id="right">
		 <div id="ff1" align="left" style="border-bottom: 1px solid #eeeeee">
			<%=session.getAttribute("name")%>님은, [일반회원]이십니다.
		 </div>
		 <div id="ff2" align="left">가용point:500p 쿠폰:0개</div>
		 </div>
	 </div>
	<%  

    %>
    <script>
    function main_chk() {
    	var subchk = document.getElementsByClassName("subchk");
    	var n = subchk.length;
    	
    	if(document.getElementById("mainchk").checked) {
    		// subchk를 전부 체크 => subchk의 checked 속성을 true
    		for(i=0; i<n; i++)
    			subchk[i].checked = true;
    	}
    	else {
    		// subchk를 전부 해제 => subchk의 checked 속성을 false
    		for(i=0; i<n; i++)
    			subchk[i].checked = false;
    	}
    }
    
    function sub_chk() {
    	var subchk = document.getElementsByClassName("subchk");
    	var n = subchk.length;
    	
    	// subchk의 체크여부를 판단
    	var chk = 0;
    	for(i=0; i<n; i++)
    		if(!subchk[i].checked) // subchk[i].checked == false
    		chk = 1;
    	if(chk == 0)
    		document.getElementById("mainchk").checked = true;
    	else
    		document.getElementById("mainchk").checked = false;
    }
    
    function sel_del() {
    	var subchk = document.getElementsByClassName("subchk");
    	var n = subchk.length;
    	alert(n);
    	for(i=n-1; i>=0; i--) {
    		if(subchk[i].checked) {
    			$(".data").eq(i).remove();
    			$(".order_body1").eq(i).remove();
    			$(".order_body2").eq(i).remove();
    			$(".order_body3").eq(i).remove();
    		// class 이름 : data, order_body1, order_body2, order_body3을 숨기기 => 조건 (checked가 참)
    		}
    	}
    }
    </script>
	 <div id="fourth">
		 <table width="800" border="0">
			<tr>
				<td colspan="9">! 상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</td>
			</tr>
			<tr>
				<td colspan="6">국내배송상품 주문내역</td>
				<td colspan="3"><input type="button" value="이전페이지"></td>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td>이미지</td>
				<td>상품정보</td>
				<td>판매가</td>
				<td>수량</td>
				<td>point</td>
				<td>배송구분</td>
				<td>배송비</td>
				<td>합계</td>
			</tr>
		    <tr class="order_body1">
				<td><input type="checkbox"></td>
				<td><img src="img/<%=rs.getString("plist")%>" width="50"></td>
				<td>
				<%=rs.getString("pname")%><p>
				[옵션 : <%=psize%>]
				</td>
				<td><%=Util.comma(rs.getInt("price"))%></td>
				<td><%=pnum%></td>
				<td><%=Util.comma((rs.getInt("point") * rs.getInt("price")*Integer.parseInt(pnum)) / 100)%></td>
				<td>기본배송</td>
				<td>[무료]</td>
				<td><%=rs.getInt("price") * Integer.parseInt(pnum)%></td>
				<!-- 합계금액 -->
			</tr>
			
			<tr class="order_body2">
				<td>&nbsp;</td>
				<td colspan="3">[기본배송]</td>
				<td colspan="5">상품구매금액 
				<span id="tot_price1">
				<%=rs.getInt("price") * Integer.parseInt(pnum)%>
				</span>
				+배송비 0[무료]=합계 : <span id="tot_price2"><%=rs.getInt("price") * Integer.parseInt(pnum)%></span>
			</tr>
			
			<tr class="order_body3">
				<td colspan="5">
				선택상품을 <input type="button" class="del_tn" value="삭제하기">
				</td>
				<td colspan="4"><input type="button" value="이전페이지"></td>
			</tr>
	        <tr>
	        <td>
	        <input type="button" onclick="sel_del()" value="선택상품삭제">
	        </td>
	        </tr>		
			</table>
	 </div>
	<%
	    String name = "";
	    String zip = "";
	    String addr1 = "";
	    String addr2 = "";
	    String[] phone = {"","",""};
	    String[] hphone = {"","",""};
	    String[] email = {"",""};
	    if(session.getAttribute("userid") != null) {
	    	sql = "select * from member where userid='" + session.getAttribute("userid") + "'";
	    	rs = stmt.executeQuery(sql);
	    	rs.next();
	    	
	    	name = rs.getString("name");
	    	zip = rs.getString("zip");
	    	addr1 = rs.getString("addr1");
	    	addr2 = rs.getString("addr2");
	    	phone = rs.getString("phone").split("-");
	    	hphone = rs.getString("hphone").split("-");
	    	email = rs.getString("email").split("@");
	    }	
	%>
	 <div id="fifth">
			<table width="800" border="1">
			<tr>
				<td>주문정보</td>
				<td>*필수입력사항</td>
			</tr>
			<tr>
				<td>주문하시는 분 *</td>
				<td>
				<input type="text" name="name" value="<%=rs.getString("name")%>">
				</td>
			</tr>
			<tr>
				<td rowspan="3">주소 *</td>
				<td>
				<input type="text" name="zip" value="<%=rs.getString("zip")%>"> 
				<input type="button" value="우편번호" onclick="oaddr_search(0)"></td>
			</tr>
			<tr>
				<td>
				<input type="text" name="addr1" value="<%=rs.getString("addr1")%>">
				</td>
			</tr>
			<tr>
				<td>
				<input type="text" name="addr2" value="<%=rs.getString("addr2")%>">
				</td>
			</tr>

			<tr>
				<td>일반전화 *</td>
				<td>
				<select name="p1" id="p1">
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
					<option value="033">033</option>
				</select> 
				<input type="text" name="p2" value="<%=phone[1]%>">- 
				<input type="text" name="p3" value="<%=phone[2]%>"></td>
			</tr>

			<tr>
				<td>휴대전화</td>
				<td>
				<select name="hp1" id="hp1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
				</select> 
				<input type="text" name="hp2" value="<%=hphone[1]%>">- 
				<input type="text" name="hp3" value="<%=hphone[2]%>"></td>
			</tr>

			<tr>
				<td>이메일 *</td>
				<td>
				<input type="text" name="email1" class="in3" value="<%=email[0]%>">@ 
				<input type="text" name="email2" class="in3" value="<%=email[1]%>"> 
				<select name="email_server" onchange="email_chg(this)">
					<option value="">-이메일 선택-</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="google.com">google.com</option>
					<option value="">직접입력</option>
				</select>
			    </td>
			</tr>
			</table>
			</div>

	<div id="sixth">
			<input type="hidden" name="oid">
			<table width="800" border="1">
			<tr>
				<td>배송정보</td>
				<td>*필수입력사항</td>
			</tr>
			<tr>
				<td>배송지 선택</td>
				<td>
				<input type="radio" name="order_addr" onclick="order_addr(1)" checked>주문자정보와 동일 
				<input type="radio" name="order_addr" onclick="order_addr(2)">새로운 배송지 
				<input type="button" value="주소록보기" onclick="order_open()">
				</td>
			</tr>
			<tr>
				<td>받으시는 분 *</td>
				<td>
				<input type="text" name="oname" value="<%=rs.getString("name")%>">
				</td>
			</tr>
			<tr>
				<td rowspan="3">주소 *</td>
				<td>
				<input type="text" name="ozip" value="<%=rs.getString("zip")%>"> 
				<input type="button" value="우편번호" onclick="oaddr_search(1)">
				</td>
			</tr>
			<tr>
				<td>
				<input type="text" name="oaddr1" value="<%=rs.getString("addr1")%>">
				</td>
			</tr>
			<tr>
				<td>
				<input type="text" name="oaddr2" value="<%=rs.getString("addr2")%>">
				</td>
			</tr>
			<tr>
				<td>일반전화 *</td>
				<td>
				<select name="op1" id="op1">
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
					<option value="033">033</option>
				</select> 
				<input type="text" name="op1" value="<%=phone[1]%>">- 
				<input type="text" name="op2" value="<%=phone[1]%>">
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td>
				<select name="ohp1" id="ohp1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
				</select> 
				<input type="text" name="ohp2" value="<%=hphone[1]%>">- 
				<input type="text" name="ohp3" value="<%=hphone[2]%>">
				</td>
			</tr>
			<tr>
				<td>배송메세지</td>
				<td>
				<textarea rows="3" cols="50" name="deli_mag"></textarea><!-- bae_msg -->
				</td>
			</tr>
			</table>
	</div>

	<div id="seventh">
			<div>결제예정금액</div>
			<table width="800" border="1">
				<tr>
					<td>
					총 주문 금액 <input type="button" value="내역보기">
					</td>
					<td>총 할인 + 부가결제 금액</td>
					<td>총 결제 예정 금액</td>
				</tr>
				<tr>
					<td><span id="tot"><!-- chong -->
					
					</span></td>
					<td><span id="dis_cost"><!-- halin -->
					
					</span></td>
					<td><span id="tot_cost"><!-- hap -->
					</span></td>
				</tr>
				</table>
				<table width="800" border="1">
				<tr>
					<td>총 할인 금액</td>
					<td><span id="tot_dis"><!-- halin1 -->
					</span></td>
				</tr>
				<tr>
					<td>총 부가결제 금액</td>
					<td><span id="extra_cost"><!-- buga -->
					</span></td>
				</tr>
				</table>
	 </div>
	 
	 <div id="eighth">
			<div> 결제수단
			<input type="checkbox" name="pay_way" value="1">결제수단과 입력정보를 다음에도 사용
				<table width="800" border="1">
				<tr>
					<td width="600">
				<div id="top">
					<input type="radio" value="0" name="pay_method" onclick="pay_view(0)" checked> 무통장입금
					<input type="radio" value="1" name="pay_method" onclick="pay_view(1)">카드결제 
					<input type="radio" value="2" name="pay_method" onclick="pay_view(2)">에스크로(실시간 계좌이체) 
					<input type="radio" value="3" name="pay_method" onclick="pay_view(3)">휴대폰결제
				</div>
				
	<div id="bottom">
			<div class="pay_method"><!-- 무통장입금 -->
				<table width="500" border="1">
				<tr>
					<td>입금자명</td>
					<td><input type="text" name="deposit_name"></td><!-- ipgum -->
				</tr>
				<tr>
					<td>입금은행</td>
					<td>
					<select name="deposit_bank"><!-- ipbank -->
						<option value="0">선택해주세요</option>
						<option value="1">농협123-45-67890</option>
						<option value="2">신한123-45-123456</option>
					</select>
					<br>
					<input type="button" value="은행사이트 바로가기">
					</td>
				</tr>
				</table>
					<div>! 최소결제 가능금액은 결제금액에서 배송비를 제외한 금액입니다</div>
			</div>
										
			<div class="pay_method"><!-- 카드결제 -->
			! 최소결제 가능금액은 결제금액에서 배송비를 제외한 금액입니다 <p>
			! 소액결제의 경우 PG사 정책에 따라 결제금액 제한이 있을수 있습니다.
			</div>
										
			<div class="pay_method"><!-- 에스크로 -->
				<table width="500" border="1">
				<tr>
					<td>예금주명</td>
					<td><input type="text" name="deposit_name"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="checkbox">에스크로(구매안전)서비스를 적용합니다.
				</tr>
				</table>
			<div>! 소액결제의 경우 PG사 정책에 따라 결제금액 제한이 있을수 있습니다.</div>
			</div>
			<div class="pay_method"><!-- 휴대폰결제 -->
			! 소액결제의 경우 PG사 정책에 따라 결제금액 제한이 있을수 있습니다.
			</div>
			</div>
				  </td>
				  <td>
			<!-- 결제수단의 오른쪽 부분 -->
			<div>
				<span id="pay_way"></span> 최종결제금액 <!-- pay_sudan -->
			</div>
			<div id="tot_pay"><!-- pay_hap --> 
			</div>
			<div>
			<input type="submit" value="결제하기">
			</div>
			<div>
				<table>
				<tr>
					<td>총 적립예정금액</td>
					<td><span id="tot_save"><!-- chong_juk -->
					</span>P</td>
				</tr>
                <!-- <tr>
					<td>상품별 point</td>
					<td><span id="pro_save"></span>P</td>sang_juk
				</tr> -->
				<tr>
					<td>회원 point</td>
					<td><span id="mem_save">0</span>P</td><!-- mem_juk -->
				</tr>
				<tr>
					<td>쿠폰 point</td>
					<td><span id="cou_save">0</span>P</td><!-- cou_juk -->
				</tr>
				</table>
			</div>
					</td>
				</tr>
				</table>
			</div>
			
	<div id="ninth">
			<div>무이자할부이용안내</div>
			<div>
			- 무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다. 
			- 무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.
            </div>
	</div>
	 
    <div id="tenth">
			<div>이용 안내</div>
			<div>
			<jsp:include page="operation_guide.txt" /></div>
			</div>
			</form>
		</section>
		<jsp:include page="../footer.jsp" flush="false" />
	</div>
	<script>
	function order_init() {
		var p = "<%=phone[0]%>";
		var hp = "<%=hphone[0]%>";
		var p1 = document.getElementById("p1");
		var hp1 = document.getElementById("hp1");
		
		for(i=0; i<p1.length; i++) {
			if(p1[i].value == p) {
				p1.selectedIndex = i;
				document.getElementById("op1").selectedIndex = i;
			}
		}
		
		for(i=0; i<hp1.length; i++) {
			if(hp1[i].value == hp) {
				hp1.selectedIndex = i;
				document.getElementById("ohp1").selectedIndex = i;
			}
		}
	}
	</script>
</body>
</html>
<%
  stmt.close();
  conn.close();
  }
    else // 회원이 아니라면
    	response.sendRedirect("../login/login.jsp?chk=1&pcode="+pcode+"&psize="+psize+"&pnum="+pnum);
%>