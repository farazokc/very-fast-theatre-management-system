package com.VeryFAST.web.model;

public class Movie {
	private int MovieID;
	private String MovieName;
	private String Genre;
	private String Link;
	private float Duration;
	private String MainChar;
	private String Description;
	

	
	public Movie(int movieID, String movieName, String genre, String link, float duration, String mainChar,
			String description) {
		super();
		MovieID = movieID;
		MovieName = movieName;
		Genre = genre;
		Link = link;
		Duration = duration;
		MainChar = mainChar;
		Description = description;
	}
	
	public Movie() {
		// TODO Auto-generated constructor stub
	}

	public int getMovieID() {
		return MovieID;
	}
	public void setMovieID(int movieID) {
		MovieID = movieID;
	}
	public String getMovieName() {
		return MovieName;
	}
	public void setMovieName(String movieName) {
		MovieName = movieName;
	}
	public String getGenre() {
		return Genre;
	}
	public void setGenre(String genre) {
		Genre = genre;
	}
	public String getLink() {
		return Link;
	}
	public void setLink(String link) {
		Link = link;
	}
	public float getDuration() {
		return Duration;
	}
	public void setDuration(float duration) {
		Duration = duration;
	}
	public String getMainChar() {
		return MainChar;
	}
	public void setMainChar(String mainChar) {
		MainChar = mainChar;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	
	@Override
	public String toString() {
		return "Movie [MovieID=" + MovieID + ", MovieName=" + MovieName + ", Genre=" + Genre + ", Duration=" + Duration + ", MainChar=" + MainChar + "]";
	}
}
