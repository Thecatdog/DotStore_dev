package com.example.jpetstore.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.example.jpetstore.domain.Review;

@Mapper
public interface ReviewMapper {
	void sendReview(Review review) throws DataAccessException;
	List<Review> getListByItemId(String itemId) throws DataAccessException;
	void deleteReview(long reviewId) throws DataAccessException;
	void updateById(long reviewId, String content) throws DataAccessException;
}
