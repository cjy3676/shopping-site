<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shopping_site.Util.NaverMail2" %>
<%
  request.setCharacterEncoding("utf-8");
  String remail =request.getParameter("remail");// 받는 사람 이메일, 받는 사람 이메일은 naver가 아니여도 상관없다.
  String title=request.getParameter("title");
  String content=request.getParameter("content");
  NaverMail2 mailPro = NaverMail2.getInstance();
  int state = mailPro.setEmail(remail,title,content);
%>
   

 