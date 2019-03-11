<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>器材信息</title>
    <style>
		#addtable {border-collapse: collapse; width:100%;border: 1px solid #02407B;border-collapse:collapse;}
		#addtable td {border: 1px solid #02407B; font-size: 12px; height:30px;}
		.left{ background:#319FEA; width:100px;text-align:center }
		.right{ text-align:left }
		.right input,.right select{ margin:10px}
	</style>
	<%
		int id=0;
		Equipment w=new Equipment();
		if(request.getParameter("id")!=null)
		{
			id=Integer.parseInt(request.getParameter("id"));
		    w=new EquipmentServer().GetByID(id);
		}
	 %>
  </head>
  
  <body>
  	<form method="post" action="Ref/equipment.jsp?id=<%=request.getParameter("id") %>" name="myform">
  	<%@ include file="top.jsp"%>
  	
  	<table cellpadding="0" cellspacing="0" style="width:1000px; margin:0px auto">
        <tr>
            <td style="width:186px; background:url(images/leftbg.jpg)"><%@ include file="left.jsp"%></td>
            <td style="width:10px">&nbsp;</td>
            <td style="width:804px">
  		
  		
  		<table cellpadding="0" cellspacing="0" id="addtable"> 
  		
	  	<tr>
	  		<td class="left">器材名称：</td>
	  		<td class="right"><input type="text" name="w_equipmentName" value="<%=w.getEquipmentName()%>" /></td>
	  	</tr>
	  	
	  	<tr>
	  		<td class="left">器材数量：</td>
	  		<td class="right"><input type="text" name="w_count" value="<%=w.getCount() %>" /></td>
	  	</tr>
	  	
	  	<tr>
	  		<td class="left">&nbsp;</td>
	  		<td class="right"><input type="submit" value="提交"/></td>
	  	</tr>
	  	</table>
  		
  		
  		
  		</td>
  	</tr>
  	</table>
	</form>
  </body>
</html>
