<!--
    @钧娃
    11月14日
    windows10
-->
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head> 
    <title>System login</title>
	<link type="text/css" href="css/login2.css" rel="stylesheet" />
	<link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html" rel="stylesheet" />	
	<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="js/easyTooltip.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
  </head>
  
  <body>
    <div id="container">
    	<div class="logo">
    		<a href="#">
    			<img src="assets/logo.png" alt="" />
    		</a>
    	</div>
    	<div id="box">
    		对不起，密码错误，请重新登录！
    		<br>
    			<br>
    		<a href="index.jsp">返回登陆</a>
    	</div>
    </div>
  </body>
</html>
