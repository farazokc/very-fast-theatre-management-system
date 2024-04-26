package com.VeryFAST.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.VeryFAST.web.model.Cinema;

public class CinemaDao {
    private static String url = "jdbc:mysql://localhost:3306/veryfast_tms";
    private static String username = "root";
    private static String password = "fast";
    private static String query;
    
	public static ArrayList<Cinema> getCinemas() throws ClassNotFoundException, SQLException {
        ArrayList<Cinema> arr = new ArrayList<Cinema>();

        int CinemaID;
    	String CinemaName;
    	int NoOfSeats;
    	int BranchID;
    	int TypeID;

        query = "select * from veryfast_tms.cinema";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        try {
            while (rs.next()) {
            	CinemaID = rs.getInt(1);
            	CinemaName = rs.getString(2);
            	NoOfSeats = rs.getInt(3);
            	BranchID = rs.getInt(4);
            	TypeID = rs.getInt(5);

           

                arr.add(new Cinema(CinemaID, CinemaName, NoOfSeats, BranchID, TypeID));
            }
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return arr;
    }
	
	public static Cinema getCinema(int id) throws ClassNotFoundException, SQLException {
        Cinema m = new Cinema();

        query = "select * from veryfast_tms.Cinema where CinemaID = '"+ id + "'; ";
       

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        try {
        	if(rs.next()) {
				m.setCinemaID(rs.getInt("CinemaID"));
				m.setCinemaName(rs.getString("CinemaName"));
				m.setNoOfSeats(rs.getInt("NoOfSeats"));
            	m.setBranchID(rs.getInt("BranchID"));
            	m.setTypeID(rs.getInt("TypeID"));
			}
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return m;
    }
}
