<!--
    @钧娃
    11月14日
    windows10
-->

<%@page import="java.util.Date.*"%>
<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String user = (String)session.getAttribute("loginUser");

if(user == null){
	response.sendRedirect("index.jsp");
	return;
}else{
	
}

%>
<html>
  <head> 
    <!-- 网页标题 -->
    <title>登陆成功</title>
    <!-- 导入库 -->
	<link type="text/css" href="css/login2.css" rel="stylesheet" />
	<link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
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
    		<%
    
    			if(application.getAttribute("time") != null){
    		
    	    %>
    				管理员：
    				<font color="red">
    					<%= session.getAttribute("loginUser") %>
    				</font>
    				您好！  今日有
    		    	<font color="red">
    					<%= (String)application.getAttribute("time") %>
    	    		</font>
    	        	位用户访问
    		<%} 
    			else{

    		%>
          			管理员：<font color="red"><%= session.getAttribute("loginUser") %></font>您好！  今日有
    				<font color="red">
    				0
    	    		</font>
    	        	位用户访问
    		<%}%>
    	</div>
    
    	<br>
    		<br>
    			<br>
    				<br>
         <p style="margin-left:150px;">查看所有挂号记录：</p>
         <center>
         		<button class="login"  onclick="javascript:window.location.href='admin_printTable.jsp';">
         				查询
         		</button>
         </center>
         <p style="margin-left:150px;">查看科室挂号情况</p>
         <center>
         		<button class="login"  onclick="javascript:window.location.href='admin_room.jsp';">
         				查询
         		</button>
         </center>
         <p style="margin-left:150px;">查看医生挂号情况</p>
         <center>
         		<button class="login"  onclick="javascript:window.location.href='admin_doctor.jsp';">
         				查询
         		</button>
         </center>
		 <br>
		     <br>
		 <p class="space">
    		<input type="submit" value="退出登陆" class="login" onclick="location='index.jsp'" style="cursor: pointer;">
    	 </p>
    </div>  
  </body>
</html>
