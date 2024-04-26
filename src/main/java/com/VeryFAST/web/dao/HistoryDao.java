package com.VeryFAST.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.VeryFAST.web.model.History;

public class HistoryDao {
	public static ArrayList<History> getHistory() throws ClassNotFoundException, SQLException {
		ArrayList<History> scd = new ArrayList<History>();
		String url = "jdbc:mysql://localhost:3306/veryfast_tms";
		String username = "root";
		String password = "fast";
		String query;

		String RecordID;
		int ScheduleID;
		int SeatID;
		String Email;
		int GuestID;
		int Price;

		query = "select * from veryfast_tms.history";

		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection(url, username, password);

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);

		try {
			while (rs.next()) {
				RecordID = rs.getString(1);
				ScheduleID = rs.getInt(2);
				SeatID = rs.getInt(3);
				Email = rs.getString(4);
				GuestID = rs.getInt(5);
				Price = rs.getInt(6);

				scd.add(new History(RecordID, ScheduleID, SeatID, Email, GuestID, Price));
			}
		} catch (SQLException se) {
			System.out.println("SQL Exception occurred");
			se.printStackTrace();
		}

		return scd;
	}
	
	public static int getRevenue() throws ClassNotFoundException, SQLException {
		int revenue = 0;
		
		String url = "jdbc:mysql://localhost:3306/veryfast_tms";
		String username = "root";
		String password = "fast";
		String query;
		
		query = "select sum(Price) from veryfast_tms.history";
		
		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection(url, username, password);

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		
		while(rs.next()) {
			revenue = rs.getInt(1);
		}
		
		return revenue;
	}
}
