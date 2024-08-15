<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="pdf.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.2/html2pdf.bundle.min.js"></script>

<style>fieldset{border:2px solid black;margin-top:0px;}hr{border:3px solid black;}.personal{background-color:black; color:white;padding:10px;}
 a{text-decoration:none;color:white;padding-top:10px;}span{font-weight:600}button{margin:5px;padding:5px;color:white;background-color:black;border-radius:15px;}
 </style>
</head>
<body>


<div id="pdf" name="pdf" class="pdf">
<fieldset>
<%
String url = "jdbc:postgresql://localhost:5432/resumedatabase";
String username="postgres";
String password="Varun@4545";
Class.forName("org.postgresql.Driver");
Connection con = DriverManager.getConnection(url,username,password);
String email1 = request.getParameter("email1");
String pass = request.getParameter("password1");
PreparedStatement ps = con.prepareStatement("select * from details where email1=? and pass=?;");
ps.setString(1,email1);
ps.setString(2,pass);
ResultSet rs = ps.executeQuery();
if(rs.next()){
%>
<h2><%= rs.getString(1) %></h2><br>
<i><%=rs.getString(2) %></i><br>
<p><%=rs.getString(3) %><br><hr>
<p class="personal">
	E-Mail:<a href="mailto:<%=rs.getString(4) %>"><%=rs.getString(4) %></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	Phone no:<a href="tel:+91<%= rs.getString(5)%>"><%= rs.getString(5)%></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	Location:<%= rs.getString(6) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
	Linkedin:<a href="<%=rs.getString(7)%>"><%=rs.getString(7) %></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	GitHub:<a href="<%=rs.getString(8) %>"><%=rs.getString(8) %></a>
</p><hr>
<p class="education">
	<h3>Education</h3>
	<p class="school"><span>High School</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <%=rs.getString(9) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 Marks:<%=rs.getString(10) %></p>
	 <p class="school"><span>Secondary Education</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <%=rs.getString(11) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 Marks:<%=rs.getString(12) %></p>
	 <p class="school"><span>Engineering</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <%=rs.getString(13) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 Marks:<%=rs.getString(14) %></p>
</p><hr>
<p class="skills">
<h3>Skills</h3>
<%String arr[]=rs.getString(19).split("#"); for(String s:arr){%><button><%=s %></button><%} %>

</p><hr>
<p class="project">
<h3>Project</h3>
<h4><%=rs.getString(15) %></h4><p><%=rs.getString(16) %></p><br><br>
<h4><%=rs.getString(17) %></h4><p><%=rs.getString(18) %></p>


</p>


<%}else{response.sendRedirect("login.html");} %>
</fieldset>
</div>
<button id="download">PDF</button>
</body>
</html>