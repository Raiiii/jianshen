<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>编辑</title>
	<%
		int id=0;
		Client c=new Client();
		if(request.getParameter("cid")!=null)
		{
			id=Integer.parseInt(request.getParameter("cid"));
		    c=new ClientServer().GetByID(id);
		}
	%>
  </head>
  
  <body>
  	<form method="post" action="Ref/money.jsp?id=<%=id %>">
  	<%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" style="width:1000px; margin:0px auto">
        <tr>
            <td style="width:186px; background:url(images/leftbg.jpg)"><%@ include file="left.jsp"%></td>
            <td style="width:10px">&nbsp;</td>
            <td style="width:804px">
  		
  		
  		<table cellpadding="0" cellspacing="0" id="addtable"> 
	  	<tr>
	  		<td class="left">姓名：</td>
	  		<td class="right"><%=c.getName() %></td>
	  	</tr>
	  	<tr>
	  		<td class="left">年龄：</td>
	  		<td class="right"><%=c.getAge() %></td>
	  	</tr>
	  	<tr>
	  		<td class="left">电话：</td>
	  		<td class="right"><%=c.getTel() %></td>
	  	</tr>
	  	<tr>
	  		<td class="left">冲值金额：</td>
	  		<td class="right"><input type="text" name="money" value="100" /></td>
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
