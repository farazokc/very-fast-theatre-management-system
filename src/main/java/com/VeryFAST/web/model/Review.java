package com.VeryFAST.web.model;

public class Review {
	private String Email;
	private int MovieID;
	private int Stars;
	private String Text;
	
	public Review(String email, int movieID, int stars, String text) {
		super();
		Email = email;
		MovieID = movieID;
		Stars = stars;
		Text = text;
	}
	
	public Review() {
		
	}
	
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public int getMovieID() {
		return MovieID;
	}
	public void setMovieID(int movieID) {
		MovieID = movieID;
	}
	public int getStars() {
		return Stars;
	}
	public void setStars(int stars) {
		Stars = stars;
	}
	public String getText() {
		return Text;
	}
	
	public void setText(String text) {
		Text = text;
	}
	
	@Override
	public String toString() {
		return "Review [Email=" + Email + ", MovieID=" + MovieID + ", Stars=" + Stars + ", Text=" + Text + "]";
	}
}
