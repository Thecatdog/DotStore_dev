
package com.example.jpetstore.domain;
import java.io.Serializable;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Message implements Serializable{
	
	/* Private Fields */
	private long id;
	private String senderId;
	private String receiverId;
	private String title;
	private String context;
	private Timestamp createAt;
	
}
