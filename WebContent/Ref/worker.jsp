<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id= request.getParameter("id");
	String login=request.getParameter("w_login");
	String name=request.getParameter("w_name");
	String age=request.getParameter("w_age");
	String tel=request.getParameter("w_tel");
	String address=request.getParameter("w_address");
	String mid=request.getParameter("w_mid");
	String money=request.getParameter("w_money");
	String param=request.getParameter("param");
	
		
	Worker w=new Worker();
	if(param==null)
	{
		w.setLogin(login.toString());
		w.setName(name);
		w.setAge(Integer.parseInt(age));
		w.setTel(tel);
		w.setAddress(address);
		w.setMid(mid);
		w.setMoney(Double.parseDouble(money));
	}
	int count=0;
	int wid=0;
	if(id==null||id.equals("null"))
		count=wid = new WorkerServer().Add(w);
	else if(param==null)
	{
		w.setId(Integer.parseInt(id));
		wid=Integer.parseInt(id);
		count=new WorkerServer().Edit(w);
	}
	else if(param.equals("del"))
		count=new WorkerServer().Del(Integer.parseInt(id));
	if(count==0)
		out.print("<script>alert('操作失败');location.replace('../addworker.jsp');</script>");
	else
		out.print("<script>alert('操作成功');location.replace('../worker.jsp');</script>");
%>