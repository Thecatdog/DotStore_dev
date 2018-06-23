package com.example.jpetstore.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.example.jpetstore.domain.Point;
import com.example.jpetstore.vo.DateVo;
import com.example.jpetstore.vo.PagingVo;
import com.example.jpetstore.domain.Calendar;

@Mapper
public interface PointMapper {
	void addPoint(Point point) throws DataAccessException;
	long getPointByUserId(String userId) throws DataAccessException;
	List<Point> listByUserId(PagingVo vo) throws DataAccessException;
	void addCalendar(String userId) throws DataAccessException;
	List<Calendar> getCalendarList(String userId) throws DataAccessException;
	List<Calendar> getCalendarListByDate(DateVo vo) throws DataAccessException;
}
