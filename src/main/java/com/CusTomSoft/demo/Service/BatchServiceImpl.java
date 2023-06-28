package com.CusTomSoft.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.CusTomSoft.demo.Mapper.BatchMapper;


@Service
public class BatchServiceImpl implements BatchService {
	
	@Autowired(required = false)
	BatchMapper bcm;

	@Override
	@Scheduled(cron = "0 0/1 * * * ?")
	public void batch() {
		
		System.out.println("서비스 접근 성공오옹!!");
		
		bcm.batch();
		
	}
	
}
