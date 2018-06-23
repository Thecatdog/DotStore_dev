package com.example.jpetstore.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class Point implements Serializable{
	private long pointId;
	private String userId;
	private long point;
	private String content;
	private Timestamp createAt;
	
	public String getCreateAtStr(){
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(this.createAt);
	}
}
