package com.VeryFAST.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.VeryFAST.web.model.Branch;

public class BranchDao {
    private static String url = "jdbc:mysql://localhost:3306/veryfast_tms";
    private static String username = "root";
    private static String password = "fast";
    private static String query;
    
	public static ArrayList<Branch> getBranches() throws ClassNotFoundException, SQLException {
        ArrayList<Branch> arr = new ArrayList<Branch>();

        int BranchID;
    	String Area;
    	String City;

        query = "select * from veryfast_tms.branch";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        try {
            while (rs.next()) {
            	BranchID = rs.getInt(1);
            	Area = rs.getString(2);
            	City = rs.getString(3);         

                arr.add(new Branch(BranchID, Area, City));
            }
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return arr;
    }
	
	public static Branch getBranch(int id) throws ClassNotFoundException, SQLException {
        Branch b = new Branch();

        query = "select * from veryfast_tms.Branch where BranchID = '"+ id + "';";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        try {
        	if(rs.next()) {
				b.setBranchID(rs.getInt("BranchID"));
				b.setArea(rs.getString("Area"));
				b.setCity(rs.getString("City"));
			}
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return b;
    }

}
