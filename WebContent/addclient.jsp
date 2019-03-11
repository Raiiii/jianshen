<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>客户信息编辑</title>
	<%
		int id=0;
		Client c=new Client();
		if(request.getParameter("id")!=null)
		{
			id=Integer.parseInt(request.getParameter("id"));
		    c=new ClientServer().GetByID(id);
		}
	%>
  </head>
  
  <body>
  	<form method="post" action="Ref/client.jsp?id=<%=request.getParameter("id") %>">
  	<%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" style="width:1000px; margin:0px auto">
        <tr>
            <td style="width:186px; background:url(images/leftbg.jpg)"><%@ include file="left.jsp"%></td>
            <td style="width:10px">&nbsp;</td>
            <td style="width:804px">
  		
  		
  		<table cellpadding="0" cellspacing="0" id="addtable"> 
  		<tr>
	  		<td class="left">会员卡号：</td>
	  		<td class="right"><input type="text" name="cardID" value="<%=c.getCardID() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">姓名：</td>
	  		<td class="right"><input type="text" name="name" value="<%=c.getName() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">年龄：</td>
	  		<td class="right"><input type="text" name="age" value="<%=c.getAge() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">性别：</td>
	  		<td class="right">
				<input type="radio" checked="checked" value="男" id="nan" name="sex" />
       			<label for="nan">男</label>
       			<input type="radio"  value="女" id="nv" name="sex" />
       			<label for="nv">女</label>
			</td>
	  	</tr>
	  	<tr>
	  		<td class="left">电话：</td>
	  		<td class="right"><input type="text" name="tel" value="<%=c.getTel() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">地址：</td>
	  		<td class="right"><input type="text" name="address" value="<%=c.getAddress() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">邮箱：</td>
	  		<td class="right"><input type="text" name="mail" value="<%=c.getMail() %>" /></td>
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
