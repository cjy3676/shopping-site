<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "com.oreilly.servlet.MultipartRequest"%>
<%@ page import= "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>    
<%@ page import="java.sql.*"%>
<%@ page import="shopping_site.jdbc.Connect"%>
<%
    /* cos.jar 업로드시 MultipartRequest의 객체를 이용하여
    pro_input.jsp에 입력된 값을 가져와야 된다  */
    Connection conn=Connect.connection2();
    request.setCharacterEncoding("UTF-8");
    
    // MultipartRequest 객체 생성, 생성자에 들어갈 매개변수
    /* request, 경로, 파일의 크기, "UTF-8", new DafaultFileRenamePolicy() */ 
    String path = "C:/Users/alfo1-5/eclipse-workspace2/shopping_site/WebContent/product/img";
    int max = 1024*1024*10;
    MultipartRequest multi = new MultipartRequest(request, path, max, "UTF-8", new DefaultFileRenamePolicy());
    
    // request되는 값 가져오기 
    // 상품코드
    String pcode = multi.getParameter("pcode");
    // 현재 product테이블에서 가장 높은 id값을 가져오기 => +1 후 4자리만든다.
    String sql = "select max(id) as num from product";		
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    String code = rs.getInt("num")+1+"";
    if(code.length() == 1)
    	code = "000"+code;
    else if(code.length() == 2)
    	code = "00"+code;
    else if(code.length() == 3)
    	code = "0"+code;
    
    // 완성된 상품 코드
    
    // 상품이름, 가격, 세탁정보
    String pname = multi.getParameter("pname");
    String price = multi.getParameter("pname");
    String pwash = multi.getParameter("pwash");
    
    // 생산일자
    String yy = multi.getParameter("yy");
    String mm = multi.getParameter("mm");
    String dd = multi.getParameter("dd");
    String proday = yy+"-"+mm+"-"+dd;
    
    // 입고수량
    String pinput = multi.getParameter("pinput");
    
    // 이미지 3개
    String plist = multi.getFilesystemName("plist");
    String pmain = multi.getFilesystemName("pmain");
    String pdt_img = multi.getFilesystemName("pdt_img");
    
    sql = "insert into product(pcode, pname, price, pcoord, pwash, proday";
    sql = sql + ", pwriteday, pinput, poutput, plist, pmain, pdt_img)";
    sql = sql + " values(?,?,?,?,?,?,now(),?,?,?,?,?)";
    
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, pcode);
    pstmt.setString(2, pname);
    pstmt.setString(3, price);
    pstmt.setString(4, "");
    pstmt.setString(5, pwash);
    pstmt.setString(6, proday);
    pstmt.setString(7, pinput);
    pstmt.setString(8, "0");
    pstmt.setString(9, plist);
    pstmt.setString(10, pmain);
    pstmt.setString(11, pdt_img);
%>