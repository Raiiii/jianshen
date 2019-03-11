<%@ page language="java" import="java.util.*,Dal.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("bm_name");
	
	String id= request.getParameter("id");
	String param=request.getParameter("param");
	int count=0;
	if(id.equals("0")){
		double price=Double.parseDouble(request.getParameter("price"));
		count = new ProjectServer().Add(name,price);
	}
	else if(param==null){
		double price=Double.parseDouble(request.getParameter("price"));
		count=new ProjectServer().Edit(name,price,Integer.parseInt(id));
	}else if(param.equals("del"))
		count=new ProjectServer().Del(Integer.parseInt(id));
	if(count==0)
		out.print("<script>alert('操作失败');location.replace('../addproject.jsp');</script>");
	else
		out.print("<script>alert('操作成功');location.replace('../project.jsp');</script>");
%>
