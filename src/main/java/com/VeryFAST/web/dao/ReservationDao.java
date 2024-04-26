package com.VeryFAST.web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;

import com.VeryFAST.web.model.Reservation;
import com.VeryFAST.web.model.Schedule;

public class ReservationDao {
    private static String url = "jdbc:mysql://localhost:3306/veryfast_tms";
    private static String username = "root";
    private static String password = "fast";
    private static String query;
    
    public static ArrayList<Reservation> getReservations() throws ClassNotFoundException, SQLException {
        ArrayList<Reservation> arr = new ArrayList<Reservation>();

        String ReservationID;
    	int ScheduleID;
    	int SeatID;
    	String Email;
    	int GuestID;

        query = "select * from veryfast_tms.Reservation";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        try {
            while (rs.next()) {
            	ReservationID = rs.getString(1);
            	ScheduleID = rs.getInt(2);
            	SeatID = rs.getInt(3);
            	Email = rs.getString(4);
            	GuestID = rs.getInt(5);
            	
                arr.add(new Reservation(ReservationID, ScheduleID, SeatID, Email, GuestID));
            }
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return arr;
    }
    
    public static Reservation getReservation(int id) throws ClassNotFoundException, SQLException {
        Reservation m = new Reservation();

        query = "select * from veryfast_tms.Reservation where ReservationID = '"+ id + "'";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        
        try {
        	if(rs.next()) {
				m.setReservationID(rs.getString("ReservationID"));
				m.setScheduleID(rs.getInt("ScheduleID"));
				m.setSeatID(rs.getInt("SeatID"));
				m.setEmail(rs.getString("Email"));
				m.setGuestID(rs.getInt("GuestID"));
			}
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return m;       
        
    }
    
    public static String getReservationID(int schedID, int seatID) throws ClassNotFoundException, SQLException {
        String ans = "";

        query = "select ReservationID from veryfast_tms.Reservation where ScheduleID = '" + schedID + "' and SeatID = '" + seatID + "';";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        
        try {
        	if(rs.next()) {
				ans = rs.getString("ReservationID");
			}
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return ans;       
        
    }
    
    public static String addReservation(int scID, int sID, String email, String emailType) throws ClassNotFoundException, SQLException {
    	
    	String whoseEmail = "Email";
    	
		if(emailType.equals("G")) 
		{
			whoseEmail = "GuestID";
		}

		query = "INSERT INTO `veryfast_tms`.`reservation` (`ScheduleID`, `SeatID`, `" + whoseEmail + "`) VALUES ('" + scID + "', '" + sID + "', '" + email + "');";

		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, username, password);

			Statement st = con.createStatement();
			int count = st.executeUpdate(query);
			System.out.println(count + " rows were added/updated");
		} catch (SQLException se) {
			System.out.println("SQL Exception occurred");
			se.printStackTrace();
		}
		
		return getReservationID(scID, sID);
		
	}
    
    public static Reservation findReservationID(String resID) throws ClassNotFoundException, SQLException {
        Reservation ans = new Reservation();

        query = "select * from veryfast_tms.Reservation where ReservationID = '" + resID + "'";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        
        try {
        	if(rs.next()) {
				ans.setReservationID(rs.getString("ReservationID"));
				ans.setScheduleID(rs.getInt("ScheduleID"));
				ans.setSeatID(rs.getInt("SeatID"));
				ans.setEmail(rs.getString("Email"));
				ans.setGuestID(rs.getInt("GuestID"));
			}
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return ans;       
        
    }
}
