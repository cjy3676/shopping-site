<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<%@ page import="shopping_site.jdbc.Connect"%>    
<%@ page import="shopping_site.Util.Util"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    // request값 가져오기
    request.setCharacterEncoding("UTF-8");

    // 1개 이상의 상품을 구매
    String pcode = request.getParameter("pcode");
    String psize = request.getParameter("psize");
    String pnum = request.getParameter("pnum");
    String dis_cost = request.getParameter("dis_cost");
    String extra_cost = request.getParameter("extra_cost");
    String point = request.getParameter("point");
    String mem_point = request.getParameter("mem_point");
    String cou_point = request.getParameter("cou_point");

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

    String name = request.getParameter("name");
    String zip = request.getParameter("zip");
    String addr1 = request.getParameter("addr1");
    String addr2 = request.getParameter("addr2");
    String phone = request.getParameter("p1")+"-"+request.getParameter("p2")+"-"+request.getParameter("p3");
    String hphone = request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
    String email  = request.getParameter("email")+"@"+request.getParameter("email2");
    
    // 주문번호를 만들기
    Date today = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    String order_num = sdf.format(today)+"-"+request.getParameter("p2")+request.getParameter("p3");
    
    // unmember 테이블에 저장, porder테이블에 저장
    Connection conn = Connect.connection2();
    String sql = "insert into unmember(name,zip,addr1,addr2,phone,hphone,email,order_num,writeday)";
    sql = " values(?,?,?,?,?,?,?,?,now())";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, name);
    pstmt.setString(2, zip);
    pstmt.setString(3, addr1);
    pstmt.setString(4, addr2);
    pstmt.setString(5, phone);
    pstmt.setString(6, hphone);
    pstmt.setString(7, email);
    pstmt.setString(8, order_num);
    pstmt.executeUpdate();
    
    sql = "insert into order_deli(pcode,psize,pnum,userid";
    sql = sql + ",oid,dis_cost,extra_cost,point,mem_point,cou_point";
    sql = sql + ",pay_way,pay_method,deposit_name,deposit_bank,writeday";
    sql = sql + ",deli_step,deli_msg) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, pcode);
    pstmt.setString(2, psize);
    pstmt.setString(3, pnum);
    pstmt.setString(4, order_num);
    pstmt.setString(5, "0");
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
    pstmt.setString(16, "비회원");
    pstmt.executeUpdate();
    pstmt.close();
    conn.close();
    
    // cart에서 넘어온 cc
    response.sendRedirect("order_view.jsp?userid="+order_num+"&cc=2");
%>