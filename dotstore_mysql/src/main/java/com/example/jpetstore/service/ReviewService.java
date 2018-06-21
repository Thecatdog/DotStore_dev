package com.example.jpetstore.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.jpetstore.dao.mybatis.mapper.PointMapper;
import com.example.jpetstore.dao.mybatis.mapper.ReviewMapper;
import com.example.jpetstore.domain.Point;
import com.example.jpetstore.domain.Review;

@Service
public class ReviewService {
	@Autowired private ReviewMapper reviewMapper;
	@Autowired private PointMapper pointMapper;
	
	@Transactional
	public void insert(Review review, Point point) {
		reviewMapper.sendReview(review);
		pointMapper.addPoint(point);
	}
	
	@Transactional
	public void deleteById(long reviewId) {
		reviewMapper.deleteReview(reviewId);
	}
	
	@Transactional
	public void updateById(long reviewId, String content) {
		reviewMapper.updateById(reviewId, content);
	}
	
	
}
