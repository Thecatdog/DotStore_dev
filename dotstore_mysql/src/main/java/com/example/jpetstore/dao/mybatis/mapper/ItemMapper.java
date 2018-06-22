/*
 *    Copyright 2010-2013 the original author or authors.
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

package com.example.jpetstore.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.P2PItem;

public interface ItemMapper {
	void insertC2P(Item c2pItem);

	List<Item> getC2PList(String productId, String supplier_cate);
	
	Item getItem(String itemId);
	
	void deleteById(String itemId);
	
	void updateInventoryQuantity(Map<String, Object> param);

	int getInventoryQuantity(String itemId);

	List<Item> getItemListByProduct(String productId);

	boolean isItemInStock(String itemId);

	List<HashMap<String, String>> getItemListByProduct2(String productId);
}
