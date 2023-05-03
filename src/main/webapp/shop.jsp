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
	            System.out.println("Baglanti Başarılı!");
	         }
	         catch (Exception e){
                System.out.println("Bağlantı Kurulamadı!");
	            e.printStackTrace();
                System.exit(0);  
	         }
  

             String cardno = request.getParameter("card_number");
		     String new_bal = request.getParameter("balance");
		     String passw = request.getParameter("card_pass");
		     
             String dbal=null;
             int total =0;
             
		     Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery("select balance from food_card where card_number="+"'" +cardno+"'" +  " and card_pass="+"'" +passw+"'" );	          
  
  

	       if(rs.next()){
	           dbal=rs.getString(1);
	  
             if(dbal!=null){
        	  
   	           int dbal_i = Integer.parseInt(dbal);
               int new_bali = Integer.parseInt(new_bal);
          
              if(new_bali < dbal_i ){	
        	   
	             dbal_i -= new_bali;
		         
	             Statement st= conn.createStatement();
            	 st.executeUpdate("update food_card set balance="+dbal_i+" where card_number="+ "'"+cardno+"'" );                     
	            	out.println("Alışveriş Gerçekleşti. Kalan Bakiye: "+dbal_i); 
               }else{
 	              out.println("Bakiyeniz Yetersiz");
               }
             }
		    }else{
	              out.println("İşlem gerçekleştirilemedi. Şifrenizi ve kart numaranızı kontol ediniz.");
          	  
	          
		    }
	      

	         
	         	         
  
  
  %>