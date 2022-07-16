package com.cooltimetrip.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FlightController {
	
	@RequestMapping("/")
	public String flightMain() {
		return "flight/flight_main";
	}
	
	@RequestMapping("/flight_list")
	public String flightList() {
		return "flight/flight_list";
	}	
	
	@RequestMapping("/flight_detail")
	public String flightDetail() {
		return "flight/flight_detail";
	}	
	
	@RequestMapping("/flight_reservation")
	public String flightReservation() {
		return "flight/flight_reservation";
	}
}
