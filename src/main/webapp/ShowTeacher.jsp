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
            	<h2>Teacher's Information</h2>
            	<p>Teacher's details & subjects taken by the teacher's</p>
            </caption>
            <tr>
                <th>Register ID</th>
                <th>Teacher ID</th>
                <th>Teacher Name</th>
                <th>Subject ID</th>
                <th>Subject Name</th>
                <th>LACC ID</th>
            </tr>
            <% 
			    if(session.getAttribute("save") != null){
			    	Connection con=null;
			        Class.forName("com.mysql.cj.jdbc.Driver");
			        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eduport","root","root");
			        //String sel="select lateachers.*, lasubjects.* from lateachers, lasubjects";
			        //PreparedStatement pst=con.prepareStatement(sel);
			        PreparedStatement pst = con.prepareStatement("select lateachers.*, lasubjects.* from lateachers, lasubjects");
			        ResultSet rs = pst.executeQuery();
			        while(rs.next()) { 
			        	%>
			        	<tr>
			        	<td> <% out.println(rs.getInt("rid")); %> </td>      
					    <td> <% out.println(rs.getInt("tid"));   %> </td>    
					    <td> <% out.println(rs.getString("tname")); %></td>
					    <td> <% out.println(rs.getInt("sid"));	%>	</td>
			        	<td> <% out.println(rs.getString("sname"));	%> </td>
			        	<td> <% out.println(rs.getInt("lacc_cid"));%>	</td>
			        	</tr>
			        	<%
			        }
			    }
			%>

        </table>
    </div>

</body>
</html>