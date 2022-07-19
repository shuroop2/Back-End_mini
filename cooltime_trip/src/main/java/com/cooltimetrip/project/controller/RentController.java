package com.cooltimetrip.project.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@RequestMapping("/rent_list")
	public String rentList(@RequestParam("datetimes") String daterange,
						   @RequestParam("rentLocation") String rentLocation,
						   @RequestParam("rentBirth") String rentBirth,
						   Model model) throws ParseException {
		
		ArrayList<CarVO> carList = rentService.listAllCar();
		
		// 무료 취소 기간 설정 (선택한 출발 날짜 -2일)
		// 만약 선택한 출발 날짜가 오늘 날짜 +2일까지라면 daterange 미노출
		String dateCancel = "22." + daterange.substring(0, 5);			// 22년 ~월 ~일
		
		SimpleDateFormat dateType =  new SimpleDateFormat("yy.MM.dd");
		Date selectDate = dateType.parse(dateCancel);					// 선택한 날짜
		Date today = new Date();

		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(selectDate); // 시간 설정
		cal1.add(Calendar.DATE, -2); // 일 연산
		
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(today);
		cal2.add(Calendar.DATE, 3); // 일 연산
		
		Date calDate = new Date(cal1.getTimeInMillis());
		Date tdyDate = new Date(cal2.getTimeInMillis());
		
		dateCancel = dateType.format(calDate);
		
		// 만약 오늘 날짜 +3 > 선택한 출발 날짜라면
		if(tdyDate.after(calDate)) {
			dateCancel = "&nbsp";	// 빈 값
		}else {
			dateCancel = "무료취소 (~" + dateCancel.substring(3, 8) + ")";
		}
		
		model.addAttribute("daterange", daterange);
		model.addAttribute("rentLocation", rentLocation);
		model.addAttribute("rentBirth", rentBirth);
		model.addAttribute("dateCancel", dateCancel);
		model.addAttribute("carList", carList);
		
		return "rent/rent_list";
	}
	
	// 상세 정보 조회 : 1개
	@RequestMapping("/rent_detail/{carNo}")
	public String rentDetail(@PathVariable int carNo, Model model) {
		CarVO car = rentService.detailViewCar(carNo);
		model.addAttribute("car", car);
		
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
