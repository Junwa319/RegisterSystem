<%@ page import="java.sql.*" pageEncoding="UTF-8" %> 
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>

<%!  
		Connection conn = null;// 创建一个数据库连接
		ResultSet re = null;// 创建一个结果集对象  
		PreparedStatement st = null;
		Boolean isValid = false;
		int flag = -1;
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
		String delete_id = "";
		request.setCharacterEncoding("UTF-8");//解决中文乱码
		String get_delete_id = request.getParameter("delete_id");
%>
<%     
    	try{ 
  			Class.forName("com.mysql.jdbc.Driver");// 加载Mysql驱动程序 
  			String url = "jdbc:mysql://127.0.0.1:3306/junwa?useUnicode=true&characterEncoding=UTF8";// 127.0.0.1是本机地址
  			String user = "root";
  			String pwd = "1012";
  			String guahao_user = "";
  			conn = DriverManager.getConnection(url, user, pwd);// 获取连接 
  			String sql = "delete from guahao where id = '"+get_delete_id+"'" ;
  			st = conn.prepareStatement(sql);
  			flag = st.executeUpdate(sql);
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
 
 			if(isValid){%> 

				<b><%out.print("删除成功，2秒钟后自动跳转"); %></b>
 			<% 
       			response.setHeader("Refresh","2;URL=admin.jsp");
 			}else if(!isValid){ 
 
  				response.sendRedirect("admin_printTable.jsp"); 
  
 			}


 			%> 
 