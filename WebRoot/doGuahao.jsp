<%@ page import="java.sql.*" pageEncoding="UTF-8" %> 
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>

<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<%!  
		Connection conn = null;// 创建一个数据库连接
		ResultSet re = null;// 创建一个结果集对象  
		Statement st = null;

%>
<%
		String user1 = (String)session.getAttribute("loginUser");
		if(user1 == null){
			response.sendRedirect("index.jsp");
			return;
		}else{
	
		}

%>
<% 
		String userLogin = (String)session.getAttribute("loginUser");
		String date_guahao = "";
		String time_guahao = "";
		String room_guahao = "";
		String name_guahao = "";
		String age_guahao = "";
		String sex_guahao = "";
		String doctor_guahao = "";
		String kind = "";

		request.setCharacterEncoding("UTF-8");//解决中文乱码
		name_guahao = request.getParameter("name");
		date_guahao = request.getParameter("date");
		time_guahao = request.getParameter("time");
		room_guahao = request.getParameter("province");
		doctor_guahao = request.getParameter("city");
		age_guahao = request.getParameter("age");
		sex_guahao = request.getParameter("sex");
		kind = request.getParameter("kind");

		if(name_guahao==null||date_guahao==null||sex_guahao==null||room_guahao==null||time_guahao==null||age_guahao==null){ 
    		response.sendRedirect("guahao_failure.jsp");  
		}
		else{
    		boolean isValid = false; 
    
    		try { 
  				Class.forName("com.mysql.jdbc.Driver");// 加载Mysql驱动程序 
  				String url = "jdbc:mysql://127.0.0.1:3306/junwa?useUnicode=true&characterEncoding=UTF8";// 127.0.0.1是本机地址
  				String user = "root";
  				String pwd = "1012";
  				String guahao_user = "";
  				conn = DriverManager.getConnection(url, user, pwd);// 获取连接 
  				st = conn.createStatement(); 
  				ResultSet rs = st.executeQuery("SELECT user_name,sex,age,room,time,date,user,doctor,kind FROM guahao ");
  				String insertSQL = "INSERT INTO guahao(user_name,sex,age,room,time,date,user,doctor,kind) Values ('"+name_guahao+"', '"+sex_guahao+"', ' "+age_guahao+"', ' "+room_guahao+"', ' "+time_guahao+"', ' "+date_guahao+"',' "+userLogin+"',' "+doctor_guahao+"',' "+kind+"')";
  				st.executeUpdate(insertSQL);
  				isValid = true;
 
 				} 
 			catch (Exception e){ 
  				e.printStackTrace(); 
 				} 
 
 				if(re!=null){
	 				re.close();
 				}
 				if(st!=null){
	 				st.close();
 				}    
 				if(conn!=null){
	 				conn.close();
 				} 
 
 				if(isValid){  
  					request.getRequestDispatcher("guahao_success.jsp").forward(request,response);

 				}else if(!isValid){ 
 
  					response.sendRedirect("guahao.jsp"); 
  
				}

			}
 %> 
 