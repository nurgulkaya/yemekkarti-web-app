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
	            System.out.println("Bağlantı Başarılı!");
	         }
	         catch (Exception e){
                System.out.println("Bağlantı Kurulamadı!");
	            e.printStackTrace();
                System.exit(0);  
	         }
  
             		   
           
            	 
		     String dbal="";
		     String cardno = request.getParameter("card_number");
		     String passw = request.getParameter("card_pass");
		       		  
		  	 Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery("select balance from food_card where card_number="+"'" +cardno+"'" +  " and card_pass="+"'" +passw+"'" );	          
		  	      
		        if (rs.next()) {
						dbal=rs.getString(1);
						
				 if(dbal!=null){
					  out.println("Bakiye Miktarı: " + rs.getString(1)); 
				}
						
		        }else{
		        	 out.println(" İşlem gerçekleştirilemedi. Şifrenizi ve kart numaranızı kontol ediniz. ");
		        	
		        }
		       	
			      
     
     %>

