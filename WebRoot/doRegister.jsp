<%@ page import="java.sql.*" %> 
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>


<%!  
		Connection conn = null;// 创建一个数据库连接
		ResultSet re = null;// 创建一个结果集对象  
		Statement st = null;
%>
<% 
		String username_register = "";
		String password_register = "";
		String password_repeat = "";

		int idel = 1;
		request.setCharacterEncoding("UTF-8");//解决中文乱码
		username_register = request.getParameter("username_register");
		password_register = request.getParameter("password_register");
		password_repeat = request.getParameter("password_repeat");

		if(username_register==null||"".equals(username_register.trim())||password_register==null||"".equals(password_register.trim())||!password_register.equals(password_repeat)||password_register==null){ 
    			response.sendRedirect("register_failure.jsp");  
		}
		else{
    			boolean isValid = false; 
     
    //PreparedStatement pre = null;// 创建预编译语句对象，一般都是用这个而不用Statement 
    
       			try{ 
  						Class.forName("com.mysql.jdbc.Driver");// 加载Mysql驱动程序 
  						String url = "jdbc:mysql://127.0.0.1:3306/junwa";// 127.0.0.1是本机地址
  						String user = "root";
  						String pwd = "1012";
  
  						conn = DriverManager.getConnection(url, user, pwd);// 获取连接 
  						System.out.println("连接数据库成功");
  
  						st = conn.createStatement(); 
  						re = st.executeQuery("SELECT user_name,password,isdel FROM user ");
  						String insertSQL = "INSERT INTO user(user_name,password,isdel) Values ('"+username_register+"', '"+password_register+"', ' "+idel+"')";
  						st.executeUpdate(insertSQL);
  						isValid = true;
  						session.setAttribute("registerName", username_register);
 				} 
 				catch (Exception e){ 
  						e.printStackTrace(); 
 				} 
 


 
 						if(isValid){  
  							request.getRequestDispatcher("register_success.jsp").forward(request,response);
 						}else if(!isValid){ 
 
  							response.sendRedirect("register.jsp"); 
						}
 						re.close(); 
 						st.close(); 
 						conn.close(); 
						}
 %> 
 