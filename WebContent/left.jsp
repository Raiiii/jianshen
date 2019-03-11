<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
        
%>
    <div class="lefttop"><b>功能菜单</b></div>
	    <ul class="menuul">
	    
	    	<c:if test="${type==2 }">
		    	 <li><a href="addproject.jsp">添加项目</a></li>
		    	 <li><a href="client.jsp">会员卡管理</a></li>
		    	 	<li><a href="chongzhi.jsp">会员冲值</a></li>
		    	 <li><a href="addclient.jsp">办理会员卡</a></li>
		    	  <li><a href="pay.jsp">消费记录</a></li>
		    	 <li><a href="project.jsp">项目管理</a></li>
		    	  <li><a href="addequipment.jsp">添加器材</a></li>
		        <li><a href="equipment.jsp">器材管理</a></li>
		         <li><a href="addworker.jsp">添加教练</a></li>
		        <li><a href="worker.jsp">教练管理</a></li>
		         <li><a href="pwd.jsp">修改密码</a></li>
	    	 </c:if>
	       <c:if test="${type==1}">
	       
	    	<li><a href="addpay.jsp">会员消费</a></li>
	        <li><a href="client_pay.jsp">消费记录</a></li>
	        <li><a href="equipment_lend.jsp?">器材借还</a></li>
	         <li><a href="client_pwd.jsp">修改密码</a></li>
	       </c:if>
	       
	        <li><a href="Ref/exit.jsp">退出系统</a></li>
	    </ul>
    <div class="leftbtm">&nbsp;</div>
