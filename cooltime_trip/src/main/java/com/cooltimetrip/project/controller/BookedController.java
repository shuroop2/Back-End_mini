package com.cooltimetrip.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cooltimetrip.project.model.BookedFlightVO;
import com.cooltimetrip.project.model.BookedRentVO;
import com.cooltimetrip.project.model.BookedStayVO;
import com.cooltimetrip.project.service.BookedService;
import com.cooltimetrip.project.service.BookedStayService;
import com.cooltimetrip.project.service.RentService;

@Controller
public class BookedController {
	@Autowired
	BookedService bService;
	
	@Autowired
	RentService rentService;
	
	@Autowired
	BookedStayService bsService;
	
	@RequestMapping("/mypage_rsv_complete")
	public String bookedFlightView(@RequestParam HashMap<String, Object> map, Model model, HttpSession session, 
								   BookedFlightVO vo) {
		
		String memId = session.getAttribute("sid").toString();
		String chk = map.get("chk").toString();
		
		// BookedFlightVO vo = booked.bookedList(memId);
		
		  vo.setMemId(memId);
		  bService.insertFlight(vo);
		  model.addAttribute("dep_flight_no", map.get("dep_flight_no").toString());
		  model.addAttribute("dep_start_time", map.get("dep_start_time").toString());
		  model.addAttribute("dep_end_time", map.get("dep_end_time").toString());
		  model.addAttribute("dep_start_city", map.get("dep_start_city").toString());
		  model.addAttribute("dep_end_city", map.get("dep_end_city").toString());
		  model.addAttribute("dep_during_time", map.get("dep_during_time").toString());
		  model.addAttribute("arr_flight_no", map.get("arr_flight_no").toString());
		  model.addAttribute("arr_start_time", map.get("arr_start_time").toString());
		  model.addAttribute("arr_end_time", map.get("arr_end_time").toString());
		  model.addAttribute("arr_start_city", map.get("arr_start_city").toString());
		  model.addAttribute("arr_end_city", map.get("arr_end_city").toString());
		  model.addAttribute("arr_during_time", map.get("arr_during_time").toString());
		  model.addAttribute("daterange", map.get("daterange").toString());
		  model.addAttribute("personCount", map.get("personCount").toString());
		  model.addAttribute("charge_flight", map.get("charge_flight").toString());
		  model.addAttribute("charge_fuel", map.get("charge_fuel").toString());
		  model.addAttribute("charge_tax", map.get("charge_tax").toString());
		  model.addAttribute("charge_ticket", map.get("charge_ticket").toString());
		  model.addAttribute("charge_total", map.get("charge_total").toString());
		  model.addAttribute("dep_airline", map.get("dep_airline").toString());
		  model.addAttribute("arr_airline", map.get("arr_airline").toString());
		  model.addAttribute("chk", chk);
		
		return "member/mypage_rsv_complete";
	}
	
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		
		String memId = session.getAttribute("sid").toString();
		ArrayList<BookedFlightVO> fList = bService.bookedList(memId);
		ArrayList<BookedRentVO> rList = rentService.listBookedCar(memId);
		ArrayList<BookedStayVO> sList = bsService.allBookedStayList(memId);
		model.addAttribute("fList", fList); 
		model.addAttribute("rList", rList); 
		model.addAttribute("sList", sList);
		
		return "member/mypage"; 
	}

}
