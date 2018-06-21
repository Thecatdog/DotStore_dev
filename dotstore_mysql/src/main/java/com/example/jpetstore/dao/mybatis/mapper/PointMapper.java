package com.example.jpetstore.dao.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.jpetstore.domain.Point;

@Mapper
public interface PointMapper {
	void addPoint(Point point);
}
