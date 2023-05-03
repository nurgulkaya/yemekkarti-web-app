<%@ page language="java" contentType="text/html charset=UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="jakarta.servlet.*"%>
  
      
 <%
   String driver = "org.postgresql.Driver";
   String dburl = "jdbc:postgresql://localhost:5432/foodcard";
   String user= "postgres";
   String pass = "8899";
   Connection conn = null;

             try{
	            Class.forName(driver);
	            conn = DriverManager.getConnection(dburl, user, pass);
	            System.out.println("Baglanti Basarili!");
	         }
	         catch (Exception e){
                System.out.println("Baglanti Kurulamadi");
	            e.printStackTrace();
                System.exit(0);  
	         }
  
  
             String cardno = request.getParameter("card_number");
		     String firstn = request.getParameter("first_name");
		     String lastn = request.getParameter("last_name");
		     String new_bal = request.getParameter("balance");
		     String passw = request.getParameter("card_pass");
		     
		     String dbal=null;
             int dbal_i=0;
             int new_bali=0;
      	     new_bali=Integer.parseInt(new_bal);

	   Statement stmt = conn.createStatement();
	   ResultSet rs = stmt.executeQuery("select balance from food_card where card_number="+ "'"+cardno+"'" + " and first_name="+ "'"+firstn+"'"+
	   "and last_name="+ "'"+lastn+"'" + "and card_pass=" + "'"+passw+"'" );	
                    
       
            if(rs.next()){
        	   
        	   dbal=rs.getString(1);
      	     
             if(dbal!=null){
             	   dbal_i=Integer.parseInt(dbal);
                   dbal_i += new_bali;
        	       Statement st= conn.createStatement();
        	       st.executeUpdate("update food_card set balance="+dbal_i+" where card_number="+ "'"+cardno+"'");
                 out.println("Bakiye Veritabanına Kaydedildi.");
                }
             
            }else{
         
        	   out.println("Bakiye Veritabanına Kaydedilemedi. Şifrenizi ve kart numaranızı kontol ediniz. ");

             }
              

	          
  %>