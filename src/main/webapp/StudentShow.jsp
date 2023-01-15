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
	<div align="center">
        <table border="1" cellpadding="5">
            <caption>
            	<h2>Student's Information</h2>
            	<p>Students details who are joined in particular classes</p>
            </caption>
            <tr>
                <th>Class ID</th>
                <th>Class Name</th>
                <th>LAT Register ID</th>
                <th>Roll No.</th>
                <th>Student Name</th>
                <th>LA Class ID</th>
            </tr>
		<% 
		    if(session.getAttribute("save") != null){
		    Connection con=null;
		
		        Class.forName("com.mysql.cj.jdbc.Driver");
		        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eduport","root","root");
		        //String sel="select laclasses.*, lastudents.*  from laclasses, lastudents";
		        // PreparedStatement pst=con.prepareStatement(sel);
		        PreparedStatement pst = con.prepareStatement("select laclasses.*, lastudents.*  from laclasses, lastudents");
		    //    pst.setString(1,psw);
		    //    int i= pst.executeUpdate();
		        ResultSet rs = pst.executeQuery();
		        while(rs.next()) { 
		        	%>
		        	<tr>
		        	<td> <% out.println(rs.getInt("cid"));      %> </td>  
		        	<td> <% out.println(rs.getString("cname"));%> </td>
		        	<td> <% out.println(rs.getString("lat_rid"));%> </td>
		        	<td> <% out.println(rs.getInt("rollno"));      %> </td>  
		        	<td> <% out.println(rs.getString("sname"));%> </td>
		        	<td> <% out.println(rs.getInt("la_cid")); %> </td>
		        	</tr>
		        	<%
		        }
		    }
		%>
        </table>
    </div>
</body>
</html>