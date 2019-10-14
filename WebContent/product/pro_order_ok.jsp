<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>   
<%
    Connection conn = Connect.connection2();

	// request값 가져오기
    request.setCharacterEncoding("UTF-8");
    String pcode = request.getParameter("pcode");
    String psize = request.getParameter("psize");
    String pnum = request.getParameter("pnum");
    String dis_cost = request.getParameter("dis_cost");
    String extra_cost = request.getParameter("extra_cost");
    String point = request.getParameter("point");
    String mem_point = request.getParameter("mem_point");
    String cou_point = request.getParameter("cou_point");
    String pay_way; // 체크가 된것과 안된것 2가지중 하나
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
		String sql = "select * from member where userid='"+session.getAttribute("userid")+"'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		// 주소정보를 order_addr 테이블에 저장
		sql = "insert into order_addr(userid,oname,name,zip,addr1,addr2";
		sql = sql + ",phone,hphone,main_addr,writeday)";
		sql = sql + " values(?,?,?,?,?,?,?,?,0,now())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, session.getAttribute("userid").toString());
		pstmt.setString(2, rs.getString("name"));
		pstmt.setString(3, rs.getString("name"));
		pstmt.setString(4, rs.getString("zip"));
		pstmt.setString(5, rs.getString("addr1"));
		pstmt.setString(6, rs.getString("addr2"));
		pstmt.setString(7, rs.getString("phone"));
		pstmt.setString(8, rs.getString("hphone"));
		pstmt.executeUpdate(); // 현재 배송주소가 테이블에 등록 
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
	
	// 쿼리 작성
	String sql = "insert into order_deli(pcode,psize,pnum,userid";
	sql = sql + ",oid,dis_cost,extra_cost,point,mem_point,cou_point";
	sql = sql + ",pay_way,pay_method,deposit_name,deposit_bank,writeday";
	sql = sql + ",deli_step) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pcode);
	pstmt.setString(2, psize);
	pstmt.setString(3, pnum);
	pstmt.setString(4, session.getAttribute("userid").toString());
	pstmt.setString(5, oid);
	pstmt.setString(6, dis_cost);
	pstmt.setString(7, extra_cost);
	pstmt.setString(8, point);
	pstmt.setString(9, mem_point);
	pstmt.setString(10, cou_point);
	pstmt.setString(11, pay_way);
	pstmt.setString(12, pay_method);
	pstmt.setString(13, deposit_name);
	pstmt.setString(14, deposit_bank);
	pstmt.setString(15, deli_step);
	pstmt.executeUpdate();
	// order_deli에 저장
	
	// order_deli테이블에 접근할수 있는 특정값을 전달 => id값을 가져온다
	sql = "select max(id) as id from order_deli where userid='"+session.getAttribute("userid")+"'";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	response.sendRedirect("order_view.jsp?id="+rs.getString("id"));
%>