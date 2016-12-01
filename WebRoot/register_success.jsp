<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String register_username = (String)session.getAttribute("registerName");


%>

<html>
  <head> 
    <title>注册成功</title>
	<link type="text/css" href="css/login2.css" rel="stylesheet" />
	<link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html" rel="stylesheet" />	
	<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="js/easyTooltip.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
  </head>
  <body>
    <div id="container">
    	<div class="logo">
    		<a href="#"><img src="assets/logo.png" alt="" /></a>
    	</div>
    	<div id="box">
    		亲爱的<font color="red"><%= session.getAttribute("registerName") %></font>，欢迎注册挂号系统！
    			<br>
    				<br>
    		<a href="index.jsp">返回登陆</a>
    	</div>
    </div>
  </body>
</html>
  

 


