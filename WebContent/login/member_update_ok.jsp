<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<%@ page import="shopping_site.jdbc.Connect"%>    
<%@ page import="shopping_site.Dto.Dto"%>    
<%  
    Connection conn = Connect.connection2();
%>
    <!-- useBean 사용해서 dto에 값입력 -->
    <jsp:useBean id="dto" class="shopping_site.Dto.Dto">
    <jsp:setProperty name="dto" property="*"/>
    </jsp:useBean>
    
    <!-- update 쿼리문을 사용해서 수정 -->
    <%
    String sql = "update member set pwd=?, pwd_qu=?, pwd_an=?, name=?, zip=?";
    sql = sql + ", addr1=?, addr2=?, phone=?, hphone=?, chk3=?, email=?";
    sql = sql + ", chk4=?, gender=?, birth=?";
    sql = sql + " where userid='"+session.getAttribute("userid")+"'";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, dto.getPwd());
    pstmt.setInt(2, dto.getPwd_qu());
    pstmt.setString(3, dto.getPwd_an());
    pstmt.setString(4, dto.getName());
    pstmt.setString(5, dto.getZip());
    pstmt.setString(6, dto.getAddr1());
    pstmt.setString(7, dto.getAddr2());
    pstmt.setString(8, dto.getPhone());
    pstmt.setString(9, dto.getHphone());
    pstmt.setInt(10, dto.getChk3());
    pstmt.setString(11, dto.getEmail());
    pstmt.setInt(12, dto.getChk4());
    pstmt.setInt(13, dto.getGender());
    pstmt.setString(14, dto.getBirth());
    pstmt.executeUpdate();
    
    response.sendRedirect("member_update.jsp");
    %>
    