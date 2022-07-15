package com.cooltimetrip.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StayController {
	
	@RequestMapping("/stay_main")
	public String viewStayMain() {
		return "stay/stay_main";
	}
	
	@RequestMapping("/stay/stay_list")
	public String viewStayList() {
		return "stay/stay_list";
	}
	
	@RequestMapping("/stay/stay_detail")
	public String viewStayDetail() {
		return "stay/stay_detail";
	}
	
	@RequestMapping("/stay/stay_reservation")
	public String viewStayReservation() {
		return "stay/stay_reservation";
	}
}
