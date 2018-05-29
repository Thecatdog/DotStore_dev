package com.example.jpetstore.dao.mybatis;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.jpetstore.dao.AuctionDao;
import com.example.jpetstore.dao.mybatis.mapper.AuctionMapper;
import com.example.jpetstore.domain.Auction;

@Repository
public class MybatisAuctionDao implements AuctionDao {

	@Autowired
	private AuctionMapper auctionMapper;

	@Override
	public Auction getAuctionItem(String itemId) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createAuctionItem(Auction auction) throws DataAccessException {
		// TODO Auto-generated method stub
		auctionMapper.insertAuction(auction);
	}

	@Override
	public void readAuctionItem(Auction auction) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAuctionItem(Auction auction) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAuctionItem(Auction auction) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void changeAuctionItem(Auction auction, int price) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Auction> getAuctionItemList() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}
	
//	public Account getAccount(String username) throws DataAccessException {
//		return accountMapper.getAccountByUsername(username);
//	}
//
//	public Account getAccount(String username, String password) 
//			throws DataAccessException {
//		return accountMapper.getAccountByUsernameAndPassword(username, password);
//	}
//
//	public void insertAccount(Account account) throws DataAccessException {
//		accountMapper.insertAccount(account);
//		accountMapper.insertProfile(account);
//		accountMapper.insertSignon(account);
//	}
//
//	public void updateAccount(Account account) throws DataAccessException {
//		accountMapper.updateAccount(account);
//		accountMapper.updateProfile(account);
//		if (account.getPassword() != null && account.getPassword().length() > 0) 
//		{
//			accountMapper.updateSignon(account);
//		}
//	}
// 
//	public List<String> getUsernameList() throws DataAccessException {
//		return accountMapper.getUsernameList();
//	}
}