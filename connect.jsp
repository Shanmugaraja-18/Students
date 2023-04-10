<%@ page import="java.sql.*" %>
<%
   // Set up the database connection
   String driver = "com.mysql.jdbc.Driver";
   String url = "jdbc:mysql://localhost/demo";
   String username = "root";
   String password = "password";
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   try {
      Class.forName(driver);
      conn = DriverManager.getConnection(url, username, password);
      
      // Retrieve data from the database
      stmt = conn.createStatement();
      String sql = "SELECT * FROM students";
      rs = stmt.executeQuery(sql);
      
      // Display data in a table
      out.println("<table>");
      out.println("<tr><th>S.No</th><th>FIRST NAME</th><th>LAST NAME</th><th>EMAIL</th><th>PHONE</th><th>DOB</th><th>GENDER</th><th>ADDRESS1</th><th>ADDRESS2</th><th>City</th><th>City</th><th>State</th><th>ZipCode</th><th>Contry</th></tr>");
      while(rs.next()) {
         out.println("<tr>");
         out.println("<td>" + rs.getInt("id") + "</td>");
         out.println("<td>" + rs.getString("firstname") + "</td>");
         out.println("<td>" + rs.getString("lastname") + "</td>");
         out.println("<td>" + rs.getString("email") + "</td>");
         out.println("<td>" + rs.getString("phone") + "</td>");
         out.println("<td>" + rs.getString("dob") + "</td>");
         out.println("<td>" + rs.getString("gender") + "</td>");
         out.println("<td>" + rs.getString("address1") + "</td>");
         out.println("<td>" + rs.getString("address2") + "</td>");
         out.println("<td>" + rs.getString("city") + "</td>");
         out.println("<td>" + rs.getString("state") + "</td>");
         out.println("<td>" + rs.getInt("zipcode") + "</td>");
         out.println("<td>" + rs.getString("country") + "</td>");
         out.println("</tr>");
      }
      out.println("</table>");
   } catch(Exception e) {
      e.printStackTrace();
   } finally {
      try {
         if(rs!=null) rs.close();
         if(stmt!=null) stmt.close();
         if(conn!=null) conn.close();
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
%>
