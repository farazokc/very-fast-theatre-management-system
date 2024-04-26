package com.VeryFAST.web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import com.VeryFAST.web.model.Account;

public class AccountDao {
	static String url = "jdbc:mysql://localhost:3306/veryfast_tms";
	static String username = "root";
	static String password = "fast";
	
	public static Account getCeoName() throws SQLException, ClassNotFoundException {
		Account ceo = new Account();
		String query;
		Date dt;
		LocalDate ld;

		query = "select * from veryfast_tms.account where Type = 'CEO'";

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, username, password);

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			if (rs.next()) {
				ceo.setAccountName(rs.getString("AccountName"));
				ceo.setEmail(rs.getString("Email"));
				ceo.setPass(rs.getString("Pass"));
				ceo.setType(rs.getString("Type"));
				dt = rs.getDate(4);
				ld = dt.toLocalDate();
				ceo.setDOB(ld);
				ceo.setPhone(rs.getInt("Phone"));
			}
		} catch (SQLException se) {
			System.out.println("SQL Exception Encountered");
			se.printStackTrace();
		}

		return ceo;
	}
	
	public static Account getAdminName() throws SQLException, ClassNotFoundException {
		Account admin = new Account();
		String query;
		Date dt;
		LocalDate ld;

		query = "select * from veryfast_tms.account where Type = 'Manager'";

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, username, password);

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			if (rs.next()) {
				admin.setAccountName(rs.getString("AccountName"));
				admin.setEmail(rs.getString("Email"));
				admin.setPass(rs.getString("Pass"));
				admin.setType(rs.getString("Type"));
				
				dt = rs.getDate(4);
				ld = dt.toLocalDate();
				
				admin.setDOB(ld);
				admin.setPhone(rs.getInt("Phone"));
			}
		} catch (SQLException se) {
			System.out.println("SQL Exception Encountered");
			se.printStackTrace();
		}

		return admin;
	}
	
	public static ArrayList<Account> getPendingAccounts() throws ClassNotFoundException{
		ArrayList<Account> scd = new ArrayList<Account>();
		
		String query;
		String email;
		String pwd;
		String AccountName;
		Date dt;
		LocalDate ld;
		int Phone;
		String Type;
		
		query = "select * from veryfast_tms.account where Type = 'Pending'";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, username, password);

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			if (rs.next()) {
				AccountName = rs.getString("AccountName"); 
				email = rs.getString("Email");
				pwd = rs.getString("Pass");
				Type = rs.getString("Type");
				
				dt = rs.getDate(4);
				ld = dt.toLocalDate();
				
				Phone = rs.getInt("Phone");
				
				scd.add(new Account(email, pwd, AccountName, ld, Phone, Type));
			}
		} catch (SQLException se) {
			System.out.println("SQL Exception Encountered");
			se.printStackTrace();
		}
		
		return scd;
	}
	
	public static boolean checkAccountsForNewEntry(String checkEmail) throws ClassNotFoundException
	{
		boolean check = true;
		
		String query = "select Email from veryfast_tms.account where Email = '"+checkEmail+"'";

		try 
		{
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, username, password);

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			
			while (rs.next())
			{
				check = false;
			}
			
		} 
		catch (SQLException se) 
		{
			System.out.println("SQL Exception Encountered");
			se.printStackTrace();
		}
		return check;
	}
	public static int addNewAccount(String name, String email,String pass, String phone, String Dob,String type) throws ClassNotFoundException
	{
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, username, password);
			
			String query = "insert into veryfast_tms.account values ('"+email+"','"+pass+"','"+name+"','"+Dob+"','"+phone+"','"+type+"');";
			Statement st = con.createStatement();
			int i = st.executeUpdate(query);
			return i;
			
			
		} 
		catch (SQLException se) 
		{
			System.out.println("SQL Exception Encountered2");
			se.printStackTrace();
		}
		return 0;
		
	}
	public static int checkAccountForLogin(String email,String pass) throws ClassNotFoundException
	{
		boolean check = false;
		try 
		{
			String t_email = null;
			String t_pwd = null;
			String t_type = null;
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, username, password);
			
			String query = "select * from veryfast_tms.account where Email = '"+email+"'";
			
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while (rs.next())
			{
				check = true;
				t_email = rs.getString("Email");
				t_pwd = rs.getString("Pass");
				t_type = rs.getString("Type");
				
			}
			if(check == false)
			{
				return 0;
			}
			else if((t_email.equals(email))&&((pass.equals(t_pwd)))&&t_type.equals("CEO"))
			{
				return 5;
			}
			else if((t_email.equals(email))&&((pass.equals(t_pwd)))&&t_type.equals("Manager"))
			{
				return 4;
			}
			else if((t_email.equals(email))&&((pass.equals(t_pwd)))&&t_type.equals("Pending"))
			{
				return 3;
			}
			else if((t_email.equals(email))&&((pass.equals(t_pwd)))&&t_type.equals("Customer"))
			{

				return 2;
			}
			else if(t_email.equals(email))
			{
				return 1;
			}
			else
			{
				return 0;
			}
			
			
			
		} 
		catch (SQLException se) 
		{
			System.out.println("SQL Exception Encountered2");
			se.printStackTrace();
		}
		return 0;
		
	}
	public static int approvePendingAccounts(String email) throws ClassNotFoundException{
        String query = "update veryfast_tms.account set Type = 'Manager' where Email = '" + email + "';";
        int result = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection(url, username, password);

            System.out.println("DAO email:" + email);

            Statement st = con.createStatement();
            result = st.executeUpdate(query);
            System.out.println("DAO result: " + result + " accounts changed");

        } catch (SQLException se) {
            System.out.println("SQL Exception Encountered");
            se.printStackTrace();
        }

        return result;
    }
}
