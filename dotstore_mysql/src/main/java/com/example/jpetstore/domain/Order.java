package com.example.jpetstore.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import lombok.Data;

@Data
@SuppressWarnings("serial")
public class Order implements Serializable {

  /* Private Fields */

  private int orderId;
  private String username;
  private Date orderDate;
  private String shipAddress1;
  private String shipAddress2;
  private String shipCity;
  private String shipState;
  private String shipZip;
  private String shipCountry;
  private String billAddress1;
  private String billAddress2;
  private String billCity;
  private String billState;
  private String billZip;
  private String billCountry;
  private String courier;
  private int totalPrice;
  private String billToFirstName;
  private String billToLastName;
  private String shipToFirstName;
  private String shipToLastName;
  private String creditCard;
  private String expiryDate;
  private String cardType;
  private String locale;
  private String status;
  private List<HashMap<String, String>> cartList = new ArrayList<HashMap<String, String>>();
  private List<LineItem> lineItems = new ArrayList<>();

  /* Public Methods */

  public void initOrder(Account account, int price, List<HashMap<String, String>> cartList) { //, Cart cart) {
    username = account.getUsername();
    orderDate = new Date();

    shipToFirstName = account.getFirstName();
    shipToLastName = account.getLastName();
    shipAddress1 = account.getAddress1();
    shipAddress2 = account.getAddress2();
    shipCity = account.getCity();
    shipState = account.getState();
    shipZip = account.getZip();
    shipCountry = account.getCountry();

    billToFirstName = account.getFirstName();
    billToLastName = account.getLastName();
    billAddress1 = account.getAddress1();
    billAddress2 = account.getAddress2();
    billCity = account.getCity();
    billState = account.getState();
    billZip = account.getZip();
    billCountry = account.getCountry();

    totalPrice = price;

    creditCard = "999 9999 9999 9999";
    expiryDate = "21/03";
    cardType = "Visa";
    courier = "UPS";
    locale = "CA";
    status = "P";
    
    this.cartList = cartList;

//    Iterator<CartItem> i = cart.getAllCartItems();
//    while (i.hasNext()) {
//      CartItem cartItem = (CartItem) i.next();
//      addLineItem(cartItem);
//    }
  }

//  public void addLineItem(CartItem cartItem) {
//    LineItem lineItem = new LineItem(lineItems.size() + 1, cartItem);
//    addLineItem(lineItem);
//  }
//
//  public void addLineItem(LineItem lineItem) {
//    lineItems.add(lineItem);
//  }
}