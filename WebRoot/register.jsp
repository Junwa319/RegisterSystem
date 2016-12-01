<!--
    @钧娃
    11月15日
    windows10
-->
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head> 
    <title>Register</title>
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
    		<form action="doRegister.jsp" method="post">
    			<p class="main">
    			    <ul>
    			  		<li>
    						<label>请输入用户名:</label>&nbsp;&nbsp;
    						<input name="username_register" value="" />
    					</li>
    						<br>
    							<br>
    					<li>
    						<label>请输入密码:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						<input type="password" name="password_register" value="" />
    					</li>
    						<br>
    							<br>
    					<li>
                    		<label>请确认您的密码:</label>
                    		<input type="password" name="password_repeat" value="" />
                    	</li>
                    </ul>
    			</p>
    			<p class="space">
    				<input type="submit" value="提交" class="login" style="cursor: pointer;">
    			</p>
    		</form>
    	</div>
    </div>
  </body>
</html>
