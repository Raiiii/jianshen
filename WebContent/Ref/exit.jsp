<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("teacher")!=null)
		session.removeAttribute("teacher");
	if(session.getAttribute("admin")!=null)
		session.removeAttribute("admin");
	
	out.print("<script>location.replace('../login.jsp');</script>");
%>