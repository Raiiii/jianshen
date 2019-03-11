<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>类型管理</title>
    <style>
		#addtable {border-collapse: collapse; width:100%;border: 1px solid #02407B;border-collapse:collapse;}
		#addtable td {border: 1px solid #02407B; font-size: 12px; height:30px;}
		.left{ background:#319FEA; width:100px;text-align:center }
		.right{ text-align:left }
		.right input{ margin:10px}
	</style>
	<%
		int id=0;
		Project b=new Project();
		if(request.getParameter("id")!=null)
		{
			id=Integer.parseInt(request.getParameter("id"));
		    b=new ProjectServer().GetByID(id);
		}
	%>
  </head>
  
  <body>
  	<form method="post" action="Ref/project.jsp?id=<%=id %>">
  	<%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" style="width:1000px; margin:0px auto">
        <tr>
            <td style="width:186px; background:url(images/leftbg.jpg)"><%@ include file="left.jsp"%></td>
            <td style="width:10px">&nbsp;</td>
            <td style="width:804px">
  		
  		
  		<table cellpadding="0" cellspacing="0" id="addtable"> 
	  	<tr>
	  		<td class="left">项目名称：</td>
	  		<td class="right"><input type="text" name="bm_name" value="<%=b.getType() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">项目单价：</td>
	  		<td class="right"><input type="text" name="price" style="width:40px" value="0" />元/时</td>
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
