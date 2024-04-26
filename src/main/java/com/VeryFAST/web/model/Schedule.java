package com.VeryFAST.web.model;
import java.time.*;

public class Schedule {
	private int ScheduleID;
	private int CinemaID;
	private int MovieID;
	private LocalTime Time;
	private LocalDate Date;
	
	public Schedule(int scheduleID, int cinemaID, int movieID, LocalTime time, LocalDate date) {
		super();
		ScheduleID = scheduleID;
		CinemaID = cinemaID;
		MovieID = movieID;
		Time = time;
		Date = date;
	}
	
	public int getScheduleID() {
		return ScheduleID;
	}
	public void setScheduleID(int scheduleID) {
		ScheduleID = scheduleID;
	}
	public int getCinemaID() {
		return CinemaID;
	}
	public void setCinemaID(int cinemaID) {
		CinemaID = cinemaID;
	}
	public int getMovieID() {
		return MovieID;
	}
	public void setMovieID(int movieID) {
		MovieID = movieID;
	}
	public LocalTime getTime() {
		return Time;
	}
	public void setTime(LocalTime time) {
		Time = time;
	}
	public LocalDate getDate() {
		return Date;
	}
	public void setDate(LocalDate date) {
		Date = date;
	}
	
	@Override
	public String toString() {
		return "Schedule [ScheduleID=" + ScheduleID + ", CinemaID=" + CinemaID + ", MovieID=" + MovieID + ", Time="
				+ Time + ", Date=" + Date + "]";
	}
}
