package com.cooltimetrip.project.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cooltimetrip.project.model.BookedRentVO;
import com.cooltimetrip.project.model.CarVO;
import com.cooltimetrip.project.model.MemberVO;
import com.cooltimetrip.project.service.MemberService;
import com.cooltimetrip.project.service.RentService;

@Controller
public class RentController {
	
	// DI 설정
	@Autowired
	RentService rentService;
	
	@Autowired
	MemberService memService;
	
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
			dateCancel = "";	// 빈 값
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
	public String rentDetail(@PathVariable int carNo, @RequestParam HashMap<String, Object> map, Model model) {
		
		CarVO car = rentService.detailViewCar(carNo);
		String strCancel = (String)map.get("dateCancel");
		String strCancel2 = null;
		if(strCancel != "") {
			strCancel2 = strCancel.substring(7, 9) + "월 " + strCancel.substring(10, 12) + "일 오전 10시까지 무료 취소";
		}else {
			strCancel2 = "지금 예약하면 1시간 내 무료로 취소할 수 있습니다. (1시간 이후부터 총 결제금액의 70% 환불)";
		}
	
		model.addAttribute("strCancel2", strCancel2);
		model.addAttribute("daterange", (String)map.get("daterange"));
		model.addAttribute("car", car);
		
		return "rent/rent_detail";
	}
	
	// 상세에서 지도보기 요청
	@RequestMapping("/rent_map")
	public String rentMap(@RequestParam String address, Model model) {
		model.addAttribute("address", address);
		return "rent/rent_map";
	}
	
	// 예약 페이지
	@RequestMapping("/rent_reservation")
	public String rentReservation(@RequestParam int carNo,
								  @RequestParam String daterange,
								  HttpSession session,
								  Model model) {
		// 예약 화면에 car 정보 + rent 정보 가져오기
		// carNo 가져오기
		// carNo를 담아 carVO 가져오기
		CarVO car = rentService.detailViewCar(carNo);
		String memId = (String) session.getAttribute("sid");
		MemberVO mem = memService.getMemberInfo(memId);
		String memPH1 = mem.getMemPhone().substring(0, 3);
		String memPH2 = mem.getMemPhone().substring(3, 7);
		String memPH3 = mem.getMemPhone().substring(7, 11);
		String[] email = mem.getMemEmail().split("@");
		String[] dateTime = daterange.split("-");
		
		model.addAttribute("car", car);
		model.addAttribute("mem", mem);
		model.addAttribute("memPH1", memPH1);
		model.addAttribute("memPH2", memPH2);
		model.addAttribute("memPH3", memPH3);
		model.addAttribute("email", email);
		model.addAttribute("dateTime", dateTime);
		
		return "rent/rent_reservation";
	}
	
	// 예약 완료 페이지
	@RequestMapping("/rent_rsv_complete")
	public String rentRsvInsert(BookedRentVO vo,
								@RequestParam int carNo,
								@RequestParam String daterange,
								@RequestParam String chk,
								HttpSession session,
								Model model) {
		String memId = (String)session.getAttribute("sid");
		
		// VO에 memId 값 설정
		vo.setMemId(memId);
		vo.setCarNo(carNo);
		vo.setBookDateRange(daterange);
		
		rentService.insertBookedRentInfo(vo);
		
		model.addAttribute("chk", chk);
		
		return "member/mypage_rsv_complete";
	}
}
