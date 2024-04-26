package com.VeryFAST.web.model;

public class History 
{
	private String RecordID;
	private int ScheduleID;
	private int SeatID;
	private String Email;
	private int GuestID;
	private int Price;
	
	public History(String recordID, int scheduleID, int seatID, String email, int guestID, int price) {
		super();
		RecordID = recordID;
		ScheduleID = scheduleID;
		SeatID = seatID;
		Email = email;
		GuestID = guestID;
		Price = price;
	}
	
	public History() {
		
	}
	
	public String getRecordID() {
		return RecordID;
	}
	public void setRecordID(String recordID) {
		RecordID = recordID;
	}
	public int getScheduleID() {
		return ScheduleID;
	}
	public void setScheduleID(int scheduleID) {
		ScheduleID = scheduleID;
	}
	public int getSeatID() {
		return SeatID;
	}
	public void setSeatID(int seatID) {
		SeatID = seatID;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public int getGuestID() {
		return GuestID;
	}
	public void setGuestID(int guestID) {
		GuestID = guestID;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	
	@Override
	public String toString() {
		return "History [RecordID=" + RecordID + ", ScheduleID=" + ScheduleID + ", SeatID=" + SeatID + ", Email="
				+ Email + ", GuestID=" + GuestID + ", Price=" + Price + "]";
	}
}
