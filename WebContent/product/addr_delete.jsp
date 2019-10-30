<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>    
<%
    Connection conn = Connect.connection2();
    Statement stmt = conn.createStatement();
    
    /* out.print(request.getParameter("addre_del")); => 1개의 값만 가져옴 */ 
    
    String[] addre_del = request.getParameterValues("addre_del");
    String bb = request.getParameter("bb");
    
    for(int i=0; i<addre_del.length; i++) {
    	String sql = "delete from order_addr where id="+addre_del[i];
    	stmt.executeUpdate(sql);
    }
    
    stmt.close();
    conn.close();
    if(bb.equals("1"))
    	response.sendRedirect("../myshop/deli_view.jsp");
    else
    	response.sendRedirect("addr_list.jsp");
%>