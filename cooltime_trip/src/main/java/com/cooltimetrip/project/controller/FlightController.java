package com.cooltimetrip.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cooltimetrip.project.model.FlightVO;
import com.cooltimetrip.project.model.HistoryVO;
import com.cooltimetrip.project.model.KeyValue;
import com.cooltimetrip.project.model.MemberVO;
import com.cooltimetrip.project.service.FlightService;
import com.cooltimetrip.project.service.HistoryService;
import com.cooltimetrip.project.service.MemberService;

@Controller
public class FlightController {
	@Autowired
	MemberService memService;
	@Autowired
	HistoryService hService;
	@Autowired
	FlightService fService;
	
	@RequestMapping("/")
	public String flightMain(HttpSession session, Model model) {
		String memId = (String) session.getAttribute("sid");
		if(memId != null) {
			ArrayList<HistoryVO> hList = hService.historyList(memId);
			model.addAttribute("hList", hList);
		}
		return "flight/flight_main";
	}
	
	@ResponseBody
	@RequestMapping("/deleteHistory/{historyNo}")
	public int deleteHistory(@PathVariable int historyNo) {
		
		int result = 0;
		
		if(historyNo != 0) {
			hService.deleteHistory(historyNo);
			result = 1;
		}
		
		return result;
	}
	
	@RequestMapping("/flight_list")
	public String flightList(@RequestParam HashMap<String, Object> map, Model model, HttpSession session, HistoryVO vo, KeyValue key) throws Exception {
		String depart_location = (String) map.get("depart_location");
		String arrive_location = (String) map.get("arrive_location");
		String daterange = (String) map.get("daterange");
		
		String airportDep = "NAARKPC";
		String airportArv = "NAARKSS";
		if(depart_location.equals("김포") && arrive_location.equals("제주")) {
			airportDep = "NAARKSS";
			airportArv = "NAARKPC";
		}
		
		// 출발 날짜
		String depDate = "2022" + daterange.substring(0, 2) + daterange.subSequence(3, 5);
		
		// 도착 날짜
		String arrDate = "2022" + daterange.substring(11, 13) + daterange.subSequence(14, 16);
		ArrayList<FlightVO> objDep = fService.flight(key.getKey(), airportDep, airportArv, depDate);
		ArrayList<FlightVO> objArv = fService.flight(key.getKey(), airportArv, airportDep, arrDate);
		
		String memId = (String) session.getAttribute("sid");
        if(memId != null) {
        	
        	vo.setMemId(memId);
        	vo.setHistoryDep(depart_location);
        	vo.setHistoryArr(arrive_location);
        	vo.setHistoryDateRange(daterange);
        	vo.setHistoryShuttle((String) map.get("shuttle"));
        	vo.setHistoryType((String) map.get("classType"));
        	vo.setHistoryCount((String) map.get("personCount"));
        	
            int count = hService.checkInHistory(vo.getHistoryDep(), vo.getHistoryArr(), memId);

            if(count == 0) {
            	hService.insertHistory(vo);
            } else {
            	hService.updateHistory(vo);
            }
        }
        
        model.addAttribute("objDep", objDep);
        model.addAttribute("objArv", objArv);
        model.addAttribute("depart_location", depart_location);
        model.addAttribute("arrive_location", arrive_location);
        model.addAttribute("shuttle", (String) map.get("shuttle")); // 왕복 편도 다구간
        model.addAttribute("daterange", daterange); // 기간
        model.addAttribute("personCount", (String) map.get("personCount")); // 인원수
        model.addAttribute("classType",(String) map.get("classType")); // 좌석 타입
        
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
