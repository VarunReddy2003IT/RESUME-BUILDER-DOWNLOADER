<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String url = "jdbc:postgresql://localhost:5432/resumedatabase";
		String username="postgres";
		String password="Varun@4545";
		Class.forName("org.postgresql.Driver");
		Connection con =DriverManager.getConnection(url,username,password);
		String fullname =request.getParameter("name");
		String profession  =request.getParameter("profession");
		String summary  =request.getParameter("summary");
		String email1  =request.getParameter("email");
		String pno  =request.getParameter("phone");
		String location1  =request.getParameter("location");
		String linkedin  =request.getParameter("linkedin");
		String github  =request.getParameter("github");
		String schooln  =request.getParameter("schoolname");
		String schoolm  =request.getParameter("marksschool");
		String intern  =request.getParameter("intername");
		String interm  =request.getParameter("marksinter");
		String engineeringn  =request.getParameter("engineeringname");
		String engineeringm  =request.getParameter("marksengineering");
		String project1n  =request.getParameter("project1name");
		String project1d  =request.getParameter("pd1");
		String project2n  =request.getParameter("project2name");
		String project2d  =request.getParameter("pd2");
		String skills  =request.getParameter("skills");
		String pass  =request.getParameter("password1");
		PreparedStatement ps = con.prepareStatement("INSERT INTO details VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,fullname);
		ps.setString(2,profession);
		ps.setString(3,summary);
		ps.setString(4,email1);
		ps.setString(5,pno);
		ps.setString(6,location1);
		ps.setString(7,linkedin);
		ps.setString(8,github);
		ps.setString(9,schooln);
		ps.setString(10,schoolm);
		ps.setString(11,intern);
		ps.setString(12,interm);
		ps.setString(13,engineeringn);
		ps.setString(14,engineeringm);
		ps.setString(15,project1n);
		ps.setString(16,project1d);
		ps.setString(17,project2n);
		ps.setString(18,project2d);
		ps.setString(19,skills);
		ps.setString(20,pass);
		int n = ps.executeUpdate();
		response.sendRedirect("login.html");
	%>
</body>
</html>