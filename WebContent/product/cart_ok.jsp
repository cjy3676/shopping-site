<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>
<%  
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
    out.print("ok");
%> 