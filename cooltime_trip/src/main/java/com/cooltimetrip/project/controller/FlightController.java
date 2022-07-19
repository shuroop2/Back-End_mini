package com.cooltimetrip.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String flightDetail(@RequestParam HashMap<String, Object> map, Model model) {
		String index = (String) map.get("realindex");
		model.addAttribute("depart_location", (String) map.get("depart_location"));
		model.addAttribute("arrive_location", (String) map.get("arrive_location"));
		model.addAttribute("dep_airline", (String) map.get("dep_airline"+index));
		model.addAttribute("arr_airline", (String) map.get("arr_airline"+index));
		model.addAttribute("dep_flight_no", (String) map.get("dep_flight_no"+index));
		model.addAttribute("arr_flight_no", (String) map.get("arr_flight_no"+index));
		model.addAttribute("daterange", (String) map.get("daterange"));
		model.addAttribute("dep_start_time", (String) map.get("dep_start_time"+index));
		model.addAttribute("dep_end_time", (String) map.get("dep_end_time"+index));
		model.addAttribute("arr_start_time", (String) map.get("arr_start_time"+index));
		model.addAttribute("arr_end_time", (String) map.get("arr_end_time"+index));
		model.addAttribute("dep_during", (String) map.get("dep_during"+index));
		model.addAttribute("arr_during", (String) map.get("arr_during"+index));
		model.addAttribute("personCount", (String) map.get("personCount"));
		model.addAttribute("classType", (String) map.get("classType"));
		model.addAttribute("charge_flight", (String) map.get("charge_flight"+index));
		model.addAttribute("charge_fuel", (String) map.get("charge_fuel"+index));
		model.addAttribute("charge_tax", (String) map.get("charge_tax"+index));
		model.addAttribute("charge_ticket", (String) map.get("charge_ticket"+index));
		model.addAttribute("charge_total", (String) map.get("charge_total"+index));
		 	
		return "flight/flight_detail";
	}
	
	@RequestMapping("/flight_reservation")
	public String flightReservation(@RequestParam HashMap<String, Object> map, Model model, HttpSession session) {
		// 로그인 작업 처리 추가 필요
		// String memId = (String) session.getAttribute("sid");
		
		model.addAttribute("depart_location", (String) map.get("depart_location"));
		model.addAttribute("arrive_location", (String) map.get("arrive_location"));
		model.addAttribute("daterange", (String) map.get("daterange"));
		model.addAttribute("dep_airline", (String) map.get("dep_airline"));
		model.addAttribute("arr_airline", (String) map.get("arr_airline"));
		model.addAttribute("dep_flight_no", (String) map.get("dep_flight_no"));
		model.addAttribute("arr_flight_no", (String) map.get("arr_flight_no"));
		model.addAttribute("dep_start_time", (String) map.get("dep_start_time"));
		model.addAttribute("dep_end_time", (String) map.get("dep_end_time"));
		model.addAttribute("arr_start_time", (String) map.get("arr_start_time"));
		model.addAttribute("arr_end_time", (String) map.get("arr_end_time"));
		model.addAttribute("classType", (String) map.get("classType"));
		model.addAttribute("personCount", (String) map.get("personCount"));
		model.addAttribute("charge_flight", (String) map.get("charge_flight"));
		model.addAttribute("charge_fuel", (String) map.get("charge_fuel"));
		model.addAttribute("charge_tax", (String) map.get("charge_tax"));
		model.addAttribute("charge_ticket", (String) map.get("charge_ticket"));
		model.addAttribute("charge_total", (String) map.get("charge_total"));
		
		return "flight/flight_reservation";
	}
	
}
