package com.example.jpetstore.domain;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class Item implements Serializable {
  /* Private Fields */
	private String categoryId;
	private String productId;
	private String itemId;
	private int listprice;
	private int unitcost = 0;
	private String supplier;
	private String supplier_cate;
	private String status;
	private String attr1;
	private String attr2;
	private String attr3;
	private String attr4;
	private String attr5;
	private String description;
}