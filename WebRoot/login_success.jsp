<!--
    @钧娃
    11月14日
    windows10
-->

<%@page import="java.util.Date.*"%>
<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>


<%!   
		int times;
	    String time = "";
%>
<%
		String user1 = (String)session.getAttribute("loginUser");
		if(user1 == null){
			response.sendRedirect("index.jsp");
			return;
		}else{
	
		}

%>
<%!  
		Connection conn = null;// 创建一个数据库连接
		ResultSet re1 = null;// 创建一个结果集对象  
		PreparedStatement st1 = null;
		ResultSet re2 = null;// 创建一个结果集对象  
		Statement st2 = null;
%>
<% 




    	try { 
  			Class.forName("com.mysql.jdbc.Driver");// 加载Mysql驱动程序 
  			String url = "jdbc:mysql://127.0.0.1:3306/junwa";// 127.0.0.1是本机地址
  			String user = "root";
  			String pwd = "1012";
  
  			conn = DriverManager.getConnection(url, user, pwd);// 获取连接 
  			System.out.println("连接数据库成功");

  			String sql1 = "select * from emp " ;
  			st1 = conn.prepareStatement(sql1);
  			re1 = st1.executeQuery();
  			if(re1.next()){
	  			times = re1.getInt("time");
	  			System.out.println(times);
  			}
 
  			application.setAttribute("time", String.valueOf(++times));
  			time = (String)application.getAttribute("time");
  
 
  			st2 = conn.createStatement(); 
  			re2 = st2.executeQuery("SELECT * FROM emp ");
  			String insertSQL = "update emp set time = '"+time+"' ";
  			st2.executeUpdate(insertSQL);
   
 			} 

 			catch (Exception e){ 
  				e.printStackTrace(); 
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
    	<font color="red">
    		<%= session.getAttribute("loginUser") %>
    	</font>
    	 欢迎来到挂号系统！您是第
    	<font color="red">
    		<%= (String)application.getAttribute("time") %>
    	</font>
    	位访问的用户
    </div>
    <p class="space">
    	<input type="submit" value="退出登陆" class="login" onclick="location='index.jsp'" style="cursor: pointer;">
    </p>
    <br>
    	<br>
    		<br>
    			<br>
    <div id="box">
         <p>查看我的挂号记录：</p>
         <center>
         	<button class="login"  onclick="javascript:window.location.href='printTable.jsp';">
         		查询
         	</button>
         </center>
         <p>还没有挂号？点此开始挂号！</p>
         <center>
         	<button class="login"  onclick="javascript:window.location.href='guahao.jsp';">
         		挂号
         	</button>
         </center>
    	 
    </div>
    </div> 
    
  </body>
  	<%
  	 	if(re1!=null){
		 	re1.close();
	 	}
	 	if(st1!=null){
			st1.close();
	 	}
	 	if(re2!=null){
		 	re2.close();
	 	}
	 	if(st2!=null){
		 	st2.close();
	 	}
	 	if(conn!=null){
		 	conn.close();
	 	} 
 	 %>
    
</html>
