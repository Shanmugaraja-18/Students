<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%
String firstName=request.getParameter("firstname");
String lastName=request.getParameter("lastname");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String dob=request.getParameter("dob");
String gender=request.getParameter("gender");
String address1=request.getParameter("address1");
String address2=request.getParameter("address2");
String city=request.getParameter("city");
String state=request.getParameter("state");
String zipcode=request.getParameter("zipcode");
String country=request.getParameter("country");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root", "password");
	PreparedStatement ps = connect.prepareStatement("insert into students(firstname, lastname, email, phone, dob, gender, address1, address2, city, state, zipcode, country) values(?,?,?,?,?,?,?,?,?,?,?,?);");
    ps.setString(1,firstName);
    ps.setString(2,lastName);
    ps.setString(3,email);
    ps.setString(4,phone);
    ps.setString(5,dob);
    ps.setString(6,gender);
    ps.setString(7,address1);
    ps.setString(8,address2);
    ps.setString(9,city);
    ps.setString(10,state);
    ps.setString(11,zipcode);
    ps.setString(12,country);
    int x = ps.executeUpdate();
    if(x>0){
    out.println("REGISTRATION SUCCESS!!!");
}
else{
    out.println("REGISTRATION FAILED!!!");

}
	
}catch(Exception e){
	    out.println(e);

}
%>