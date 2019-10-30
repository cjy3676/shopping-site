<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shopping_site.Util.NaverMail" %>
<%
  String remail ="goalki@naver.com";// 받는 사람 이메일, 받는 사람 이메일은 naver가 아니여도 상관없다.
  NaverMail mailPro = NaverMail.getInstance();
  int state = mailPro.setEmail(remail);
%>
   

 