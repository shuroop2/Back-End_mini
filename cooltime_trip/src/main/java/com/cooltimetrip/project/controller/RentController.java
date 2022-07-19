package com.cooltimetrip.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cooltimetrip.project.model.CarVO;
import com.cooltimetrip.project.service.RentService;

@Controller
public class RentController {
	
	// DI 설정
	@Autowired
	RentService rentService;
	
	@RequestMapping("/rent_main")
	public String rentMain() {
		return "rent/rent_main";
	}

	// 차량 조회
	@RequestMapping(value="/rent_list", method= {RequestMethod.GET, RequestMethod.POST})
	public String rentList(@RequestParam("datetimes") String daterange,
						   @RequestParam("rentLocation") String rentLocation,
						   @RequestParam("rentBirth") String rentBirth,
						   Model model) {
		ArrayList<CarVO> carList = rentService.listAllCar();
		
		model.addAttribute("daterange", daterange);
		model.addAttribute("rentLocation", rentLocation);
		model.addAttribute("rentBirth", rentBirth);
		model.addAttribute("carList", carList);
		
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
