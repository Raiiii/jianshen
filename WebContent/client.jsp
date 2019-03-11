<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
if(session.getAttribute("admin")==null)
		
	out.print("<script>location.replace('login.jsp');</script>");

	int startindex=0;
 	if(request.getParameter("startindex")!=null)
 		startindex =  Integer.parseInt(request.getParameter("startindex"));
	int pagesize=15;
	int rcount=new ClientServer().GetCount("");
	
    List<Client> list_c=new ClientServer().GetAll("",startindex,pagesize);

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
			<td>姓名</td>
			<td>性别</td>
			<td>年龄</td>
			<td>电话</td>
			<td>邮箱</td>
			<td>地址</td>
			<td>余额</td>
			<td>金额操作</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${ list_c }" var="c">
		
			<tr class="rows">
				<td>${ c.id }</td>
				<td>${ c.name }</td>
				<td>${ c.sex }</td>
				<td>${ c.age }</td>
				<td>${ c.tel }</td>
				<td>${ c.mail }</td>
				<td>${ c.address }</td>
				<td>${ c.money }元</td>
				<td>
					<a href='addmoney.jsp?cid=${ c.id }'>充值</a>
					<a href='pay.jsp?cid=${ c.id }'>消费记录</a>
				</td>
				<td>
					<a href='addclient.jsp?id=${ c.id }'>编辑</a>
					<a href='Ref/client.jsp?param=del&&id=${ c.id }'>删除</a>
				</td>
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
				out.print("<a style='' href='client.jsp?startindex=0'>首页</a><a style='' href='client.jsp?startindex="+Integer.toString(startindex-1)+"'>上一页</a>");
			if(sumcount-1==startindex)//判断是否是最后一页
				out.print("<a style=''>下一页</a><a style=''>尾页</a>");
			else
				out.print("<a style='' href='client.jsp?startindex="+Integer.toString(startindex+1)+"'>下一页</a><a style='' href='client.jsp?startindex="+Integer.toString(sumcount-1)+"'>尾页</a>");
		 %>
  		</div>
  		
  		
  		</td>
        </tr>
    </table>
  	
    
  </body>
</html>
