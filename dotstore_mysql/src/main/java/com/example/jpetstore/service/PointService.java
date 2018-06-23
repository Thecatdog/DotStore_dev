package com.example.jpetstore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.jpetstore.dao.mybatis.mapper.PointMapper;
import com.example.jpetstore.domain.Point;

@Service

public class PointService {
	@Autowired private PointMapper pointMapper;
	
	@Transactional
	public void insertCalendar(String userId, Point point) {
		pointMapper.addCalendar(userId);
		pointMapper.addPoint(point);
	}

}
