
package com.example.jpetstore.domain;
import java.io.Serializable;
import java.sql.Timestamp;

public class Message implements Serializable{
	
	/* Private Fields */
	private long id;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}

	private String senderId;
	private String receiverId;
	private String title;
	private String context;
	private Timestamp createAt;
	
	/* Getter & Setter */
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Timestamp getcreateAt() {
		return createAt;
	}
	public void setcreateAt(Timestamp createAt) {
		this.createAt = (Timestamp) createAt;
	}
	
	/* Methods */
	public String toString() {
		String rslt = "";
		rslt += "sender : " + senderId
			+ " receiver : " + receiverId
			+ " title : " + title
			+ "context : " + context
			+ "createAt : " + createAt;
		return rslt;
	}

}
