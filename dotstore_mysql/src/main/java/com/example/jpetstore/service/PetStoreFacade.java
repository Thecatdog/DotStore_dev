package com.example.jpetstore.service;

import java.util.List;

import com.example.jpetstore.domain.Account;
import com.example.jpetstore.domain.Auction;
import com.example.jpetstore.domain.Category;
import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.Order;
import com.example.jpetstore.domain.Product;

/**
 * JPetStore's central business interface.
 *
 * @author Juergen Hoeller
 * @since 30.11.2003
 */
public interface PetStoreFacade {

	Account getAccount(String username);

	Account getAccount(String username, String password);

	void insertAccount(Account account);

	void updateAccount(Account account);

	List<String> getUsernameList();

	Auction getAuctionItem(String itemId);
	void createAuctionItem(Auction auction);
	void readAuctionItem(Auction auction);
	void updateAuctionItem(Auction auction);
	void deleteAuctionItem(Auction auction);
	void changeAuctionItem(Auction auction, int price);
	List<Auction> getAuctionItemList();
	
	List<Category> getCategoryList();

	Category getCategory(String categoryId);
	

	List<Product> getProductListByCategory(String categoryId);

	List<Product> searchProductList(String keywords);

	Product getProduct(String productId);


	List<Item> getItemListByProduct(String productId);

	Item getItem(String itemId);

	boolean isItemInStock(String itemId);


	void insertOrder(Order order);

	Order getOrder(int orderId);

	List<Order> getOrdersByUsername(String username);

}