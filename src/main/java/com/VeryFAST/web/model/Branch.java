package com.VeryFAST.web.model;

public class Branch {
	private int BranchID;
	private String Area;
	private String City;
	
	public Branch(int branchID, String area, String city) {
		super();
		BranchID = branchID;
		Area = area;
		City = city;
	}
	
	public Branch() {
		// TODO Auto-generated constructor stub
	}

	public int getBranchID() {
		return BranchID;
	}
	public void setBranchID(int branchID) {
		BranchID = branchID;
	}
	public String getArea() {
		return Area;
	}
	public void setArea(String area) {
		Area = area;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	@Override
	public String toString() {
		return "Branch [BranchID=" + BranchID + " > " + Area + " in " + City + "]";
	}
}
