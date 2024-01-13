package com.vaccination;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
	
	public static Connection getMyConnection() throws SQLException, ClassNotFoundException{
		
		Connection con = null;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VaccinationProcess","root","root");
		
		return con;
		
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		System.out.println(getMyConnection());
		
	}
	
}
