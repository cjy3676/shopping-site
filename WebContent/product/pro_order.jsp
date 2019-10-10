<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>
<%  
    Connection conn = Connect.connection2();
    Statement stmt = conn.createStatement();
    
    String pcode = request.getParameter("pcode");
    String psize = request.getParameter("psize");
    String pnum = request.getParameter("pnum");
    
    String sql = "select * from product where pcode='"+pcode+"'";
    ResultSet rs = stmt.executeQuery(sql);
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
</head>
<body onload="order_init(),payment()">
<jsp:include page="../left.jsp" flush="false" />
	<div id="right">
		<section class="order_section">
		<form method="post" action="pro_order_ok.jsp" name="cjy">
 <div id=first align=center> 주문서 작성</div>
 <div id=second> <img src="img2/img_order_step2.gif" width=800> </div> 
 <div id=third> 혜택정보 </div>
		<div id="fourth">주문내역</div>
			<table width="800" border="1">
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
				<tr>
					<td><input type="checkbox"></td>
					<td><img src="img/<%=rs.getString("plist")%>" width="50"></td>
					<td><%=rs.getString("pname")%> [옵션 : <%=psize%>]</td>
					<td><%=rs.getString("price")%></td>
					<td><%=pnum%></td>
					<td><%=(rs.getInt("point")*rs.getInt("price"))/100%></td>
					<td>기본배송</td>
					<td>[무료]</td>
					<td><%=rs.getInt("price") * Integer.parseInt(pnum)%></td>
					<!-- 합계금액 -->
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="3">[기본배송]</td>
					<td colspan="5">
					상품구매금액 <span id="tot_price1"><%=rs.getInt("price") * Integer.parseInt(pnum)%></span>
				    +배송비 0[무료]=합계 : <span id="tot_price2"><%=rs.getInt("price") * Integer.parseInt(pnum)%></span>
				</tr>
				<tr>
					<td colspan="9">! 상품의 옵션및 수량 변경은 상품상세 또는 장바구니에서 가능합니다</td>
				</tr>
				<tr>
					<td colspan="5">선택상품을 <input type="button" value="삭제하기">
					</td>
					<td colspan="4"><input type="button" value="이전페이지"></td>
				</tr>
			</table>
<%
    sql="select * from member where userid='"+session.getAttribute("userid")+"'";
    rs=stmt.executeQuery(sql);
    rs.next();
%>			
	    <div id="fifth">
	    <table width="800" border="1">
	    <tr>
	    <td>주문정보</td>
	    <td>*필수입력사항</td>
	    </tr>
	    <tr>
	    <td>주문하시는 분 *</td>
	    <td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
	    </tr>
	    <tr>
	    <td rowspan="3">주소 *</td>
	    <td>
	    <input type="text" name="zip" value="<%=rs.getString("zip")%>">
	    <input type="button" value="우편번호" onclick="oaddr_search(0)">
	    </td>
	    </tr>
	    <tr>
	    <td><input type="text" name="addr1" value="<%=rs.getString("addr1")%>"></td>
	    </tr>
	    <tr>
	    <td><input type="text" name="addr2" value="<%=rs.getString("addr2")%>"></td>
	    </tr>
<%
  String phone = rs.getString("phone");
  String[] pho = phone.split("-");
%>	    
	    <tr>
	    <td>일반전화 *</td>
	    <td>
	    <select name="p1" id="p1">
	    <option value="02">02</option>
	    <option value="031">031</option>
	    <option value="032">032</option>
	    <option value="033">033</option>
	    </select>
	    <input type="text" name="p1" value="<%=pho[1]%>">-
	    <input type="text" name="p2" value="<%=pho[1]%>">
	    </td>
	    </tr>
<%
  String hphone = rs.getString("hphone");
  String[] hpho = hphone.split("-");
%>	    
	    <tr>
	    <td>휴대전화</td>
	    <td>
	    <select name="hp1" id="hp1">
	    <option value="010">010</option>
	    <option value="011">011</option>
	    <option value="016">016</option>
	    <option value="017">017</option>
	    </select>
	    <input type="text" name="hp2" value="<%=hpho[1]%>">-
	    <input type="text" name="hp3" value="<%=hpho[2]%>">
	    </td>
	    </tr>
<%
  String email = rs.getString("email");
  String[] ema = email.split("@");
%>	    
	    <tr>
	    <td>이메일 *</td>
	    <td>
	    <input type="text" name="email1" class="in3" value="<%=ema[0]%>">@
	    <input type="text" name="email2" class="in3" value="<%=ema[1]%>">
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
	    <td><input type="text" name="oname" value="<%=rs.getString("name")%>"></td>
	    </tr>
	    <tr>
	    <td rowspan="3">주소 *</td>
	    <td>
	    <input type="text" name="ozip" value="<%=rs.getString("zip")%>">
	    <input type="button" value="우편번호" onclick="oaddr_search(1)">
	    </td>
	    </tr>
	    <tr>
	    <td><input type="text" name="oaddr1" value="<%=rs.getString("addr1")%>"></td>
	    </tr>
	    <tr>
	    <td><input type="text" name="oaddr2" value="<%=rs.getString("addr2")%>"></td>
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
	    <input type="text" name="op1" value="<%=pho[1]%>">-
	    <input type="text" name="op2" value="<%=pho[1]%>">
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
	    <input type="text" name="ohp2" value="<%=hpho[1]%>">-
	    <input type="text" name="ohp3" value="<%=hpho[2]%>">
	    </td>
	    </tr>
	    <tr>
	    <td>배송메세지</td>
	    <td><textarea rows="3" cols="50" name="omsg"></textarea></td>
	    </tr>   
	    </table>
        </div>
		<div id="seventh">
		<div>결제예정금액</div>
		<table width="800" border="1">
		<tr>
		<td>총 주문 금액 <input type="button" value="내역보기"></td>
		<td>총 할인 + 부가결제 금액</td>
		<td>총 결제 예정 금액</td>
		</tr>
		<tr>
		<td><span id="tot"></span></td>
		<td><span id="dis_cost"></span></td>
		<td><span id="tot_cost"></span></td>
		</tr>
		</table>
		<table width="800" border="1">
		<tr>
		<td>총 할인 금액</td>
		<td><span id="tot_dis"></span></td>
		</tr>
		<tr>
		<td>총 부가결제 금액</td>
		<td><span id="extra_cost"></span></td>
		</tr>
		</table>
		</div>
		<div id="eighth">
		<div>결제수단<input type="checkbox">결제수단과 입력정보를 다음에도 사용
		<table width="800" border="1">
		<tr>
		<td width="600">
		<div id="top">
		<input type="radio" onclick="pay_view(0)" checked>무통장입금
		<input type="radio" onclick="pay_view(1)">카드결제
		<input type="radio" onclick="pay_view(2)">에스크로(실시간 계좌이체)
		<input type="radio" onclick="pay_view(3)">휴대폰결제
		</div>
		<div id="bottom">
		<div></div>
		</div>
		<td>
		<div><span id="pay_"></span></div>
		</td>
		</table>
		</div>		
		</div>
		<div id="ninth">무이자할부이용안내</div>
		<div id="tenth"></div>
		</form>
		</section>
		<jsp:include page="../footer.jsp" flush="false" />
		</div>
</body>
</html>