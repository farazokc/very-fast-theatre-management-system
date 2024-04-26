package com.VeryFAST.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.VeryFAST.web.model.TypeDetails;

public class TypeDetailsDao {
    private static String url = "jdbc:mysql://localhost:3306/veryfast_tms";
    private static String username = "root";
    private static String password = "fast";
    private static String query;
    
	public static ArrayList<TypeDetails> getTypeDetails() throws ClassNotFoundException, SQLException {
        ArrayList<TypeDetails> arr = new ArrayList<TypeDetails>();

        int TypeID;
    	String Type;
    	int Price;

        query = "select * from veryfast_tms.typedetails";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        try {
            while (rs.next()) {
            	TypeID = rs.getInt(1);
            	Type = rs.getString(2);
            	Price = rs.getInt(3);
           

                arr.add(new TypeDetails(TypeID, Type, Price));
            }
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return arr;
    }
	
	public static TypeDetails getTypeDetail(int id) throws ClassNotFoundException, SQLException {
        TypeDetails m = new TypeDetails();

        query = "select * from veryfast_tms.TypeDetails where TypeID = '"+ id + "';";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, username, password);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        try {
        	if(rs.next()) {
				m.setTypeID(rs.getInt("TypeID"));
				m.setType(rs.getString("Type"));
				m.setPrice(rs.getInt("Price"));
			}
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        }

        return m;
    }
	
	public static void addNewType(TypeDetails td) throws ClassNotFoundException, SQLException {
		String query;

		query = "INSERT INTO veryfast_tms.typedetails VALUES ('" + td.getTypeID() + "', '" + td.getType() + "', '"
				+ td.getPrice() + "');";

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
	
	public static void editType(TypeDetails td, int typeID) throws ClassNotFoundException, SQLException {
		String query;

		query = "UPDATE veryfast_tms.typedetails SET Type = '" + td.getType() + "', "
				+ "Price = '" + td.getPrice() + "' WHERE typeID = '" + typeID + "';";
				

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
	
	public static boolean typeExists(int typeID) throws ClassNotFoundException, SQLException {

        query = "select typeid from veryfast_tms.typedetails where typeid = '" + typeID + "'";

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
