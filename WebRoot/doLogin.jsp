<%@ page import="java.sql.*" pageEncoding="UTF-8" %> 
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="java.util.*,java.net.*" %>

<%!
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement st = null;
%>

<%
		String username = "";
		String password = "";
		request.setCharacterEncoding("UTF-8"); //解决中文乱码
		username = request.getParameter("username");
		password = request.getParameter("password");
		String cookie[] = request.getParameterValues("isUseCookie");
/*
	if(cookie != null && cookie.length>0){
	
	Cookie username_cookie = new Cookie("username",username);
	Cookie password_cookie = new Cookie("password",password);
	username_cookie.setMaxAge(864000);
	password_cookie.setMaxAge(864000);
	response.addCookie(username_cookie);
	response.addCookie(password_cookie);
}
else
{
   Cookie[] cookies = request.getCookies();
   if(cookies!=null&&cookies.length>0)
   {
      for(Cookie c:cookies)
      {
         if(c.getName().equals("username")||c.getName().equals("password"))
         {
             c.setMaxAge(0); //设置Cookie失效
             response.addCookie(c); //重新保存。
         }
      }
   }
}
*/
%>

<%
		if("admin".equals(username) && "admin".equals(password)){
    		session.setAttribute("loginUser", username);
			request.getRequestDispatcher("admin.jsp").forward(request,response);
			return;
		}
		else{
	
		}
%>
<%
		try {
			String sql = "select * from user where user_name = ? and password = ?" ;
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/junwa?useUnicode=true&characterEncoding=UTF8";// 127.0.0.1是本机地址
			String user = "root";
			String pwd = "1012";

			con = DriverManager.getConnection(url, user, pwd);// 获取连接 
			st = con.prepareStatement(sql);
			st.setString(1, username);
			st.setString(2, password);
			rs = st.executeQuery();

			if(rs.next()){
    			session.setAttribute("loginUser", username);
				request.getRequestDispatcher("login_success.jsp").forward(request,response);
			}
			else{
				response.sendRedirect("login_failure.jsp");
			}

		} 
		catch (ClassNotFoundException e) {
				System.out.println("驱动无法找到");
				throw new RuntimeException(e);
			}
		catch (SQLException e) {
				System.out.println("数据库访问异常");
				throw new RuntimeException(e);
			}
		finally{

				try {  //此处的rs stmt con必须为全局变量
					if (rs != null) {
							rs.close();
					}
					if (st != null) {
							st.close();
					}
					if (con != null) {
							con.close();
					}
				} catch (SQLException e) {
		
						   System.out.println("关闭连接时异常");
				}
			}
%>




