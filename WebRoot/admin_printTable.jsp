<!--
    @钧娃
    11月19日
    windows10
-->
<%@page import="java.sql.*" %>
<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="java.text.DecimalFormat" contentType="text/html; charset=UTF-8"%>
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
<%!
    private static final String URL="jdbc:mysql://127.0.0.1:3306/junwa";
    private static final String USER="root";
    private static final String PASSWORD="1012";
    public String loginUser = "";
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet res = null;
    double counts;
    double counts_a;
    double counts_m;
    double counts_b;
    double counts_c;
    double countm;
    double countw;
    double counta;
    double countb;
    double countc;
    DecimalFormat df = new DecimalFormat( "0.00 ");
    
%>

<%      
    String sql = "select * from guahao " ;
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);  
    PreparedStatement stmt = conn.prepareStatement(sql);      
    loginUser = (String)session.getAttribute("loginUser"); 
    ResultSet res = stmt.executeQuery(); 
        
        
%>
<%
	String sql1 = "select count(1) as counts from guahao";
	String sql2 = "select count(1) as counts_a from guahao where age < 18";
	String sql3 = "select count(1) as counts_m from guahao where sex = '男'";
	String sql4 = "select count(1) as counts_b from guahao where age > 18 and age <40";
	String sql5 = "select count(1) as counts_c from guahao where age >40";
	Statement stmt1 = conn.createStatement();   
	Statement stmt2 = conn.createStatement();  
	Statement stmt3 = conn.createStatement(); 
	Statement stmt4 = conn.createStatement(); 
	Statement stmt5 = conn.createStatement(); 

	ResultSet res1 = stmt1.executeQuery(sql1); 
	ResultSet res2 = stmt2.executeQuery(sql2);
	ResultSet res3 = stmt3.executeQuery(sql3); 
	ResultSet res4 = stmt4.executeQuery(sql4); 
	ResultSet res5 = stmt5.executeQuery(sql5); 

	if(res1.next()){
		counts = res1.getInt("counts");
	
	}
	if(res2.next()){
		counts_a = res2.getInt("counts_a");
	
	}
	if(res3.next()){
		counts_m = res3.getInt("counts_m");
	
	}
	if(res4.next()){
		counts_b = res4.getInt("counts_b");
	
	}
	if(res5.next()){
		counts_c = res5.getInt("counts_c");
	
	}

	double countm = counts_m/counts*100;
	double countw = (1 - counts_m/counts)*100;
	double counta = counts_a/counts*100;
	double countb = counts_b/counts*100;
	double countc = counts_c/counts*100;
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
            	<a href="#"><img src="assets/logo.png" alt="" /></a>
        	</div>
    		<div id="box">
    		<%
    
    			if(application.getAttribute("time") != null){
    		
    	    %>
    				管理员：<font color="red"><%= session.getAttribute("loginUser") %></font>
    					您好！  今日有
    					<font color="red">
    					<%= (String)application.getAttribute("time") %>
    	    			</font>
    	          		位用户访问
    		<%} 
    			else{

    		%>
          			管理员：<font color="red"><%= session.getAttribute("loginUser") %></font>
          				您好！  今日有
    					<font color="red">
    					0
    	    			</font>
    	        		位用户访问
    		<%} %>
    		</div>
    
    		<p class="space">
    				<input type="submit" value="退出登陆" class="login" onclick="location='index.jsp'" style="cursor: pointer;">
    				<input type="submit" value="返回" class="login" onclick="location='admin.jsp'" style="cursor: pointer;">
    		</p>
    		<div id="box">
    			目前总共有<font color="red"><%= (int)counts %></font>位病人挂号，其中：
    			<br>
    				<br>
    					<br>
    			<b>男性</b>占：<font color="red"><%= df.format(countm) %>%</font>, <b>女性</b>占：<font color="red"><%= df.format(100-countm) %>%</font>;
    			<br>
    				<br>
    					<br>
    			<b>18岁以下</b>人群占：<font color="red"><%= df.format(counta) %>%</font>, <b>18-40岁</b>人群占<font color="red"><%= df.format(countb) %>%</font>, 
    			<b>40岁以上</b>人群占：<font color="red"><%= df.format(countc) %>%</font>
    		</div>  
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
        		<p>如果需要查询某用户，请在下方输入姓名</p>
           			<br>
        		<form action="doChaxunName.jsp" method="post">
           			<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                    <input type="text" name="chaxun_name" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
           			<input type="submit" value="提交"  style="cursor: pointer;">
        		</form>
        		<br>
        		<p>如果需要查询某医生，请在下方输入姓名</p>
           			<br>
        		<form action="doChaxunDoctor.jsp" method="post">
           			<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                    <input type="text" name="chaxun_doctor" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
           			<input type="submit" value="提交"  style="cursor: pointer;">
        		</form>
        		<br>
        		<p>如果需要查询科室，请在下方选择科室</p>
           			<br>
        		<form action="doChaxunRoom.jsp" method="post">
           			<select name="chaxun_room" style="width: 135px;">
             			<option value="0">请选择科室</option>
             			<option value="外科">外科</option>
                		<option value="内科">内科</option>         
                		<option value="儿科">儿科</option>
                		<option value="牙科">牙科</option>
                		<option value="精神科">精神科</option>
            		</select>
           			<input type="submit" value="提交"  style="cursor: pointer;">
        		</form>
        		<br>
        		<p>如果需要查询日期，请在下方选择日期</p>
           			<br>
        		<form action="doChaxunDate.jsp" method="post">
                         <select name="chaxun_date" style="width: 135px;"> 
                            	<option value="0">请选择日期</option>
                            	<option value="周一">周一</option> 
                                <option value="周二">周二</option>                   
                                <option value="周三">周三</option>   
                                <option value="周四">周四</option>   
                                <option value="周五">周五</option> 
                                <option value="周六">周六</option>    
                                <option value="周日">周日</option>                            
                          </select>
           			<input type="submit" value="提交"  style="cursor: pointer;">
        		</form>
        		<br>
        		<p>如果需要查询时段，请在下方选择时段</p>
           			<br>
        		<form action="doChaxunTime.jsp" method="post">
           			<select name ="chaxun_time" style="width: 135px;">
                                <option value="0">请选择时段</option>
                                <option value="7:00-9:00">7：00~9：00</option>
                                <option value="9:00-11:00">9：00~11：00</option> 
                                <option value="14:00-16:00">14：00~16：00</option>                   
                                <option value="16:00-18:00">16：00~18：00</option>                               
                    </select>
           			<input type="submit" value="提交"  style="cursor: pointer;">
        		</form>
            </center>
    			<br>
    				
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
    			if (res1 != null) {
        			res1.close();
        			System.out.println("关闭res");
    			}
    			if (stmt1 != null) {
        			stmt1.close();
        			System.out.println("关闭stmt");
    			}
   				if (res2 != null) {
       				res2.close();
        			System.out.println("关闭res");
    			}
    			if (stmt2 != null) {
        			stmt2.close();
        			System.out.println("关闭stmt");
    			}
    			if (res3 != null) {
        			res3.close();
        			System.out.println("关闭res");
   				}
    			if (stmt3 != null) {
        			stmt3.close();
        			System.out.println("关闭stmt");
    			}
    			if (res4 != null) {
        			res4.close();
        			System.out.println("关闭res");
    			}
    			if (stmt4 != null) {
        			stmt4.close();
        			System.out.println("关闭stmt");
    			}
    			if (res5 != null) {
        			res5.close();
        			System.out.println("关闭res");
    			}
    			if (stmt5 != null) {
        			stmt5.close();
        			System.out.println("关闭stmt");
    			}
    			if (conn != null) {
        			conn.close();
        			System.out.println("关闭conn");
    			}
    			if (conn != null) {
        			conn.close();
        			System.out.println("关闭conn");
    			}
			} 
			catch (SQLException e) {
    
    			System.out.println("关闭连接时异常");
			}
			%>
				<br>
					<br>
			
						<br>
							<br>
  </body>
</html>
