package com.cooltimetrip.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FlightController {
	
	@RequestMapping("/")
	public String flightMain() {
		return "flight/flight_main";
	}
	
	@RequestMapping("/flight/flight_rsv")
	public String flightRsv() {
		return "flight/flight_rsv";
	}
	
	@RequestMapping("/flight/flight_rsv_detail")
	public String flightRsvDetail() {
		return "flight/flight_rsv_detail";
	}
	
	@RequestMapping("/flight/flight_list")
	public String flightList() {
		return "flight/flight_list";
	}
	
}
