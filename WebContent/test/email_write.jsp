<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form method=post action=email.jsp>
  받는사람 <input type=text name=remail> <p>
    제목 <input type=text name=title> <p>
    내용 <textarea cols=40 rows=4 name=content></textarea> <p>
    <input type=submit value=보내기>
  </form>
</body>
</html>