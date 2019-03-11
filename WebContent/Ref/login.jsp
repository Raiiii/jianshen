<%@ page language="java" import="Dal.*,Mod.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String loginname=request.getParameter("login");
	String type=request.getParameter("type");
	String PWD= request.getParameter("pwd");
	if("1".equals(type)){
		Client a=new AdminServer().LoginClient(loginname);
		if(a==null)
	out.print("<script>alert('没有该用户');location.replace('../login.jsp');</script>");
		else if(!a.getPass().equals(PWD))
	out.print("<script>alert('您输入的密码有误');location.replace('../login.jsp');</script>");
		else
		{
	session.setAttribute("admin",a);
	session.setAttribute("type",1);
	out.print("<script>location.replace('../equipment_lend.jsp?type');</script>");
		}
	}else{
		Admin a=new AdminServer().Login(loginname);
		if(a==null)
	out.print("<script>alert('没有该用户');location.replace('../login.jsp');</script>");
		else if(!a.getPass().equals(PWD))
	out.print("<script>alert('您输入的密码有误');location.replace('../login.jsp');</script>");
		else
		{
	session.setAttribute("admin",a);
	session.setAttribute("type",2);
	out.print("<script>location.replace('../client.jsp');</script>");
		}
	}
	
	
%>
