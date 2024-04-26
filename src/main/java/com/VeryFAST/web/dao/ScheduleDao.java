package com.VeryFAST.web.dao;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import com.VeryFAST.web.model.Schedule;

public class ScheduleDao {
    private static String url = "jdbc:mysql://localhost:3306/veryfast_tms";
    private static String username = "root";
    private static String password = "fast";
    private static String query;
    
	public static ArrayList<Schedule> getSchedule() throws ClassNotFoundException, SQLException {
        ArrayList<Schedule> scd = new ArrayList<Schedule>();

        int ScheduleID;
        int CinemaID;
        int MovieID;
        Time time;
        Date date;
        LocalDate ld;
        LocalTime lt;

        query = "select * from veryfast_tms.schedule";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);

        try {
            while (rs.next()) {
                ScheduleID = rs.getInt(1);
                CinemaID = rs.getInt(2);
                MovieID = rs.getInt(3);
                time = rs.getTime(4);
                lt = time.toLocalTime();

                date = rs.getDate(5);
                ld = date.toLocalDate();

                scd.add(new Schedule(ScheduleID, CinemaID, MovieID, lt, ld));
            }
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return scd;
	}
	
	public static ArrayList<Schedule> getLatestSchedule() throws ClassNotFoundException, SQLException {
        ArrayList<Schedule> scd = new ArrayList<Schedule>();

        int ScheduleID;
        int CinemaID;
        int MovieID;
        Time time;
        Date date;
        LocalDate ld;
        LocalTime lt;

        query = "select * from schedule s where concat(s.date, ' ', s.time)>concat(curdate(), ' ', curtime());";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);

        try {
            while (rs.next()) {
                ScheduleID = rs.getInt(1);
                CinemaID = rs.getInt(2);
                MovieID = rs.getInt(3);
                time = rs.getTime(4);
                lt = time.toLocalTime();

                date = rs.getDate(5);
                ld = date.toLocalDate();

                scd.add(new Schedule(ScheduleID, CinemaID, MovieID, lt, ld));
            }
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return scd;
	}
	
	public static ArrayList<Schedule> getScheduleConditional(String field, String value) throws ClassNotFoundException, SQLException {
        ArrayList<Schedule> scd = new ArrayList<Schedule>();

        int ScheduleID;
        int CinemaID;
        int MovieID;
        Time time;
        Date date;
        LocalDate ld;
        LocalTime lt;

        query = "select s.* from schedule s, cinema c, movie m, branch b, typedetails t where s.CinemaID=c.CinemaID and s.MovieID=m.MovieID and c.BranchID=b.BranchID and c.TypeID=t.TypeID and " + field + " REGEXP '^" + value + "$';";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);

        try {
            while (rs.next()) {
                ScheduleID = rs.getInt(1);
                CinemaID = rs.getInt(2);
                MovieID = rs.getInt(3);
                time = rs.getTime(4);
                lt = time.toLocalTime();

                date = rs.getDate(5);
                ld = date.toLocalDate();

                scd.add(new Schedule(ScheduleID, CinemaID, MovieID, lt, ld));
            }
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return scd;
	}
	
	public static void addNewSchedule(Schedule s) throws ClassNotFoundException, SQLException {
		String query;
		System.out.println("Before everything");
		// we get LocalTime
		// we convert to Time
		// we send it to table

		Time time = Time.valueOf(s.getTime());
		Date date = Date.valueOf(s.getDate()); // Magic happens here!

		query = "INSERT INTO veryfast_tms.schedule VALUES ('" + s.getScheduleID() + "', '" + s.getCinemaID() + "', '"
				+ s.getMovieID() + "', '" + time + "', '" + date + "');";
		
		System.out.println(query);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, username, password);

			Statement st = con.createStatement();
			int rs = st.executeUpdate(query);
		} catch (SQLException se) {
			System.out.println("SQL Exception occurred");
			se.printStackTrace();
		}
	}

	public static void editSchedule(Schedule s, int oldSID) throws ClassNotFoundException, SQLException {
		String query;

		Time time = Time.valueOf(s.getTime());
		Date date = Date.valueOf(s.getDate()); // Magic happens here!

		query = "UPDATE veryfast_tms.schedule SET CinemaID = '" + s.getCinemaID()
				+ "', MovieID = '" + s.getMovieID() + "', " + "Time = '" + time + "', Date = '" + date + "' WHERE ScheduleID = '"+ oldSID +"';";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, username, password);

			Statement st = con.createStatement();
			int rs = st.executeUpdate(query);
		} catch (SQLException se) {
			System.out.println("SQL Exception occurred");
			se.printStackTrace();
		}
	}
	
	public static boolean scheduleExists(int schedID) throws ClassNotFoundException, SQLException {

        query = "select scheduleid from veryfast_tms.schedule where scheduleid = '" + schedID + "'";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);

        try {
            while (rs.next()) {
                return true;
            }
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return false;
	}
}
