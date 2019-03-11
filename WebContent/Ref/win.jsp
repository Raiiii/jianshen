<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="utf-8"%>
<%@ page import="java.text.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	
Client a=(Client)session.getAttribute("admin");
		String pass=request.getParameter("pwd1");
		int count=new ClientServer().EditPass(a.getId(),pass);
		if(count==0)
			out.print("<script>alert('修改失败');location.replace('../client_pwd.jsp');</script>");
		else
			out.print("<script>alert('修改成功');location.replace('../client_pwd.jsp');</script>");
	
%>