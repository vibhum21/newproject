package com.connection;
import java.sql.*;  

import static com.connection.Provider.*;  
  
public class Connection1 {
	private static Connection con=null;  
	static{  
	try{  
	Class.forName(DRIVER);  
	con= DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);  
	}catch(Exception e){}  
	}  
	  
	public static Connection getCon(){  
	    return con;  
	}  
}
