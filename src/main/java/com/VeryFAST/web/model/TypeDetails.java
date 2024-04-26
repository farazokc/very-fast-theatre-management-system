package com.VeryFAST.web.model;

public class TypeDetails {
	private int TypeID;
	private String Type;
	private int Price;
		
	public TypeDetails(int typeID, String type, int price) {
		super();
		TypeID = typeID;
		Type = type;
		Price = price;
	}
	
	public TypeDetails() {
		
	}

	public int getTypeID() {
		return TypeID;
	}

	public void setTypeID(int typeID) {
		TypeID = typeID;
	}



	public String getType() {
		return Type;
	}



	public void setType(String type) {
		Type = type;
	}



	public int getPrice() {
		return Price;
	}



	public void setPrice(int price) {
		Price = price;
	}

	@Override
	public String toString() {
		return "TypeDetails [TypeID=" + TypeID + ", Type=" + Type + ", Price=" + Price + "]";
	}	
}
