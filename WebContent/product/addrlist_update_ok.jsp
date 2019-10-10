<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>
<%
   // dB연결
    Connection conn=Connect.connection2();
    Statement stmt=conn.createStatement();
    
   // request받기
    request.setCharacterEncoding("UTF-8");
    String id=request.getParameter("id");
    String oname=request.getParameter("oname");
    String name=request.getParameter("name");
    String zip=request.getParameter("zip");
    String addr1=request.getParameter("addr1");
    String addr2=request.getParameter("addr2");
    String phone=request.getParameter("p1")+"-"+request.getParameter("p2")+"-"+request.getParameter("p3");
    String hphone=request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
    String userid=session.getAttribute("userid").toString();
    String main_addr;
    String sql;
    if(request.getParameter("main_addr")==null)
    	main_addr="0";
    else  // 기존에 있는 주소의 main_addr field의 값을 0으로 변경
    {
    	sql="update order_addr set main_addr=0 where userid='"+userid+"'";
    	stmt.executeUpdate(sql);
    	main_addr=request.getParameter("main_addr");
    }
    
   // 쿼리 작성
    sql="update order_addr set oname=?, name=?, zip=?, addr1=?";
    sql=sql+", addr2=?, phone=?, hphone=?, main_addr=? where id=?";
    PreparedStatement pstmt=conn.prepareStatement(sql);
    pstmt.setString(1,oname);
    pstmt.setString(2,name);
    pstmt.setString(3,zip);
    pstmt.setString(4,addr1);
    pstmt.setString(5,addr2);
    pstmt.setString(6,phone);
    pstmt.setString(7,hphone);
    pstmt.setString(8,main_addr);
    pstmt.setString(9,id);
    
   // 쿼리실행
    pstmt.executeUpdate();
   
   // bae_list.jsp 로 이동
   pstmt.close();
   stmt.close();
   conn.close();
   response.sendRedirect("addr_list.jsp");
%>
