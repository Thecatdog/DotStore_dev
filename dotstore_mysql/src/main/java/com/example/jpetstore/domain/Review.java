package com.example.jpetstore.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import lombok.Data;

@Data
public class Review implements Serializable{
	private long reviewId;
	private String itemId;
	private String userId;	
	private String content;
	private Timestamp createAt;
}
