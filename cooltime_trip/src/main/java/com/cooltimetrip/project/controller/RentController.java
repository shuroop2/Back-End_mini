package com.cooltimetrip.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RentController {
	@RequestMapping("/rent_main")
	public String rentMain() {
		return "rent/rent_main";
	}

	@RequestMapping("/rent_list")
	public String rentList() {
		return "rent/rent_list";
	}
	
	@RequestMapping("/rent_detail")
	public String rentDetail() {
		return "rent/rent_detail";
	}	
	
	@RequestMapping("/rent_map")
	public String rentMap() {
		return "rent/rent_map";
	}
	
	@RequestMapping("/rent_reservation")
	public String rentReservation() {
		return "rent/rent_reservation";
	}
}
