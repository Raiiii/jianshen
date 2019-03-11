<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id= request.getParameter("id");
	String name=request.getParameter("name");
	String age=request.getParameter("age");
	String sex=request.getParameter("sex");
	String tel=request.getParameter("tel");
	String address=request.getParameter("address");
	String mail=request.getParameter("mail");
	String param=request.getParameter("param");
	String cardID=request.getParameter("cardID");
	
	Client c=new Client();
	if(param==null)
	{
		c.setName(name);
		c.setAge(Integer.parseInt(age));
		c.setSex(sex);
		c.setTel(tel);
		c.setAddress(address);
		c.setMail(mail);
		c.setCardID(cardID);
	}
	int count=0;
	if(param==null&&id.equals("null"))
		count = new ClientServer().Add(c);
	else if(param==null)
	{
		c.setId(Integer.parseInt(id));
		count = new ClientServer().Edit(c);
	}
	else
		count=new ClientServer().Del(Integer.parseInt(id));
	if(count==0)
		out.print("<script>alert('操作失败');location.replace('../addclient.jsp');</script>");
	else
		out.print("<script>alert('操作成功');location.replace('../client.jsp');</script>");
	
%>
