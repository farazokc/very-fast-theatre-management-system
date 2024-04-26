package com.VeryFAST.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.VeryFAST.web.model.Review;
import com.VeryFAST.web.model.Seat;

public class ReviewDao {
    private static String url = "jdbc:mysql://localhost:3306/veryfast_tms";
    private static String username = "root";
    private static String password = "fast";
    private static String query;
	private static ArrayList<String> movieName;
    
    public static ArrayList<Review> getMovieReviews(int movieeID) throws ClassNotFoundException, SQLException 
    {
        ArrayList<Review> arr = new ArrayList<Review>();

        String Email;
    	int MovieID;
    	int Stars;
    	String Text;

        query = "select * from veryfast_tms.Review where MovieID = '" + movieeID +"';";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        try {
            while (rs.next()) {
            	Email = rs.getString(1);
            	MovieID = rs.getInt(2);
            	Stars = rs.getInt(3);
            	Text = rs.getString(4);
            	
           

            	arr.add(new Review(Email, MovieID, Stars, Text));
            }
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return arr;
    }
    public static ArrayList<String> getWatchedMoviesOfUser(String email) throws ClassNotFoundException, SQLException
    {
    	ArrayList<String> movieName = new ArrayList<String>();
    	String t_name;
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection(url, username, password);
    	
    	query = " Select m.MovieName from movie m, schedule sc, history h where h.scheduleID = sc.scheduleID and h.email in (select email from history) and sc.movieID not in(select movieID from review) and m.movieid = sc.movieid and h.email = '"+email+"';";
    			
    	Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        
        while(rs.next())
        {
        	t_name = rs.getString("m.MovieName");
        	movieName.add(t_name);
        }
        for(int i=0;i<movieName.size();i++)
        {
        	movieName.get(i);
        }
        return movieName;
    	

    	
    }
    
    public static void addReview(String name,int id,String star,String comment) throws ClassNotFoundException, SQLException
    {
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection(url, username, password);
    	
    	query = "insert into Review values('"+name+"',"+id+",'"+star+"','"+comment+"');";
    	 System.out.println(query);		
    	Statement st = con.createStatement();
        int i = st.executeUpdate(query);
        
        System.out.println(i+" row upadted");
    }
}
