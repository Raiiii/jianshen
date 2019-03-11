<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id= request.getParameter("id");
	String param=request.getParameter("param");
	String num=request.getParameter("num");
	Client c =(Client)session.getAttribute("admin");
		
	
	if(param.equals("jie"))
		if("0".equals(num)){
			out.print("<script>alert('剩余数量不足');location.replace('../equipment.jsp');</script>");
		}else{
			new EquipmentServer().Jie(Integer.parseInt(id),c.getId());
		}
		
	else{
		new EquipmentServer().Huan(Integer.parseInt(id),c.getId());
	}
		out.print("<script>alert('操作成功');location.replace('../equipment_lend.jsp');</script>");
%>