package com.example.jpetstore.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class Calendar implements Serializable {
	private long cldrId;
	private String userId;
	private Timestamp createAt;
	
	public String getCreateAtStr(){
		return new SimpleDateFormat("yyyy-MM-dd").format(this.createAt);
	}
}
