<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html>       
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../etc/main.css">
<script src="../etc/main.js"></script>
</head>
<body>
  <jsp:include page="../left.jsp" flush="false" />
  <div id=right>
    <section class=deli_view_section> 
      <jsp:include page="../product/addr_list.jsp" flush="false">
        <jsp:param name="bb" value="1"/> 
        <!-- param태그는 include되는 addr_list.jsp에 bb라는 이름의 변수를 보내는것 -->
      </jsp:include>
    </section>
    <jsp:include page="../footer.jsp" flush="false" />
  </div>  
</body>
</html>

 








