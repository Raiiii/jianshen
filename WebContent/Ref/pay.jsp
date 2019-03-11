<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int project= Integer.parseInt(request.getParameter("project"));
	int client= Integer.parseInt(request.getParameter("vip"));
	int worker= Integer.parseInt(request.getParameter("worker"));
	double hour=Double.parseDouble(request.getParameter("hour"));
	Client c=new ClientServer().GetByID(client);
	Project p=new ProjectServer().GetByID(project);
	if(c.getMoney()<p.getPrice()*hour)
	{
		out.print("<script>alert('余额不足');location.replace('../addpay.jsp');</script>");
		return;
	}
	int count=new ClientServer().EditMoney(client,p.getPrice()*hour,"-");
	if(count==0)
		out.print("<script>alert('消费失败');location.replace('../pay.jsp');</script>");
	else
	{
		new PayServer().Add(project,worker,client,p.getPrice()*hour);
		out.print("<script>alert('消费成功');location.replace('../pay.jsp');</script>");
	}
	
%>
