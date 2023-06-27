package com.intern;

	import java.io.IOException;


import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


	public class DataAccess{
		
		    public static final String driver = "org.postgresql.Driver";
		    public static final String dburl = "jdbc:postgresql://localhost:5432/foodcard";
		    public static final String user= "postgres";
		    public static final String pass = "8899";
		    public static Connection conn = null;
		 
		    
	  public static Connection baglan() {
	  
	       try{
	        	
	            Class.forName(driver);
	            conn = DriverManager.getConnection(dburl, user, pass);
	            System.out.println("Baðlantý Baþarýlý!");
	         }
	        
	        catch (Exception e)
	        {
	            e.printStackTrace();
	        }
			return conn;
     	}

	      public void kullaniciListesi(){
	       	
	        if( conn == null){
		          System.out.println("Veritabaný baðlý degil. Baðlanýyor...");
		          baglan();
	         }
	       
	        try{
	        	
	          Statement stmt = conn.createStatement();
	          ResultSet rs = stmt.executeQuery("SELECT*FROM food_card");	          
	          while (rs.next()) {
	        	  System.out.println(rs.getString(2));
	        	  
	        	}
	        }
	        catch(Exception e){
		       System.out.println("Baðlantý da Sorun Var");
		       e.printStackTrace();
	        } 
	     }
	      
	  public String bakiye_getir(String cardno,String pass){	    				         
	    String balance= "";
	    	    if( conn == null){
	    	          System.out.println("Veritabaný baðlý degil. Baðlanýyor...");
	    	       baglan();
	    	     }
	    	   
	    	    try{
	    	      Statement stmt = conn.createStatement();
	    	      ResultSet rs = stmt.executeQuery("select balance from food_card where card_number="+"'" +cardno+"'" +  " and card_pass="+"'" +pass+"'" );	          
	    	     
	    	     while (rs.next()) {
                      balance=(rs.getString(1));
	    	    	 
	    	    	}
	    	    }
	    	    catch(Exception e){
	    	       System.out.println("Baðlantý da Sorun Var");
	    	       e.printStackTrace();
	    	    }
				
	    	    return (balance);
	    	
	    	}
	    
	         
	        public static void main (String [] args) {
	              DataAccess da = new DataAccess();
			     // da.kullaniciListesi();
	              
	              System.out.println(da.bakiye_getir("93","1"));

	    }
	         
	         
	}
	
	