<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="shopping_site.jdbc.Connect" %> 
<%
   Connection conn = Connect.connection2();
   Statement stmt = conn.createStatement();
   String[] del_num = request.getParameter("del_num").split(",");   // ,숫자,숫자.....
 
 
   for(int i=0; i<del_num.length; i++) {
     String sql="delete from cart where id="+del_num[i];
     stmt.executeUpdate(sql);
   }
   
   response.sendRedirect("cart_list.jsp");
%>
    