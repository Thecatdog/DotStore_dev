package com.example.jpetstore.domain;

import lombok.Data;

@Data
public class Buyer {
	private String username;
	private String itemId;
	private int listprice;
}
