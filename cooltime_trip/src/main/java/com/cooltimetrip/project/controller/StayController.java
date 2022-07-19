package com.cooltimetrip.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cooltimetrip.project.model.HotelVO;
import com.cooltimetrip.project.model.RoomVO;
import com.cooltimetrip.project.service.HotelService;
import com.cooltimetrip.project.service.RoomService;

@Controller
public class StayController {
	
	// DI설정
	@Autowired
	HotelService hotelService;
	
	@Autowired
	RoomService roomService;
	
	@RequestMapping("/stay_main")
	public String viewStayMain() {
		return "stay/stay_main";
	}
	
	// 데이터 넘기기
	@RequestMapping("/stay_list")
	public String HotelList(@RequestParam String stayLocation, 
							@RequestParam String daterange,
							@RequestParam String personCount, Model model) {
		
		ArrayList<HotelVO> hotelList = hotelService.listAllHotel();
		
		model.addAttribute("stayLocation", stayLocation);
		model.addAttribute("daterange", daterange);
		model.addAttribute("personCount", personCount);
		model.addAttribute("hotelList", hotelList);
		
		return "stay/stay_list";
	}
	
	/*
	 * @RequestMapping("/stay_list") public String viewStayList() { return
	 * "stay/stay_list"; }
	 */
	
	@RequestMapping("/stay_detail")
	public String viewStayDetail() {
		return "stay/stay_detail";
	}
	
	@RequestMapping("/stay_reservation")
	public String viewStayReservation() {
		return "stay/stay_reservation";
	}
}
