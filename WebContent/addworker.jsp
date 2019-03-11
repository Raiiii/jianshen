<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>员工信息编辑</title>
    <style>
		#addtable {border-collapse: collapse; width:100%;border: 1px solid #02407B;border-collapse:collapse;}
		#addtable td {border: 1px solid #02407B; font-size: 12px; height:30px;}
		.left{ background:#319FEA; width:100px;text-align:center }
		.right{ text-align:left }
		.right input,.right select{ margin:10px}
	</style>
	<%
		int id=0;
		Worker w=new Worker();
		if(request.getParameter("id")!=null)
		{
			id=Integer.parseInt(request.getParameter("id"));
		    w=new WorkerServer().GetByID(id);
		}
	 %>
  </head>
  
  <body>
  	<form method="post" action="Ref/worker.jsp?id=<%=request.getParameter("id") %>" name="myform">
  	<%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" style="width:1000px; margin:0px auto">
        <tr>
            <td style="width:186px; background:url(images/leftbg.jpg)"><%@ include file="left.jsp"%></td>
            <td style="width:10px">&nbsp;</td>
            <td style="width:804px">
  		
  		
  		<table cellpadding="0" cellspacing="0" id="addtable"> 
	  	<tr>
	  		<td class="left">员工号：</td>
	  		<td class="right"><input type="text" name="w_login" value="<%=w.getLogin() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">姓名：</td>
	  		<td class="right"><input type="text" name="w_name" value="<%=w.getName() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">年龄：</td>
	  		<td class="right"><input type="text" name="w_age" value="<%=w.getAge() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">电话：</td>
	  		<td class="right"><input type="text" name="w_tel" value="<%=w.getTel() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">地址：</td>
	  		<td class="right"><input type="text" name="w_address" value="<%=w.getAddress() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">证件号码：</td>
	  		<td class="right"><input type="text" name="w_mid" value="<%=w.getMid() %>" /></td>
	  	</tr>
	  	<tr style="display:none">
	  		<td class="left">基本工资：</td>
	  		<td class="right"><input type="text" name="w_money" value="<%=w.getMoney() %>" /></td>
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
