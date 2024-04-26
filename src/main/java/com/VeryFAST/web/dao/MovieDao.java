package com.VeryFAST.web.dao;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import com.VeryFAST.web.model.Movie;
import com.VeryFAST.web.model.Schedule;

public class MovieDao {
	static String url = "jdbc:mysql://localhost:3306/veryfast_tms";
	static String username = "root";
	static String password = "fast";

	public static Movie getLatestMovie() {
		String query;
		Movie m = new Movie();

		query = "Select * From movie where MovieID = (Select MAX(MovieID) from movie);";

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, username, password);

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			if (rs.next()) {
				m.setMovieID(rs.getInt("MovieID"));
				m.setMovieName(rs.getString("MovieName"));
				m.setGenre(rs.getString("Genre"));
				m.setLink(rs.getString("Link"));
				m.setDuration(rs.getFloat("Duration"));
				m.setMainChar(rs.getString("MainChar"));
				m.setDescription(rs.getString("Description"));
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return m;
	}

	public static void addNewMovie(Movie mov) throws ClassNotFoundException {
		String query;

		query = "INSERT INTO veryfast_tms.movie VALUES ('" + mov.getMovieID() + "','"
				+ mov.getMovieName() + "','" + mov.getGenre() + "','" + mov.getLink()
				+ "', '" + mov.getDuration() + "', '" + mov.getMainChar() + "',  '"
				+ mov.getDescription() + "');";
				
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

	public static void editMovie(Movie mov, int oldMovID) throws ClassNotFoundException {
		String query;

		query = "UPDATE veryfast_tms.movie SET MovieName = '" + mov.getMovieName()
				+ "', Genre = '" + mov.getGenre() + "', " + " Link =  '" + mov.getLink() + "', Duration = '"
				+ mov.getDuration() + "', MainChar = '" + mov.getMainChar() + "', Description = '" + mov.getDescription()
				+ "' where movieID = '"+oldMovID+"';";
		
		System.out.println(query);

//		query = "INSERT INTO veryfast_tms.movie VALUES (MovieID = " + mov.getMovieID() + ", MovieName = "
//				+ mov.getMovieID() + ", Genre = " + mov.getGenre() + ", " + " Link =  " + mov.getLink()
//				+ ", Duration = " + mov.getDuration() + ", MainChar = " + mov.getMainChar() + ", Description = "
//				+ mov.getDescription() + ");";

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

	public static Movie getMovie(int id) throws ClassNotFoundException, SQLException {
		Movie m = new Movie();

		String query = "select * from veryfast_tms.movie where MovieID = '" + id + "';";

		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection(url, username, password);

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);

		try {
			if (rs.next()) {
				m.setMovieID(rs.getInt("MovieID"));
				m.setMovieName(rs.getString("MovieName"));
				m.setGenre(rs.getString("Genre"));
				m.setLink(rs.getString("Link"));
				m.setDuration(rs.getFloat("Duration"));
				m.setMainChar(rs.getString("MainChar"));
				m.setDescription(rs.getString("Description"));
			}
		} catch (SQLException se) {
			System.out.println("SQL Exception occurred");
			se.printStackTrace();
		}

		return m;
	}
	
	public static ArrayList<Movie> getMovies() throws ClassNotFoundException, SQLException {
		ArrayList<Movie> scd = new ArrayList<Movie>();
		String query;

		int MovieID;
		String MovieName;
		String Genre;
		String Link;
		float Duration;
		String MainChar;
		String Description;

		query = "select * from veryfast_tms.movie";

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, username, password);

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				MovieID = rs.getInt(1);
				MovieName = rs.getString(2);
				Genre = rs.getString(3);
				Link = rs.getString(4);
				Duration = rs.getFloat(5);
				MainChar = rs.getString(6);
				Description = rs.getString(7);
				
				
				scd.add(new Movie(MovieID, MovieName, Genre, Link, Duration, MainChar, Description));
			}
		} catch (SQLException se) {
			System.out.println("SQL Exception occurred");
			se.printStackTrace();
		}
		return scd;
	}
	public  static int getMovieId(String name) throws ClassNotFoundException, SQLException
	{
		String query = "select movieid from veryfast_tms.movie where MovieName = '"+name+"'";

		int id = 0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		Statement st = con.createStatement();
		
		ResultSet rs = st.executeQuery(query);
		
		while(rs.next())
		{
			id = rs.getInt("MovieID");
		}
		return id;
		
	}
	
	public static boolean movieExists(int movieID) throws ClassNotFoundException, SQLException {

        String query = "select movieid from veryfast_tms.typedetails where movieid = '" + movieID + "'";

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
