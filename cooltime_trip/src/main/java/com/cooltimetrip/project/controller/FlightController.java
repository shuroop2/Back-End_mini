package com.cooltimetrip.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cooltimetrip.project.model.MemberVO;
import com.cooltimetrip.project.service.MemberService;

@Controller
public class FlightController {
	@Autowired
	MemberService memService;
	
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
		String memId = (String) session.getAttribute("sid");
		MemberVO mem = memService.getMemberInfo(memId);
		
		String email = mem.getMemEmail();
		String phone = mem.getMemPhone();
		int index = email.indexOf("@");
		String email1 = email.substring(0, index);
		String email2 = email.substring(index + 1);
		
		String phone1 = phone.substring(0, 3);
		String phone2 = phone.substring(3, 6);
		String phone3 = phone.substring(6, 10);
		
		if(phone.length() == 11) {
			phone1 = phone.substring(0, 3);
			phone2 = phone.substring(3, 7);
			phone3 = phone.substring(7, 11);
		}
	
		model.addAttribute("mem", mem);
		model.addAttribute("email1", email1);
		model.addAttribute("email2", email2);
		model.addAttribute("phone1", phone1);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
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
		model.addAttribute("dep_during_time", (String) map.get("dep_during"));
	    model.addAttribute("arr_during_time", (String) map.get("arr_during"));
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
