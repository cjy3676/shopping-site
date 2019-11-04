<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="shopping_site.Command.Pro_list"%>			
<%@ page import="shopping_site.Dto.Product"%>			
<%@ page import="java.util.ArrayList"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../etc/main.css?after">
<script src="../etc/main.js"></script>
<%
    request.setCharacterEncoding("UTF-8");
    String pcode = request.getParameter("pcode");
    String pbest = request.getParameter("pbest"); /* best */
    String pnew = request.getParameter("pnew"); /* new1 */
    String search_char = request.getParameter("search_char"); /* search */
    int search_num = 0; /* sea */
    if(request.getParameter("search_num") != null)
    	search_num = Integer.parseInt(request.getParameter("search_num"));
  
    String param = "";
    int non_pcode = 0; /* k */
     if(pcode != null) {
    	 non_pcode = 1;
	     param = pcode;
     }
     else if(pbest != null)
    	 param = pbest;
     else if(pnew != null)
	     param = pnew;
     else if(search_char != null)
	     param = search_char ;
     // pcode일때만 non_pcode=1이고, 나머지는 0
		   
     if(non_pcode == 1) {
%>
<script>
window.onload = function() {
	// 모든 하위메뉴 클래스를 숨기기
	for(i=0; i<6; i++) {
		document.getElementsByClassName("manu")[i].style.display = "none";
		// 하위메뉴를 숨기기
		document.getElementsByClassName("main")[i].style.height = "25px";
		// 하위메뉴가 속한 li태그의 높이를 원래대로
		}
	// 하위메뉴에 해당되는 class = menu에게 display => block:보이기
	var n; // 주메뉴중에 몇번째 인지
	var hei; // 부메뉴의 높이
	switch("<%=pcode.substring(0,3)%>") {
	case "p01": n=0; hei=180; break;
	case "p02": n=1; hei=120; break;
	case "p03": n=2; hei=140; break;
	case "p04": n=3; hei=160; break;
	case "p05": n=4; hei=140; break;
	case "p06": n=5; hei=140; break;
	case "p07": n=6; hei=300; 
	}
	document.getElementsByClassName("menu")[n].style.display = "block";
	document.getElementsByClassName("main")[n].style.height = hei+"px";
	
	document.getElementById("<%=pcode%>").style.borderBottom = "1px solid red";
}
</script>
<%
   }
%>
</head>
<body>
	<jsp:include page="../left.jsp" flush="false" />
	<div id="right">
		<section class="list_section">
<%
  String out_menu = "";
  
  if(search_num == 1) {
	  out_menu = "SEARCH<p>";
	  out_menu = out_menu + "<form name=search_form method='post' action='../product/pro_list.jsp'>";
	  out_menu = out_menu + "<input type='hidden' name='search_num' value='1'>";
	  out_menu = out_menu + "<input type='text' onclick='search_submit(this.form)' name='search_char' value="+param+">";
  }
  else if(param.equals("1"))
	  out_menu = "BEST";
  else if(param.equals("2"))
	  out_menu = "NEW";
  else if(non_pcode == 1) {
	  switch(param.substring(0,3)) {
	  case "p01": out_menu="SUITS"; break;
	  case "p02": out_menu="TOP"; break;
	  case "p03": out_menu="SHIRTS"; break;
	  case "p04": out_menu="PANTS"; break;
	  case "p05": out_menu="OUTER"; break;
	  case "p06": out_menu="SHOES"; break;
	  case "p07": out_menu="ACCESSORY"; break;
	  default: out_menu="";
	  }
  }
%>		
			<!-- pro_list.jsp 시작 -->		
			<%
				// DB연결
/* 				Connection conn = Connect.connection2();
				Statement stmt = conn.createStatement();

				// 가져올 쿼리 작성
				String sql = "select * from product where pcode like 'p01%' limit 0,24";

				// 쿼리 실행 
				ResultSet rs = stmt.executeQuery(sql); */
			%>
			<table width="800" cellspacing="30" border="0" style="margin-top:50px">
			<caption style="height:50px"><h3><%=out_menu%></h3></caption>
				<tr>
					<%
						// 출력 
						/* DecimalFormat df = new DecimalFormat("#,###"); */
                        /* pcode = request.getParameter("pcode"); */
						Pro_list plist = new Pro_list();
						ArrayList<Product> list = plist.pro_list(param, non_pcode);

                        for(int i=1; i<=list.size(); i++) {
					%>
					<td style="cursor:pointer" onclick="move_content(<%=list.get(i-1).getId()%>)">
					<p align="center">
					<img width="90" height="250" src="img/<%=list.get(i-1).getPlist()%>">
					</p>
					<p align="center"><%=list.get(i-1).getPname()%></p>
					<p align="right">♨<%=list.get(i-1).getPrice()%></p>
					</td>
					<%
						if (i % 4 == 0) {
					%>
				</tr>
				<tr>
					<%
						}
						}
					%>
				</tr>
			</table>
		</section>
		<jsp:include page="../footer.jsp" flush="false" />
	</div>
</body>
</html>