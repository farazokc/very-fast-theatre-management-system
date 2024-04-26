package com.VeryFAST.web.model;

public class Cinema {
	private int CinemaID;
	private String CinemaName;
	private int NoOfSeats;
	private int BranchID;
	private int TypeID;
	
	public Cinema(int cinemaID, String cinemaName, int noOfSeats, int branchID, int typeID) {
		super();
		CinemaID = cinemaID;
		CinemaName = cinemaName;
		NoOfSeats = noOfSeats;
		BranchID = branchID;
		TypeID = typeID;
	}
	
	public Cinema() {
		
	}
	
	public int getCinemaID() {
		return CinemaID;
	}
	public void setCinemaID(int cinemaID) {
		CinemaID = cinemaID;
	}
	public String getCinemaName() {
		return CinemaName;
	}
	public void setCinemaName(String cinemaName) {
		CinemaName = cinemaName;
	}
	public int getNoOfSeats() {
		return NoOfSeats;
	}
	public void setNoOfSeats(int noOfSeats) {
		NoOfSeats = noOfSeats;
	}
	public int getBranchID() {
		return BranchID;
	}
	public void setBranchID(int branchID) {
		BranchID = branchID;
	}
	public int getTypeID() {
		return TypeID;
	}
	public void setTypeID(int typeID) {
		TypeID = typeID;
	}
	
	@Override
	public String toString() {
		return "Cinema [CinemaID=" + CinemaID + ", CinemaName=" + CinemaName +", BranchID=" + BranchID + ", TypeID=" + TypeID + "]";
	}
}
