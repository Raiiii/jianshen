<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

	int startindex=0;
 	if(request.getParameter("startindex")!=null)
 		startindex =  Integer.parseInt(request.getParameter("startindex"));
	int pagesize=5;
	String key="";
	int rcount=new EquipmentServer().GetCount(key);
	
    List<Equipment> ws=new EquipmentServer().GetAll(startindex,pagesize,key);
	request.setAttribute("ws", ws);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>器材管理</title>
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
			<td>器材名称</td>
			<td>剩余数量</td>
			<td>已借数量</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${ ws }" var="w">
		
			<tr class="rows">
				<td>${ w.equipmentName }</td>
				<td>${ w.remainNum }</td>
				<td>${ w.lendNum }</td>
				
				<td>
					<a href='addequipment.jsp?param=edit&&id=${ w.id }'>编辑</a>
					<a href='Ref/equipment.jsp?param=del&&id=${ w.id }'>删除</a>
				</td>
			</tr>
		</c:forEach>
	</table>
		<div style="width:626px; margin-left:24px; background:white; text-align:center" id="pagediv">
		<style>
		#pagediv a,#pagediv a:visited{ color:#A51010; margin:5px; font-size:12px}
		</style>
  		<%
			int sumcount=0;
			if(rcount%pagesize==0)
				sumcount=rcount/pagesize;
			else
				sumcount=rcount/pagesize+1;
			if(startindex==0)//判断是否是第一页
				out.print("<a style=''>首页</a><a style=''>上一页</a>");
			else
				out.print("<a style='' href='worker.jsp?startindex=0'>首页</a><a style='' href='worker.jsp?startindex="+Integer.toString(startindex-1)+"'>上一页</a>");
			if(sumcount-1==startindex)//判断是否是最后一页
				out.print("<a style=''>下一页</a><a style=''>尾页</a>");
			else
				out.print("<a style='' href='worker.jsp?startindex="+Integer.toString(startindex+1)+"'>下一页</a><a style='' href='worker.jsp?startindex="+Integer.toString(sumcount-1)+"'>尾页</a>");
		 %>
  		</div>
  		
  		</td>
  	</tr>
  	</table>
  	
    
  </body>
</html>
