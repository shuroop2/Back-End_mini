package com.cooltimetrip.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cooltimetrip.project.model.HotelVO;
import com.cooltimetrip.project.model.MemberVO;
import com.cooltimetrip.project.service.HotelService;
import com.cooltimetrip.project.service.MemberService;

@Controller
public class StayController {
	
	// DI설정
	@Autowired
	HotelService hotelService;
	
	@Autowired
	MemberService memService;
	
	
	@RequestMapping("/stay_main")
	public String viewStayMain(Model model) {
		ArrayList<HotelVO> hotelList = hotelService.listAllHotel();
		model.addAttribute("hotelList", hotelList);
		
		return "stay/stay_main";
	}
	
	// 데이터 넘기기
	@RequestMapping("/stay_list")
	public String viewStayList(@RequestParam String stayLocation, 
							   @RequestParam String daterange,
							   @RequestParam String personCount, Model model) {
		
		ArrayList<HotelVO> hotelList = hotelService.listAllHotel();
		
		model.addAttribute("stayLocation", stayLocation);
		model.addAttribute("daterange", daterange);
		model.addAttribute("personCount", personCount);
		model.addAttribute("hotelList", hotelList);
		
		return "stay/stay_list";
	}
	
	
	@RequestMapping("/stay_detail/{hotelNo}")
	public String viewStayDetail(@PathVariable String hotelNo, @RequestParam String daterange,
			   					 @RequestParam String personCount, Model model) {
		
		HotelVO hotel = hotelService.viewDetailRoom(hotelNo);
		model.addAttribute("hotel", hotel);
		model.addAttribute("daterange", daterange);
		model.addAttribute("personCount", personCount);
		
		return "stay/stay_detail";
	}
	
	@RequestMapping("/hotel_map")
	public String rentMap(@RequestParam String address, Model model) {
		model.addAttribute("address", address);
		return "stay/hotel_map";
	}
	
	@RequestMapping("/stay_reservation")
	public String viewStayReservation(@RequestParam String hotelNo,
									  @RequestParam String roomType,
									  @RequestParam String roomTypePrice,
									  @RequestParam String daterange,
									  HttpSession session, Model model) {
		
		HotelVO hotel = hotelService.viewDetailRoom(hotelNo);
		String memId = (String) session.getAttribute("sid");
		MemberVO mem = memService.getMemberInfo(memId);
		String memPH1="", memPH2="", memPH3="";
		if(mem.getMemPhone().length() == 11) {
			memPH1 = mem.getMemPhone().substring(0, 3);
			memPH2 = mem.getMemPhone().substring(3, 7);
			memPH3 = mem.getMemPhone().substring(7, 11);
		} else if(mem.getMemPhone().length() == 10) {
			memPH1 = mem.getMemPhone().substring(0, 3);
			memPH2 = mem.getMemPhone().substring(3, 6);
			memPH3 = mem.getMemPhone().substring(6, 10);
		}
		
		String[] email = mem.getMemEmail().split("@");
		String[] dateTime = daterange.split("-");
		 
		
		model.addAttribute("hotel", hotel);
		model.addAttribute("mem", mem);
		model.addAttribute("memPH1", memPH1);
		model.addAttribute("memPH2", memPH2);
		model.addAttribute("memPH3", memPH3);
		model.addAttribute("email", email);
		model.addAttribute("dateTime", dateTime);
		model.addAttribute("roomType", roomType);
		model.addAttribute("roomTypePrice", roomTypePrice);
		 
		return "stay/stay_reservation";
	}
}
