<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
		String user1 = (String)session.getAttribute("loginUser");
		if(user1 == null){
	
			response.sendRedirect("index.jsp");
			return;
		}else{
	
		}

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>注册失败</title>
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
    		<p style="text-align: center;margin-top:100px;">
    			挂号失败！请确保两次密码一致，且用户名密码不能为空。点此重新注册
    		<br>
    			<br>
    			<button class="login" style="width:55px;height:34px;"  onclick="javascript:window.location.href='register.jsp';">
    				注册
    			</button>
    		</p>
    		
    		
    	</div>
    </div>
  </body>
</html>
