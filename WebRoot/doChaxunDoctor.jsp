<!--
    @钧娃
    11月19日
    windows10
-->
<%@page import="java.sql.*" %>
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
<%!
    	private static final String URL="jdbc:mysql://127.0.0.1:3306/junwa";
    	private static final String USER="root";
    	private static final String PASSWORD="1012";
    	public String chaxun_name = "";
    	Connection conn = null;
    	PreparedStatement stmt = null;
    	ResultSet res = null;
    
%>

<%      
        String sql = "select * from guahao where doctor = ?" ;
		request.setCharacterEncoding("UTF-8");
		chaxun_name = request.getParameter("chaxun_doctor");
		chaxun_name = " "+chaxun_name;
		System.out.println(chaxun_name);
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, chaxun_name);
        ResultSet res = stmt.executeQuery();
        
%>

<html>
  <head> 
 
    <!-- 网页标题 -->
    <title>打印预约单</title>
    <!-- 导入库 -->
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
    
    /*
    I know this is annoying, but we need additional styling so webkit will recognize rounded corners on background elements.
    Nice write up of this issue: http://www.onenaught.com/posts/266/css-inner-elements-breaking-border-radius
    
    And, since we've applied the background colors to td/th element because of IE, Gecko browsers also need it.
    */
    
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
            	<a href="#">
            		<img src="assets/logo.png" alt="" />
            	</a>
        	</div>
        	<center>
    				<p class="space">
    				    <input type="submit" value="返回" class="login" onclick="location='admin.jsp'" style="cursor: pointer;">
    				
    				    <input type="submit" value="退出登陆" class="login" onclick="location='index.jsp'" style="cursor: pointer;">
				    </p>
    			
    			</center>
    		<div id="content">
			
    			<table>
 
    			<%
        			while(res.next()) {
        		%>
     
        				<tr>
        		        	<td><%= res.getString("id")%></td>
        					<td><%= res.getString("user_name")%></td>
        					<td><%= res.getString("sex")%></td>
        					<td><%= res.getString("age")%></td>
        					<td><%= res.getString("room")%></td>
        					<td><%= res.getString("doctor")%></td>
        					<td><%= res.getString("date")%></td>
        					<td><%= res.getString("time")%></td>
        					<td><%= res.getString("kind")%></td>
        				
        				</tr>
            	<%}%>
        	
    

    
    			</table>

			</div>

			</div>
			<%
				try {  //此处的rs stmt con必须为全局变量
					if (res != null) {
						res.close();
						System.out.println("关闭res");
					}
					if (stmt != null) {
						stmt.close();
						System.out.println("关闭stmt");
					}
					if (conn != null) {
						conn.close();
						System.out.println("关闭conn");
					}
				} catch (SQLException e) {
	
						System.out.println("关闭连接时异常");
					}
				%>

				<br>
    				<br>
    					<br>
    						<br>
  		</body>
</html>
