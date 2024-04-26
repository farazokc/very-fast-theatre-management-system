package com.VeryFAST.web.model;

public class Reservation {
	private String ReservationID;
	private int ScheduleID;
	private int SeatID;
	private String Email;
	private int GuestID;
	
	public Reservation(String reservationID, int scheduleID, int seatID, String email, int guestID) {
		super();
		ReservationID = reservationID;
		ScheduleID = scheduleID;
		SeatID = seatID;
		Email = email;
		GuestID = guestID;
	}
	
	public Reservation() {
		
	}
	
	public String getReservationID() {
		return ReservationID;
	}
	public void setReservationID(String reservationID) {
		ReservationID = reservationID;
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
	
	@Override
	public String toString() {
		return "Reservation [ReservationID=" + ReservationID + ", ScheduleID=" + ScheduleID + ", SeatID=" + SeatID
				+ ", Email=" + Email + ", GuestID=" + GuestID + "]";
	}
}
