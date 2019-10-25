<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>
<%  
    //cart_ok.jsp => cart 테이블에 pid, psize, pnum 저장하고 out.print()에 ok
    Connection conn = Connect.connection2();
    Statement stmt = conn.createStatement();
    
    // 값 가져오기
    String pid = request.getParameter("pid");
    String psize = request.getParameter("psize");
    String pnum = request.getParameter("pnum");
    String userid = session.getAttribute("userid").toString();
    
    String sql = "insert into cart(pid,psize,pnum,userid) values("+pid;
    sql = sql+","+psize+","+pnum+",'"+userid+"')";
    stmt.executeUpdate(sql);
    
    stmt.close();
    conn.close();
    
    // 1. pro_content.jsp에서 ajax로 호출
    // 2. wish_list.jsp에서 form으로 요청
    // 현재 문서 cart_ok.jsp에서 1번인지 2번인지 확인할 필요
    
    if(request.getParameter("cart_ok_move") == null)
    	out.print("ok");
    else
    	response.sendRedirect("../myshop/cart_list.jsp");
%> 