<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="shopping_site.jdbc.Connect" %> 
<%
   // dB연결
    Connection conn=Connect.connection2();
    Statement stmt=conn.createStatement();
   // request받기
    request.setCharacterEncoding("UTF-8");
    String bname=request.getParameter("oname");
    String name=request.getParameter("name");
    String zip=request.getParameter("zip");
    String juso1=request.getParameter("addr1");
    String juso2=request.getParameter("addr2");
    String phone=request.getParameter("p1")+"-"+request.getParameter("p2")+"-"+request.getParameter("p3");
    String hphone=request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
    String userid=session.getAttribute("userid").toString();
    String gibon; /* 변수 정리 */
    String sql;
    if(request.getParameter("gibon")==null) /* 변수 정리 */
    	gibon="0";
    else  // 기존에 있는 주소의 gibon field의 값을 0으로 변경
    {
    	sql="update baesong set gibon=0 where userid='"+userid+"'"; /* 변수 정리 */
    	stmt.executeUpdate(sql);
    	gibon=request.getParameter("gibon"); /* 변수 정리 */
    }
    
   // 쿼리 작성
    sql="insert into baesong(oname, name, zip, addr1, addr2,"; /* 변수 정리 */
    sql=sql+"phone, hphone, gibon, userid, writeday) "; /* 변수 정리 */
    sql=sql+"values(?,?,?,?,?,?,?,?,?,now())";
    PreparedStatement pstmt=conn.prepareStatement(sql);
    pstmt.setString(1,bname); /* 변수 정리 */
    pstmt.setString(2,name);
    pstmt.setString(3,zip);
    pstmt.setString(4,juso1); /* 변수 정리 */
    pstmt.setString(5,juso2); /* 변수 정리 */
    pstmt.setString(6,phone);
    pstmt.setString(7,hphone);
    pstmt.setString(8,gibon); /* 변수 정리 */
    pstmt.setString(9,userid); 
   // 쿼리실행
    pstmt.executeUpdate();
   // bae_list.jsp 로 이동
   pstmt.close();
   stmt.close();
   conn.close();
   response.sendRedirect("bae_view.jsp"); /* 변수 정리 */
%> 
<%
   conn.close();
%>









