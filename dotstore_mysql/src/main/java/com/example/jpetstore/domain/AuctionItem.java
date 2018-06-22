
package com.example.jpetstore.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class AuctionItem implements Serializable {

	private String categoryId;
	private String productId;
	private String itemId;
	private int listprice;
	private int unitcost;
	private String supplier;
	private String status;
	private String attr1;
	private String attr2;
	private String attr3;
	private String attr4;
	private String attr5;
	private String buyerId;
	private Date dueTime;
	private String description;
	private String companySupplier;
	private String finish;

}