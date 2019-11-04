<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@ page import="shopping_site.jdbc.Connect"%> 
<%@ page import="java.text.DecimalFormat"%>   
<%@ page import="java.net.URLEncoder"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    Connection conn=Connect.connection2();
    Statement stmt=conn.createStatement();
    ResultSet rs=null;
    
    Cookie[] cookie=request.getCookies(); // 쿠키를 다 가져온다.
       int co_num = cookie.length;
        
       for(int i=0; i<co_num-1; i++)
       { 
    	   String sql="select plist from product where pcode='"+cookie[i].getValue()+"'";
           rs=stmt.executeQuery(sql);
           rs.next();
           out.print(cookie[i].getName());
%>         
          <img src="img/<%=rs.getString("plist")%>" width=30 height=30><br>
<%            
       }
%>
    <input type=button  value=top onclick=move_top()>
</body>
</html>