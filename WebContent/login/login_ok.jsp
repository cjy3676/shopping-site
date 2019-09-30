<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<%@ page import="shopping_site.jdbc.Connect"%>
<%
    // DB 연결
    request.setCharacterEncoding("UTF-8");
    Connection conn = Connect.connection2();
    Statement stmt = conn.createStatement();
    
    // 아이디, 비밀번호 requst
    String userid = request.getParameter("userid");
    String pwd = request.getParameter("pwd");
    
    // 회원인지 아닌지 체크
    String sql = "select * from member where userid='"+userid+"' ";
    sql = sql + " and pwd='"+pwd+"'";
    ResultSet rs = stmt.executeQuery(sql);
    
    if(rs.next()) { // 회원 => true, 회원이 아니면 => false
    	// 회원이면 => 세션변수	
    	session.setAttribute("userid",rs.getString("userid"));
    	session.setAttribute("name",rs.getString("name"));
    	response.sendRedirect("../main/index.jsp");
    }
    else { // 회원이 아니다 => 
%>
    <script>
    alert("회원정보가 일치하지 않거나 회원이 아닙니다.");
    history.back();
    </script>
<%    	
    }
%>