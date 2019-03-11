<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>编辑</title>
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
  	<form method="post" action="Ref/pay.jsp" name="myform">
  	<%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" style="width:1000px; margin:0px auto">
        <tr>
            <td style="width:186px; background:url(images/leftbg.jpg)"><%@ include file="left.jsp"%></td>
            <td style="width:10px">&nbsp;</td>
            <td style="width:804px">
  		
  		
  		<table cellpadding="0" cellspacing="0" id="addtable"> 
	  	<tr>
	  		<td class="left">消费会员：</td>
	  		<td class="right">
				<%
					List<Client> cs=new ClientServer().GetAll("",0,20);
					request.setAttribute("cs", cs);
				%>
				 <input name="vip" readonly  value="${admin.name } "/>
					
				
			</td>
	  	</tr>
	  	<tr>
	  		<td class="left">指导教练：</td>
	  		<td class="right">
				<%
					List<Worker> ws=new WorkerServer().GetAll(0,20,"");
					request.setAttribute("ws", ws);
				%>
				 <select name="worker">
					<c:forEach items="${ ws }" var="b">
					<option value="${b.id}">
					${b.name}
					</option>
					</c:forEach>
				</select>
			</td>
	  	</tr>
	  	<tr>
	  		<td class="left">使用项目：</td>
	  		<td class="right">
				<%
					List<Project> bm=new ProjectServer().GetAll();
					request.setAttribute("bm", bm);
				%>
				 <select name="project">
					<c:forEach items="${ bm }" var="b">
					<option value="${b.id}">
					${b.type}
					</option>
					</c:forEach>
				</select>
			</td>
	  	</tr>
	  	<tr >
	  		<td class="left">使用时长：</td>
	  		<td class="right"><input type="text" name="hour" value="1" style="width:40px" />时</td>
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
