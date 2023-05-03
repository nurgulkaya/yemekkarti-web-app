<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%

  Connection conn;
  PreparedStatement ps;
  ResultSet rs;
  
  
  Class.forName("org.postgresql.Driver");
  conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/foodcard","postgres","8899");
  
	String sql = "select * from user where card_number=?,first_name=?,last_name=?,password=?";


%>
