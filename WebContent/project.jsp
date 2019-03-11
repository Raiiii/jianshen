<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<Project> bm=new ProjectServer().GetAll();
request.setAttribute("bm", bm);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>项目管理</title>
    <style>
    a,a:visited{ color:lightslategray; text-decoration:none}
	#sqltable {border-collapse: collapse; width:100%;border: 1px solid #02407B;border-collapse:collapse;}
	#sqltable td {border: 1px solid #02407B; font-size: 12px; padding: 2px; height:30px; text-align:center}
	.title td {text-align: center; background: #319FEA; height:30px; border:solid 1px lightslategray; border-collapse:collapse; }
	.rows:hover{ background:#EAF4FD}
</style>
  </head>
  
  <body>
  	<%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" style="width:1000px; margin:0px auto">
        <tr>
            <td style="width:186px; background:url(images/leftbg.jpg)"><%@ include file="left.jsp"%></td>
            <td style="width:10px">&nbsp;</td>
            <td style="width:804px">
  		
  		
  		<table id="sqltable">
		<tr class="title">
			<td>编号</td>
			<td>项目名称</td>
			<td>价格</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${ bm }" var="b">
		
			<tr class="rows">
				<td>${ b.id }</td>
				<td>${ b.type }</td>
				<td>${ b.price }元/时</td>
				<td>
					<a href='pay.jsp?pid=${ b.id }'>使用记录</a>
					<a href='addproject.jsp?param=edit&&id=${ b.id }'>编辑</a>
					<a href='Ref/project.jsp?param=del&&id=${ b.id }'>删除</a>
				</td>
			</tr>
		</c:forEach>
	</table>
  		
  		
  		
  		</td>
  	</tr>
  	</table>
  	
    
  </body>
</html>
