<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>
<%  
    Connection conn = Connect.connection2();
    Statement stmt = conn.createStatement();
    
    // 읽어올 쿼리 => order_addr테이블에서 현재 로그인한 사람의 배송주소를 가져온다
    String sql = "select * from order_addr where userid='"+session.getAttribute("userid")+"'";

    ResultSet rs = stmt.executeQuery(sql);
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../etc/main.css?after">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../etc/main.js"></script>
</head>
<body>
	<div>배송 주소록 관리</div>
	<div>배송주소록 유의사항</div>
	<div id="first">
		<table>
			<tr>
				<td><input type="checkbox" id="addrlist_main" onclick="chk_state(this)"></td>
				<td>주소록 고정</td>
				<td>배송지명</td>
				<td>수령인</td>
				<td>일반전화</td>
				<td>휴대전화</td>
				<td>주소</td>
				<td>배송지관리</td>
			</tr>
			<tr>
				
			</tr>
			<% 
			    int chk = 0;
			    while(rs.next()) {
			%>
			<tr> <!-- DB에 있는 배송지를 읽어와서 출력하는 부분 -->
				<td><input type="checkbox" class="addrlist_sub" onclick="chk_state2()"></td>
				<td>-</td>
				<td>
				<%
				  if(rs.getInt("main_addr") == 1)
					  out.print("<span style='border:1px solid black; background: lightblue'>기본</span>");
				%>
				<%=rs.getString("name")%>
				</td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("phone")%></td>
				<td><%=rs.getString("hphone")%></td>
				<td>(<%=rs.getString("zip")%>)<%=rs.getString("addr1")%></td>
				<td>
                   <input type="button" value="적용" onclick="opener_input('<%=rs.getString("name")%>','<%=rs.getString("zip")%>','<%=rs.getString("addr1")%>','<%=rs.getString("addr2")%>','<%=rs.getString("phone")%>','<%=rs.getString("hphone")%>')">
                   <input type="button" value="수정" onclick="location='addrlist_update.jsp?id=<%=rs.getString("id")%>'">
                </td>
			</tr>
			<%
			chk = 1;
            }
			%>
		</table>
		<div>
		    <input type="button" value="선택 주소록 삭제" id="addr_del" onload="addr_del(<%=chk%>)">
		    <input type="button" value="배송지등록" onclick="addr_chg()">
		</div>
	</div>
	<div id="second">
	<form method="post" action="addrlist_save.jsp" name="cjy">
	<table>
	<tr>
	<td>배송지명</td>
	<td><input type="text" name="addr_name"></td>
	</tr>
	<tr>
	<td>성명</td>
	<td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td rowspan="3">주소</td>
	<td>
	<input type="text" name="zip">
	<input type="button" value="우편번호" onclick="addrlist_search()">
	</td>
	</tr>
	<tr>
	<td><input type="text" name="addr1">기본주소</td>
	</tr>
	<tr>
	<td><input type="text" name="addr2">나머지주소</td>
	</tr>
	      <tr>
       <td> 일반전화 * </td>
       <td> 
         <select name="p1" id="p1">
           <option value="02"> 02 </option>
           <option value="031"> 031 </option>
           <option value="032"> 032 </option>
           <option value="033"> 032 </option>
         </select>
         <input type="text" name="p2">
         <input type="text" name="p3">
       </td>
     </tr> 
     <tr>
       <td> 휴대전화  </td>
       <td> 
         <select name="hp1" id="hp1">
           <option value="010"> 010 </option>
           <option value="011"> 011 </option>
           <option value="016"> 016 </option>
           <option value="017"> 017 </option>
         </select>
         <input type="text" name="hp2">
         <input type="text" name="hp3">
       </td>
     </tr> 
     <tr>
       <td colspan="2">
          <input type="checkbox" name="main_addr" value="1">기본주소로 저장
       </td>
     </tr>
	</table>
	<div>
	    <input type="submit" value="등록">
		<input type="button" value="배송지등록" onclick="addr_chg()">
	</div>
	</form>
	</div>
</body>
</html>