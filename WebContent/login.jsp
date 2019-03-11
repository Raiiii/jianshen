<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>后台登陆</title>
    <style>
        body{ background:#0652B0}
    </style>
    <script>
        	function clear()
        	{
        		document.myform.login.value="";
        		document.myform.pwd.value="";
        	}
    </script>
  </head>
  
  <body>
  <center>
    <form method="post" action="Ref/login.jsp" name="myform">
    <div style="margin:0px auto; background:url(images/loginbg.jpg); width:549px; height:297px; margin-top:200px; position:relative">
        <table cellpadding="0" cellspacing="0" style="width:200px; left:170px; top:115px; position:absolute ">
            <tr>
                <td style="height:40px"><input type="text" name="login" /></td>
            </tr>
            <tr>
                <td style="height:40px"><input type="password" name="pwd" /></td>
            </tr>
             <tr>
             
                <td style="height:40px"><select name="type">
                <option value="1">会员</option>
                <option value="2">管理员</option>
                </select></td>
            </tr>
            <tr>
                <td>
                    <input type="submit" style="background:url(images/login.jpg); width:88px; height:28px; border:0px" value="" />
                    <input type="button" style="background:url(images/clear.jpg); width:88px; height:28px; border:0px" value="" onclick="clear()" />
                </td>
            </tr>
        </table>
    </div>
    </form>
    </center>
  </body>
</html>
