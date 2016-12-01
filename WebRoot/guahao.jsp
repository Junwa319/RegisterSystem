<!--
    @钧娃
    11月14日
    windows10
-->

<%@page import="java.util.Date.*"%>
<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>

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
    <title>挂号</title>
	<link type="text/css" href="css/login2.css" rel="stylesheet" />
	<link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
	<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="js/easyTooltip.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
	<META NAME="Generator" CONTENT="EditPlus">
    <META NAME="Author" CONTENT="">
    <META NAME="Keywords" CONTENT="">
    <META NAME="Description" CONTENT="">
    <script language="JavaScript" type="text/javascript">
     //定义了城市的二维数组，里面的顺序跟一级的顺序是相同的。通过selectedIndex获得省份的下标值来得到相应的城市数组
     var city=[
     ["小徐","小吴"],
     ["小李","小王"],
     ["小马","小周"],
     ["小花","大黄"],
     ["小赵","小谢"]
     ];

     function getCity(){
         //获得一级下拉框的对象
         var sltProvince=document.form1.province;
         //获得二级下拉框的对象
         var sltCity=document.form1.city;         
         //得到对应一级的二级数组
         var provinceCity=city[sltProvince.selectedIndex - 1];
 
         //清空一级下拉框，仅留提示选项
         sltCity.length=1;
 
         //将一级数组中的值填充到二级下拉框中
         for(var i=0;i<provinceCity.length;i++){
             sltCity[i+1]=new Option(provinceCity[i],provinceCity[i]);
         }
     }
 	</script>
 </head>
  
  <body>
  	<div id="container">
    	<div class="logo">
    		<a href="#"><img src="assets/logo.png" alt="" /></a>
    	</div>
    	<div id="box">
    		<font color="red"><%= session.getAttribute("loginUser") %></font> 欢迎来到挂号系统！
    	</div>
	</div>
    <center>
    <p class="space">
    	<input type="submit" value="返回" class="login" onclick="location='login_success.jsp'" style="cursor: pointer;">
    	<input type="submit" value="退出登陆" class="login" onclick="location='index.jsp'" style="cursor: pointer;">
	</p>
    <div class="banner-posit animated wow zoomIn" data-wow-delay=".5s" style="margin-top: 100px;margin-right: 230px;">
    	<h2>
    		<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
    			开始预约
    	</h2>
        <div class="reservation" >
            <form method="post" action="doGuahao.jsp" name="form1">
                <h5>科室</h5>
             		<select name="province" onChange="getCity()">
             			<option value="0">请选择科室</option>
             			<option value="外科">外科</option>
                		<option value="内科">内科</option>         
                		<option value="儿科">儿科</option>
                		<option value="牙科">牙科</option>
                		<option value="精神科">精神科</option>
            		</select>
            		<br>

            	<h5>医生</h5>
         			<select name="city">
             			<option value="0">请选择医生</option>
         			</select>
     			
                
                <h5>日期</h5>
                    <div class="section_room">
                         <select name="date" onchange="change_country(this.value)" class="frm-field required sect"> 
                            	<option value="周一">周一</option> 
                                <option value="周二">周二</option>                   
                                <option value="周三">周三</option>   
                                <option value="周四">周四</option>   
                                <option value="周五">周五</option> 
                                <option value="周六">周六</option>    
                                <option value="周日">周日</option>                            
                          </select>
                    </div> 


                <h5>时间段</h5>
                     <div class="section_room">
                          <select name ="time" onchange="change_country(this.value)" class="frm-field required sect">
                                <option value="7:00-9:00">7：00~9：00</option>
                                <option value="9:00-11:00">9：00~11：00</option> 
                                <option value="14:00-16:00">14：00~16：00</option>                   
                                <option value="16:00-18:00">16：00~18：00</option>                               
                          </select>
                     </div> 


                <h5>性别</h5>
                     <div class="section_room">
                           <select name ="sex" onchange="change_country(this.value)" class="frm-field required">
                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                <option value="男">男</option>
                                <option value="女">女</option>         
                            </select>
                     </div> 


                <h5>挂号类别</h5>
                     <div class="section_room">
                            <select name ="kind" onchange="change_country(this.value)" class="frm-field required">
                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                <option value="初诊">初诊</option>
                                <option value="复诊">复诊</option>         
                            </select>
                     </div>


                <div class="book">
                     <h5>姓名</h5>
                        	<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                <input type="text" name="name" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
                        
                </div>
                    
                    
                <div class="book">
                     <h5>年龄</h5>
                       		<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                <input name="age" value="" />
                        
                </div>
                

                <div class="book">
                     <h5>挂号费</h5>
                        	<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><input type="text" name="fee" value="25元"   onblur="if (this.value == '') {this.value = '5元';}" required="" readonly="true">
                                <input type="submit" value="Submit" >
                        
                </div>
        	</form>
    	</div>
	</div>
         
    
    <p style="margin-top:990px;font-size:30px;">
    	已经预约了？点此打印预约单哦！
    		<button class="login"  onclick="javascript:window.location.href='printTable.jsp';" style="height:30px;width:70px;">
    			打印预约单
    		</button>
    	
    </p> 
	
	<br>
    	<br>
    		<br>
    			<br>	
    </center>
  </body>
</html>
