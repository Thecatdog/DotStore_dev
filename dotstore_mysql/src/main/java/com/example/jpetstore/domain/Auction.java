package com.example.jpetstore.domain;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Auction implements Serializable {
	
	private int idAUCTION;
	private String name;
	private String description;
	private String startPrice;
	private String deadline;
	
	public int getIdAUCTION() {
		return idAUCTION;
	}
	public void setIdAUCTION(int idAUCTION) {
		this.idAUCTION = idAUCTION;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(String startPrice) {
		this.startPrice = startPrice;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	
	
}
