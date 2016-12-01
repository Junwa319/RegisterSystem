<!--
    @钧娃
    11月19日
    windows10
-->

<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>

<%
String user1 = (String)session.getAttribute("loginUser");
if(user1 == null){
	
	response.sendRedirect("index.jsp");
	return;
}else{
	
}

%>
<%!
        private static final String URL="jdbc:mysql://127.0.0.1:3306/junwa";
        private static final String USER="root";
        private static final String PASSWORD="1012";
        public String loginUser = "";
        Connection conn = null;
        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;
        PreparedStatement stmt3 = null;
        PreparedStatement stmt4 = null;
        PreparedStatement stmt5 = null;
        ResultSet res1 = null;
        ResultSet res2 = null;
        ResultSet res3 = null;
        ResultSet res4 = null;
        ResultSet res5 = null;
    
    
%>

<%      
        String sql1 = "select * from guahao  where room = ' 儿科'" ;
		String sql2 = "select * from guahao  where room = ' 外科'" ;
		String sql3 = "select * from guahao  where room = ' 内科'" ;
		String sql4 = "select * from guahao  where room = ' 牙科'" ;
		String sql5 = "select * from guahao  where room = ' 精神科'" ;
		
		Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(URL, USER, PASSWORD);
        
        stmt1 = conn.prepareStatement(sql1);
        stmt2 = conn.prepareStatement(sql2);
        stmt3 = conn.prepareStatement(sql3);
        stmt4 = conn.prepareStatement(sql4);
        stmt5 = conn.prepareStatement(sql5);
        
        res1 = stmt1.executeQuery();
        res2 = stmt2.executeQuery();
        res3 = stmt3.executeQuery();
        res4 = stmt4.executeQuery();
        res5 = stmt5.executeQuery();
       
        
        
%>

<html>
  <head> 
    <title>管理员系统</title>
    <link type="text/css" href="css/login2.css" rel="stylesheet" />
    <link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html" rel="stylesheet" /> 
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/easyTooltip.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
    <script type="text/javascript">
 $(function() {
        /* For zebra striping */
        $("table tr:nth-child(odd)").addClass("odd-row");
        /* For cell text alignment */
        $("table td:first-child, table th:first-child").addClass("first");
        /* For removing the last border */
        $("table td:last-child, table th:last-child").addClass("last");
});
</script>
  <style type="text/css">
    #content {width:65%; max-width:690px; margin:6% auto 0;}
    table {
        overflow:hidden;
        border:1px solid #d3d3d3;
        background:#fefefe;
        width:70%;
        margin:5% auto 0;
        -moz-border-radius:5px; /* FF1+ */
        -webkit-border-radius:5px; /* Saf3-4 */
        border-radius:5px;
        -moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
        -webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
    }
    th, td {padding:18px 28px 18px; text-align:center; }
    
    th {padding-top:22px; text-shadow: 1px 1px 1px #fff; background:#e8eaeb;}
    
    td {border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0;}
    
    tr.odd-row td {background:#f6f6f6;}
    
    td.first, th.first {text-align:left}
    
    td.last {border-right:none;}
    
    /*
    Background gradients are completely unnecessary but a neat effect.
    */
    
    td,caption {
        background: -moz-linear-gradient(100% 25% 90deg, #fefefe, #f9f9f9);
        background: -webkit-gradient(linear, 0% 0%, 0% 25%, from(#f9f9f9), to(#fefefe));
    }
    
    tr.odd-row td,caption {
        background: -moz-linear-gradient(100% 25% 90deg, #f6f6f6, #f1f1f1);
        background: -webkit-gradient(linear, 0% 0%, 0% 25%, from(#f1f1f1), to(#f6f6f6));
    }
    
    th {
        background: -moz-linear-gradient(100% 20% 90deg, #e8eaeb, #ededed);
        background: -webkit-gradient(linear, 0% 0%, 0% 20%, from(#ededed), to(#e8eaeb));
    }
    
    
    
    tr:first-child th.first {
        -moz-border-radius-topleft:5px;
        -webkit-border-top-left-radius:5px; /* Saf3-4 */
    }
    
    tr:first-child th.last {
        -moz-border-radius-topright:5px;
        -webkit-border-top-right-radius:5px; /* Saf3-4 */
    }
    
    tr:last-child td.first {
        -moz-border-radius-bottomleft:5px;
        -webkit-border-bottom-left-radius:5px; /* Saf3-4 */
    }
    
    tr:last-child td.last {
        -moz-border-radius-bottomright:5px;
        -webkit-border-bottom-right-radius:5px; /* Saf3-4 */
    }

    </style>
  </head>
  <body>
    <div id="container">
        <div class="logo">
            <a href="#"><img src="assets/logo.png" alt="" /></a>
        </div>
        
    <div id="content">

    <table>
    	<center>
    		<b>儿科的挂号情况</b>
    	</center>
    	<%
        	while(res1.next()){
        		%>
     				<tr>
        		        <td><%= res1.getString("id")%></td>
        				<td><%= res1.getString("user_name")%></td>
        				<td><%= res1.getString("sex")%></td>
        				<td><%= res1.getString("age")%></td>
        				<td><%= res1.getString("room")%></td>
        				<td><%= res1.getString("doctor")%></td>
        				<td><%= res1.getString("date")%></td>
        				<td><%= res1.getString("time")%></td>
        				
        		    </tr>
                <%}%>
        	
    

    
    	</table>
    		<br>
    			<br>
    	<table>
 			<center>
 				<b>外科的挂号情况</b>
 			</center>
    		<%
        		while(res2.next()){
        		%>
     
        			<tr>
        		        <td><%= res2.getString("id")%></td>
        				<td><%= res2.getString("user_name")%></td>
        				<td><%= res2.getString("sex")%></td>
        				<td><%= res2.getString("age")%></td>
        				<td><%= res2.getString("room")%></td>
        				<td><%= res2.getString("doctor")%></td>
        				<td><%= res2.getString("date")%></td>
        				<td><%= res2.getString("time")%></td>
        				
        			</tr>
            	<%}%>
        	
    

    
    	</table>
        	<br>
        		<br>
    	<table>
 			<center>
 				<b>内科的挂号情况</b>
 			</center>
    		<%
        		while(res3.next()){
        		%>
     
        			<tr>
        		        <td><%= res3.getString("id")%></td>
        				<td><%= res3.getString("user_name")%></td>
        				<td><%= res3.getString("sex")%></td>
        				<td><%= res3.getString("age")%></td>
        				<td><%= res3.getString("room")%></td>
        				<td><%= res3.getString("doctor")%></td>
        				<td><%= res3.getString("date")%></td>
        				<td><%= res3.getString("time")%></td>
        				
        			</tr>
            	<%}%>
        	
    

    
    	</table>
        	<br>
        		<br>
    	<table>
 			<center>
 				<b>牙科的挂号情况</b>
 			</center>
    		<%
        		while(res4.next()){
        		%>
     
        			<tr>
        		        <td><%= res4.getString("id")%></td>
        				<td><%= res4.getString("user_name")%></td>
        				<td><%= res4.getString("sex")%></td>
        				<td><%= res4.getString("age")%></td>
        				<td><%= res4.getString("room")%></td>
        				<td><%= res4.getString("doctor")%></td>
        				<td><%= res4.getString("date")%></td>
        				<td><%= res4.getString("time")%></td>
        				
        			</tr>
            	<%}%>
        	
    

    
    	</table>
        	<br>
        		<br>
    	<table>
 			<center>
 				<b>精神科的挂号情况</b>
 			</center>
    		<%
        		while(res5.next()){
        		%>
     
        			<tr>
        		        <td><%= res5.getString("id")%></td>
        				<td><%= res5.getString("user_name")%></td>
        				<td><%= res5.getString("sex")%></td>
        				<td><%= res5.getString("age")%></td>
        				<td><%= res5.getString("room")%></td>
        				<td><%= res5.getString("doctor")%></td>
        				<td><%= res5.getString("date")%></td>
        				<td><%= res5.getString("time")%></td>
        				
        			</tr>
            	<%}%>
        	
    

    
    	</table>

	</div>
	<%
		try {  //此处的rs stmt con必须为全局变量
			if (res1 != null) {
        		res1.close();   
    		}

    		if (stmt1 != null) {
        		stmt1.close();
    		}
    		if (conn != null) {
        		conn.close();
    		}
    		if (res2 != null) {
        		res1.close();   
    		}

    		if (stmt2 != null) {
        		stmt1.close();
    		}

    		if (res3 != null) {
        		res1.close();   
    		}

    		if (stmt3 != null) {
        		stmt1.close();
    		}

    		if (res4 != null) {
        		res1.close();   
    		}

    		if (stmt4 != null) {
        		stmt1.close();
    		}

    		if (res5 != null) {
        		res1.close();   
    		}

    		if (stmt5 != null) {
        		stmt1.close();
    		}


		} catch (SQLException e) {
    
    		System.out.println("关闭连接时异常");
		}
		%>
		   <br>
				<br>
					<center>
						<p>如果需要删除记录，请在下方输入记录编号</p>
						<br>
						<form action="doDelete.jsp" method="post">
							<input name="delete_id" value="" />
							<input type="submit" value="提交"  style="cursor: pointer;">
						</form>
						<br>
						<a href="admin.jsp">返回</a></center>
  	</body>
</html>
