<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id= request.getParameter("id");
	double money=Double.parseDouble(request.getParameter("money"));
	//Client c=new ClientServer().GetByID(Integer.parseInt(id));
	//if(c.getMoney()<money)
	//{
	//	out.print("<script>alert('操作失败');location.replace('../addclient.jsp');</script>");
	//}
	if(id.equals("0"))
		id=request.getParameter("vip");
	int count=new ClientServer().EditMoney(Integer.parseInt(id),money,"+");
	if(count==0)
		out.print("<script>alert('充值失败');location.replace('../client.jsp');</script>");
	else
		out.print("<script>alert('充值成功');location.replace('../client.jsp');</script>");
	
%>
