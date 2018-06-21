package com.example.jpetstore.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import com.example.jpetstore.dao.mybatis.mapper.AuctionMapper;
import com.example.jpetstore.domain.AuctionItem;

@Controller
public class AuctionSchedulerController {
	
	@Autowired private AuctionMapper auctionMapper;
	
	@Scheduled(cron="0 0 0 * * *") //매일 12시
	//@Scheduled(cron="5 * * * * *") //test : *분 5초 일 때마다
	public void doSchedule() {	
		
		//1. finish가 open인 것만 불러온다
		List<AuctionItem> openList = auctionMapper.selectOpenAuction();
		
		//2. 마감일과 오늘날짜를 비교한다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//2-1. 현재 시간 Date형으로
		Calendar cal = Calendar.getInstance(); //현재 시간
		cal.add(Calendar.DATE, -1); //하루 전(24시 마감이니까)
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		
		Date d = cal.getTime();
		String yesterday = sdf.format(d);
		System.out.println("yesterday : " + yesterday);
		
		//2-2. 하루 전 날짜와 아이템 날짜 비교
		for (AuctionItem item : openList) {
			String itemDate = sdf.format(item.getDueTime());
			System.out.print("itemDate : " + itemDate + " -> ");
			
			if (yesterday.compareTo(itemDate) == 0) { 
				System.out.println("close로 바꿔야 한다");
				//3. 지났으면 close로 바꾼다.
				auctionMapper.updateAuctionFinish(item.getItemId());
			} 
//			else if (yesterday.compareTo(itemDate) > 0) System.out.println("현재가 느리다. 이미 지났다");
			else if (yesterday.compareTo(itemDate) < 0)	System.out.println("현재가 빠르다. 아직 기간 남았다");
		}
	}
}