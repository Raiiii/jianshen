<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

	int startindex=0;
 	if(request.getParameter("startindex")!=null)
 		startindex =  Integer.parseInt(request.getParameter("startindex"));
	int pagesize=15;
	String key="";
	if(request.getParameter("cid")!=null)
		key="Client_ID="+request.getParameter("cid");
	if(request.getParameter("wid")!=null)
		key="Worker_ID="+request.getParameter("wid");
	if(request.getParameter("pid")!=null)
		key="Project_ID="+request.getParameter("pid");
	int rcount=new PayServer().GetCount(key);
	
    List<Pay> list_c=new PayServer().GetAll(key,startindex,pagesize);

	request.setAttribute("list_c", list_c);
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>会员管理</title>
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
			<td>会员卡号</td>
			<td>姓名</td>
			<td>指导教练</td>
			<td>操作项目</td>
			<td>消费金额</td>
			<td>消费时间</td>
		</tr>
		<c:forEach items="${ list_c }" var="c">
		
			<tr class="rows">
				<td>${ c.id }</td>
				<td>${ c.client.cardID }</td>
				<td>${ c.client.name }</td>
				<td>${ c.worker.name }</td>
				<td>${ c.project.type }</td>
				<td>${ c.money }元</td>
				<td>${ c.intime }</td>
			</tr>
		</c:forEach>
	</table>
  		<div style="width:100%; margin-left:24px; padding-top:30px; background:white; text-align:center" id="pagediv">
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
				out.print("<a style='' href='pay.jsp?startindex=0'>首页</a><a style='' href='pay.jsp?startindex="+Integer.toString(startindex-1)+"'>上一页</a>");
			if(sumcount-1==startindex)//判断是否是最后一页
				out.print("<a style=''>下一页</a><a style=''>尾页</a>");
			else
				out.print("<a style='' href='pay.jsp?startindex="+Integer.toString(startindex+1)+"'>下一页</a><a style='' href='pay.jsp?startindex="+Integer.toString(sumcount-1)+"'>尾页</a>");
		 %>
  		</div>
  		
  		
  		</td>
        </tr>
    </table>
  	
    
  </body>
</html>
