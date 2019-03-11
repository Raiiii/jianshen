<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id= request.getParameter("id");
	String equipmentName=request.getParameter("w_equipmentName");
	String count2=request.getParameter("w_count");
	String param=request.getParameter("param");
	
		
	Equipment w=new Equipment();
	if(param==null)
	{
		w.setEquipmentName(equipmentName);
		w.setCount(Integer.parseInt(count2));
	}
	int count=0;
	int wid=0;
	if(id==null||id.equals("null"))
		count=wid = new EquipmentServer().Add(w);
	else if(param==null)
	{
		w.setId(Integer.parseInt(id));
		wid=Integer.parseInt(id);
		count=new EquipmentServer().Edit(w);
	}
	else if(param.equals("del"))
		count=new EquipmentServer().Del(Integer.parseInt(id));
	if(count==0)
		out.print("<script>alert('操作失败');location.replace('../addequipment.jsp');</script>");
	else
		out.print("<script>alert('操作成功');location.replace('../equipment.jsp');</script>");
%>