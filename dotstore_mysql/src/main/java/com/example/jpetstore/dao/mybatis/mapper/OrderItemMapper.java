package com.example.jpetstore.dao.mybatis.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.example.jpetstore.domain.NewCart;
import com.example.jpetstore.domain.OrderItem;

@Mapper
public interface OrderItemMapper {

	void insertOrderItem(OrderItem orderItem);
	List<String> getItemIdListByOrderId(int orderid);
}