package com.CusTomSoft.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.CusTomSoft.demo.Service.BatchService;



@Controller
/* @EnableScheduling */
public class BatchController {
	
	@Autowired(required=false)
	BatchService bts;
	
	@GetMapping("batch")
	public String batch() {
		
		System.out.println("컨트롤러 접근 성공!");
		bts.batch();
		
		return "batchpage";
		
	}
	
	@GetMapping("batchpage")
	public String batchpage() {
		
		return "batchpage";
	}
	
}
