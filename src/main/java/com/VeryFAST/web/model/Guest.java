package com.VeryFAST.web.model;

import java.time.*;

public class Guest {
	private int GuestID;
	private String GuestEmail;
	private String GuestName;
	private LocalDate GuestDOB;
	private int GuestPhone;
	
	public int getGuestID() {
		return GuestID;
	}
	public void setGuestID(int guestID) {
		GuestID = guestID;
	}
	public String getGuestEmail() {
		return GuestEmail;
	}
	public void setGuestEmail(String guestEmail) {
		GuestEmail = guestEmail;
	}
	public String getGuestName() {
		return GuestName;
	}
	public void setGuestName(String guestName) {
		GuestName = guestName;
	}
	public LocalDate getGuestDOB() {
		return GuestDOB;
	}
	public void setGuestDOB(LocalDate guestDOB) {
		GuestDOB = guestDOB;
	}
	public int getGuestPhone() {
		return GuestPhone;
	}
	public void setGuestPhone(int guestPhone) {
		GuestPhone = guestPhone;
	}
	
	@Override
	public String toString() {
		return "Guest [GuestID=" + GuestID + ", GuestEmail=" + GuestEmail + ", GuestName=" + GuestName + ", GuestDOB="
				+ GuestDOB + ", GuestPhone=" + GuestPhone + "]";
	}
}
