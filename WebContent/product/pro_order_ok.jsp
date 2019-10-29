<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>   
<%
    Connection conn = Connect.connection2();

	// request값 가져오기
    request.setCharacterEncoding("UTF-8");
	
	// 1개 이상의 상품을 구매
	String[] pcode = request.getParameterValues("pcode");
	String[] psize = request.getParameterValues("psize");
	String[] pnum = request.getParameterValues("pnum");
	String[] dis_cost = request.getParameterValues("dis_cost");
	String[] extra_cost = request.getParameterValues("extra_cost");
	String[] point = request.getParameterValues("point");
	String[] mem_point = request.getParameterValues("mem_point");
	String[] cou_point = request.getParameterValues("cou_point");
	String[] cart_id = request.getParameterValues("cart_id");
	if(cart_id == null)
		out.print("dd");
	String deli_msg = request.getParameter("deli_msg");
	String pay_way;
    if(request.getParameter("pay_way") == null)
    	pay_way = "0";
    else
    	pay_way = "1";
    
    String pay_method = request.getParameter("pay_method");
    String deposit_name = request.getParameter("deposit_name");
    String deposit_bank = request.getParameter("deposit_bank");
    
    // deli_step 만들기 : 카드결제,휴대폰결제(1), 무통장,에스크로(0)
	String deli_step = "";
	switch (request.getParameter("pay_method")) {
	case "0": deli_step = "0"; break;
	case "1": deli_step = "1"; break;
	case "2": deli_step = "0"; break;
	case "3": deli_step = "1";
	}
	
	// 배송주소록에 레코드가 없을때 (pro_order.jsp에서 oid값이 없을때)
	String oid;
	if(request.getParameter("oid").equals("")) {
		// member테이블에 있는 레코드를 불어오기
		String sql;
		Statement stmt;
		ResultSet rs;
		PreparedStatement pstmt;
		
		// oid가 없고 새로운 배송지
		if(false) { // 새로운 배송지를 request 받아서 order_addr 테이블에 저장
			
		}
		else { // oid가 없다는것은 주문자 정보와 동일한 주소
		// 현재주소가 order_addr 테이블에 있는지 확인	
	    sql = "select * from member where userid='"+session.getAttribute("userid")+"'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		rs.next();
	    // 주소정보를 order_addr 테이블에 저장
		sql = "insert into order_addr(userid,oname,name,zip,addr1,addr2";
		sql = sql + ",phone,hphone,main_addr,writeday)";
		sql = sql + " values(?,?,?,?,?,?,?,?,0,now())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, session.getAttribute("userid").toString());
		pstmt.setString(2, rs.getString("name"));
		pstmt.setString(3, rs.getString("name"));
		pstmt.setString(4, rs.getString("zip"));
		pstmt.setString(5, rs.getString("addr1"));
		pstmt.setString(6, rs.getString("addr2"));
		pstmt.setString(7, rs.getString("phone"));
		pstmt.setString(8, rs.getString("hphone"));
		pstmt.executeUpdate(); // 현재 배송주소가 테이블에 등록 
		}
		sql = "select max(id) ad oid from order_addr where userid='"+session.getAttribute("userid")+"'";
		rs = stmt.executeQuery(sql);
		rs.next();
		oid = rs.getString("oid");
		
		stmt.close();
		pstmt.close();
		rs.close();
	}
	
	else {
		oid = request.getParameter("oid");
	}
	
	String sql = "select max(id) as id from porder where userid='"+session.getAttribute("userid")+"'";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	// 현재 구입하기 이전값중 가장 최근의 값
	String num = rs.getString("id");
	if(num == null)
		num = "0";
	// 쿼리 작성
	for(int i=0; i<pcode.length; i++) {
	sql = "insert into order_deli(pcode,psize,pnum,userid";
	sql = sql + ",oid,dis_cost,extra_cost,point,mem_point,cou_point";
	sql = sql + ",pay_way,pay_method,deposit_name,deposit_bank,writeday";
	sql = sql + ",deli_step,deli_msg) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pcode[i]);
	pstmt.setString(2, psize[i]);
	pstmt.setString(3, pnum[i]);
	pstmt.setString(4, session.getAttribute("userid").toString());
	pstmt.setString(5, oid);
	pstmt.setString(6, dis_cost[i]);
	pstmt.setString(7, extra_cost[i]);
	pstmt.setString(8, point[i]);
	pstmt.setString(9, mem_point[i]);
	pstmt.setString(10, cou_point[i]);
	pstmt.setString(11, pay_way);
	pstmt.setString(12, pay_method);
	pstmt.setString(13, deposit_name);
	pstmt.setString(14, deposit_bank);
	pstmt.setString(15, deli_step);
	pstmt.setString(16, deli_msg);
	pstmt.executeUpdate();
	// order_deli에 저장
	}
	// order_deli테이블에 접근할수 있는 특정값을 전달 => id값을 가져온다
	for(int i=0; i<cart_id.length; i++) {
		sql = "delete from cart where id="+cart_id[i];
		stmt.executeUpdate(sql);
	}
	
	stmt.close();
	conn.close();
	response.sendRedirect("order_view.jsp?num="+num);
%>