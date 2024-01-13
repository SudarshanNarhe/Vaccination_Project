package com.vaccination;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;


public class Booking_Process {
	
	int city_id;
	int slot_id;
	int center_id;
	int booking_id;
	String aadhar;
	Date booking_date;
	
	Connection con;
	Statement st;
	ResultSet rs;
	String sql;
	PreparedStatement ps;
	CallableStatement cs;
	
	public void showCities() throws ClassNotFoundException, SQLException {
		
		con=MyConnection.getMyConnection();
		
		sql= " select * from city ";
		
		st=con.createStatement();
		rs=st.executeQuery(sql);
		
		System.out.printf("%-10s %-20s %-10s\n", "City Id", "City Name", "State");

		System.out.println("________________________________________________");
		while(rs.next()) {
			
			
			System.out.printf("%-10d %-20s %-10s\n",rs.getInt(1),rs.getString(2),rs.getString(3));
			
		}
		System.out.println("________________________________________________");

	}
	
	public void select_center(Scanner sc) throws ClassNotFoundException, SQLException {
		System.out.println("\nEnter a city Id : ");
		city_id=sc.nextInt();
		con=MyConnection.getMyConnection();
		
		sql=" select * from vaccination_center "
				+ " where city_id = ? ;";
		
		ps=con.prepareStatement(sql);
		ps.setInt(1, city_id);
		
		rs=ps.executeQuery();
		System.out.printf("%-10s %-35s %-25s %-25s\n", "CentreId", "CentreName", "Location", "CityId");
		System.out.println("__________________________________________________________________________________________");
		
		while(rs.next()) {
			System.out.printf("%-10d %-35s %-25s %-25d\n",rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4));
		}
		System.out.println("____________________________________________________________________________________________");

	}
	
	public void displaySlot(Scanner sc) throws ClassNotFoundException, SQLException {
		
		System.out.println("\nEnter a date for booking a slot in the form of yyyy-mm-dd : ");
		booking_date=Date.valueOf(sc.next());
		System.out.println("Enter a Center ID : ");
		center_id=sc.nextInt();
		con=MyConnection.getMyConnection();
		
		sql = "{ call show_Slots (?,?) }";
		
		cs=con.prepareCall(sql);
		cs.setDate(1, booking_date);
		cs.setInt(2, center_id);
		
		rs=cs.executeQuery();
		System.out.println("Available Slots are \n");
		System.out.printf("%-10s %-35s \n", "SlotId ", "Time");
		System.out.println("_________________________");

		while(rs.next()) {
			
			System.out.printf("%-10s %-35s \n",rs.getInt(1),rs.getTime(2));
			
		}
		System.out.println("_________________________");
		System.out.println("Enter a Slot id for book : ");
		slot_id=sc.nextInt();

	}
	
	public void insertUser(Scanner sc) throws ClassNotFoundException, SQLException {
		
		System.out.println("Enter Your Aadhar No : ");
		aadhar=sc.next();
		System.out.println("Enter Your First Name : ");
		String firstname = sc.next();
		System.out.println("Enter Your Last Name : ");
		String lastname = sc.next();
		System.out.println("Enter Your Birthday in form of yyyy-mm-dd : ");
		Date DOB=Date.valueOf(sc.next());
		System.out.println("Enter Your Mobile No : ");
		String mob=sc.next();
		System.out.println("Enter Your Mail : ");
		String mail=sc.next();
		
		con=MyConnection.getMyConnection();
		
		sql=" insert into user values (?,?,?,?,?,?);";
		ps=con.prepareStatement(sql);
		ps.setString(1, aadhar);
		ps.setString(2, firstname);
		ps.setString(3, lastname);
		ps.setDate(4, DOB);
		ps.setString(5, mob);
		ps.setString(6, mail);
		
		int a =ps.executeUpdate();
		if(a>0) {
			System.out.println("User registration successfully....");
		}
		else
			System.out.println("You have already register a data");
		
	}
	public void showUser(Scanner sc) throws ClassNotFoundException, SQLException {
//		System.out.println("Do you want to show your details \nChoose option from below : \n1.Yes        2.No");
//		int choice=sc.nextInt();
//		if(choice==1) {
		System.out.println("Enter Your Aadhar No : ");
		aadhar=sc.next();
		
		con=MyConnection.getMyConnection();
		sql = "Select * from user "
				+ " where AadharNo = ? ;";
		ps=con.prepareStatement(sql);
		ps.setString(1, aadhar);
		rs=ps.executeQuery();
		while(rs.next()) {
			System.out.println("AadharNo : "+rs.getString(1)+"\nFirstName : "+rs.getString(2)+"\nLastName : "+rs.getString(3)+"\nDOB : "+rs.getDate(4)+"\nMobileNo : "+rs.getString(5)+"\nMail : "+rs.getString(6));
		}
//	  }
	
		
	}
	
	public void bookingslots() throws ClassNotFoundException, SQLException {
		
		con=MyConnection.getMyConnection();
		sql="insert into slot_booking (AadharNo,Booking_Date,Center_id,slot_id) values (?,?,?,?);";
		
		ps=con.prepareStatement(sql);
		ps.setString(1, aadhar);
		ps.setDate(2, booking_date);
		ps.setInt(3, center_id);
		ps.setInt(4, slot_id);
		
		int a = ps.executeUpdate();
		if(a>0) {
			System.out.println("Slot booked Successfully");
		}
		else
			System.out.println("Invalid Criteria");
			
	}
	public void showBookingDetails(Scanner sc) throws ClassNotFoundException, SQLException {
//		System.out.println("Do you want to show your booking details \nChoose option from below : \n1.Yes        2.No");
//		int choice=sc.nextInt();
//		if(choice==1) {
		System.out.println("Enter Your Aadhar No : ");
		aadhar=sc.next();
		con=MyConnection.getMyConnection();
		sql = "Select * from slot_booking "
				+ " where AadharNo = ? ;";
		ps=con.prepareStatement(sql);
		ps.setString(1, aadhar);
		rs=ps.executeQuery();
		while(rs.next()) {
			
			System.out.println("BookingID : "+rs.getInt(1)+"\nAadharNo : "+rs.getString(2)+"\nBooking Date : "+rs.getDate(3)+"\nCenter ID : "+rs.getInt(4)+"\nSlot ID : "+rs.getInt(5));
			
		}
//	 }
		
		
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("**********************  Booking Process  ****************************");
		Booking_Process book = new Booking_Process();
		
		System.out.println("Press 1 for book vaccination slots \nPress 2 for check User details \nPress 3 for check Booking details");
		int choice=sc.nextInt();
		switch(choice) {
		case 1 : book.showCities();
				book.select_center(sc);
				book.displaySlot(sc);
				book.insertUser(sc);
				book.bookingslots();
		break;
		case 2 : book.showUser(sc); break;
		
		case 3 : book.showBookingDetails(sc); break;
		
		default : System.out.println("Thank you for visited....");
		
		}
		
		
		
		
		
	}
	
}
