package com.VeryFAST.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.VeryFAST.web.model.Seat;

public class SeatDao {
    private static String url = "jdbc:mysql://localhost:3306/veryfast_tms";
    private static String username = "root";
    private static String password = "fast";
    private static String query;
    
    public static ArrayList<Seat> getSeats() throws ClassNotFoundException, SQLException {
        ArrayList<Seat> arr = new ArrayList<Seat>();

        int SeatID;
    	char Row;
    	char Column;
    	int CinemaID;

        query = "select * from veryfast_tms.Seat";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        try {
            while (rs.next()) {
            	SeatID = rs.getInt(1);
            	Row = rs.getString(2).charAt(0);
            	Column = rs.getString(3).charAt(0);
            	CinemaID = rs.getInt(4);

                arr.add(new Seat(SeatID, Row, Column, CinemaID));
            }
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return arr;
    }
	
	public static Seat getSeat(int id) throws ClassNotFoundException, SQLException {
        Seat m = new Seat();

        query = "select * from veryfast_tms.Seat where SeatID = '"+ id + "'";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        try {
        	if(rs.next()) {
				m.setSeatID(rs.getInt("SeatID"));
				m.setRow(rs.getString("Row").charAt(0));
				m.setColumn(rs.getString("Column").charAt(0));
            	m.setCinemaID(rs.getInt("CinemaID"));
			}
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return m;
    }
	
	public static ArrayList<Seat> getFreeSeats(int s) throws ClassNotFoundException, SQLException {
        ArrayList<Seat> arr = new ArrayList<Seat>();

        int SeatID;
    	char Row;
    	char Column;
    	int CinemaID;
    	
    	String schedID = Integer.toString(s);

        query = "Select s.* from veryfast_tms.seat s, veryfast_tms.schedule sc, veryfast_tms.cinema c where sc.cinemaid = c.cinemaid and s.cinemaid=c.cinemaid and ";
        query+= "sc.scheduleid= '" + schedID + "' and s.seatID not in (Select r.seatID from veryfast_tms.reservation r where r.scheduleID='" + schedID +"')";
        
        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        try {
            while (rs.next()) {
            	SeatID = rs.getInt(1);
            	Row = rs.getString(2).charAt(0);
            	Column = rs.getString(3).charAt(0);
            	CinemaID = rs.getInt(4);

                arr.add(new Seat(SeatID, Row, Column, CinemaID));
            }
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return arr;
    }
}
