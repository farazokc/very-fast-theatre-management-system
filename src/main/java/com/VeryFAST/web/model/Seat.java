package com.VeryFAST.web.model;

public class Seat {
	private int SeatID;
	private char Row;
	private char Column;
	private int CinemaID;	
	
	public Seat(int seatID, char row, char column, int cinemaID) {
		super();
		SeatID = seatID;
		Row = row;
		Column = column;
		CinemaID = cinemaID;
	}
	
	public Seat() {
		
	}
	
	public int getSeatID() {
		return SeatID;
	}
	public void setSeatID(int seatID) {
		SeatID = seatID;
	}
	public char getRow() {
		return Row;
	}
	public void setRow(char row) {
		Row = row;
	}
	public char getColumn() {
		return Column;
	}
	public void setColumn(char column) {
		Column = column;
	}
	public int getCinemaID() {
		return CinemaID;
	}
	public void setCinemaID(int cinemaID) {
		CinemaID = cinemaID;
	}
	
	@Override
	public String toString() {
		return "Seat [SeatID=" + SeatID + ", Row=" + Row + ", Column=" + Column + ", in Cinema " + CinemaID + "]";
	}
}
