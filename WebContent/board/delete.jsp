<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="shopping_site.Dto.Board_Dto"%>
<%@ page import="shopping_site.Command.DeleteCommand"%>   
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	DeleteCommand deleteCommand = new DeleteCommand();
	deleteCommand.delete(id);
	response.sendRedirect("list.jsp");
%>