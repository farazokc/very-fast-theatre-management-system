package com.VeryFAST.web.model;
import java.time.*;

public class Account {
	private String Email;
	private String Pass;
	private String AccountName;
	private LocalDate DOB;
	private int Phone;
	private String Type;
	
	public Account(String email, String pass, String accountName, LocalDate dOB, int phone, String type) {
		super();
		Email = email;
		Pass = pass;
		AccountName = accountName;
		DOB = dOB;
		Phone = phone;
		Type = type;
	}
	
	public Account() {
		
	}
	
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPass() {
		return Pass;
	}
	public void setPass(String pass) {
		Pass = pass;
	}
	public String getAccountName() {
		return AccountName;
	}
	public void setAccountName(String accountName) {
		AccountName = accountName;
	}
	public LocalDate getDOB() {
		return DOB;
	}
	public void setDOB(LocalDate dOB) {
		DOB = dOB;
	}
	public int getPhone() {
		return Phone;
	}
	public void setPhone(int phone) {
		Phone = phone;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	
	@Override
	public String toString() {
		return AccountName;
	}
}
