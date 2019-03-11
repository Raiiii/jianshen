<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% Client a=(Client)session.getAttribute("admin"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'addroom.jsp' starting page</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
        <script>
    	function sub()
    	{
    		if(document.my.pwd1.value=="")
    		{
    			alert("请填写密码");
    			return false;
    		}
    		if(document.my.pwd1.value!=document.myform.pwd2.value)
    		{
    			alert("两次输入的密码不一至");
    			return false;
    		}
    	}
    </script>
     <style>
		#addtable {border-collapse: collapse; width:100%;border: 1px solid #02407B;border-collapse:collapse;}
		#addtable td {border: 1px solid #02407B; font-size: 12px; height:30px;}
		.left{ background:#319FEA; width:100px;text-align:center }
		.right{ text-align:left }
		.right input{ margin:10px}
	</style>
  </head>
  
  <body>
    <%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" style="width:1000px; margin:0px auto">
        <tr>
            <td style="width:186px; background:url(images/leftbg.jpg)"><%@ include file="left.jsp"%></td>
            <td style="width:10px">&nbsp;</td>
            <td style="width:804px">
                
                <form method="post" name="my" onsubmit="return sub()" action="Ref/win.jsp">
                   <table cellpadding="0" cellspacing="0" id="addtable"> 
				  	<tr>
				  		<td class="left">登陆名：</td>
				  		<td class="right"><%=a.getCardID() %></td>
				  	</tr>
				  	<tr>
				  		<td class="left">密码：</td>
				  		<td class="right">
							<input type="password" name="pwd1" />
						</td>
				  	</tr>
				  	<tr>
				  		<td class="left">确认密码：</td>
				  		<td class="right"><input type="password" name="pwd2" /></td>
				  	</tr>
				  	
	  	            <tr>
	  		            <td class="left">&nbsp;</td>
	  		            <td class="right"><input type="submit" value="修改"/></td>
	  	            </tr>
	  	        </table>
	  	        </form>
                </td>
  	</tr>
  	</table>
  </body>
</html>
