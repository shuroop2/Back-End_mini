package com.cooltimetrip.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cooltimetrip.project.model.HistoryVO;
import com.cooltimetrip.project.model.KeyValue;
import com.cooltimetrip.project.service.HistoryService;

@RestController
public class FlightAPIController {
	@Autowired
	HistoryService hService;
	
	@ResponseBody
	@RequestMapping(value="/flight_list", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView callapihttp(ModelAndView mv, KeyValue key, @RequestParam String depart_location, 
			@RequestParam String arrive_location, @RequestParam String shuttle, @RequestParam String daterange,
			@RequestParam String personCount, @RequestParam String classType, HttpSession session, HistoryVO vo) throws Exception {
		
		// 출발/도착 항공 지정
		// 제주 : NAARKPC / 김포 : NAARKSS
		String airportDep = "NAARKPC";
		String airportArv = "NAARKSS";
		
		if(depart_location.equals("김포") && arrive_location.equals("제주")) {
			airportDep = "NAARKSS";
			airportArv = "NAARKPC";
		}
		
		// 가는편, 오는편의 String을 담을 result 선언
		StringBuffer resultDep = new StringBuffer();
		StringBuffer resultArv = new StringBuffer();
		
		// 출발 날짜
		String depDate = "2022" + daterange.substring(0, 2) + daterange.subSequence(3, 5);
		
		// 도착 날짜
		String arrDate = "2022" + daterange.substring(11, 13) + daterange.subSequence(14, 16);
		try {
			// 가는편 요청 url 작성
			String urlDep = "http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getFlightOpratInfoList"
					+ "?serviceKey=" + key.getKey()		// 서비스 키
					+ "&depAirportId=" + airportDep		// 출발 공항 입력 (김포로 지정)
					+ "&arrAirportId=" + airportArv		// 도착 공항 입력 (제주로 지정)
					+ "&depPlandTime=" + depDate		// 출발 날짜 지정
					+ "&numOfRows=200"					// 한 번에 가져올 자료의 개수
					+ "&pageNo=1"						// 페이지 넘버
					+ "&_type=json";					// json 타입
			
			URL url = new URL(urlDep);
			HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
			urlConnection.setRequestMethod("GET");
			
			BufferedReader bf = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
			
			String returnLine;
			while((returnLine = bf.readLine()) != null) {
				resultDep.append(returnLine);
			}
			
			String urlArv = "http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getFlightOpratInfoList?"
					+ "serviceKey=" + key.getKey()		// 서비스 키
					+ "&depAirportId=" + airportArv		// 출발 공항 입력 (제주로 지정)
					+ "&arrAirportId=" + airportDep		// 도착 공항 입력 (김포로 지정)
					+ "&depPlandTime=" + arrDate		// 도착 날짜 지정
					+ "&numOfRows=200"					// 한 번에 가져올 자료의 개수
					+ "&pageNo=1"						// 페이지 넘버
					+ "&_type=json";					// json 타입	
			URL url2 = new URL(urlArv);
			urlConnection = (HttpURLConnection)url2.openConnection();
			urlConnection.setRequestMethod("GET");
			
			bf = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
			
			String returnLine2;
			while((returnLine2 = bf.readLine()) != null) {
				resultArv.append(returnLine2);
			}
			
			JSONParser jsonParser = new JSONParser();
			
	        JSONObject jsonObject = (JSONObject) jsonParser.parse(resultDep.toString());
	        JSONObject parse_response = (JSONObject) jsonObject.get("response");
	        JSONObject parse_body = (JSONObject) parse_response.get("body"); // response 로 부터 body 찾아오기
	        JSONObject parse_items = (JSONObject) parse_body.get("items"); // body 로 부터 items 받아오기
	        // items 로 부터 itemList : 뒤에 [ 로 시작하므로 jsonArray 이다.
	        JSONArray parse_item = (JSONArray) parse_items.get("item");
	        
	        JSONObject jsonObject2 = (JSONObject) jsonParser.parse(resultArv.toString());
	        JSONObject parse_response2 = (JSONObject) jsonObject2.get("response");
	        JSONObject parse_body2 = (JSONObject) parse_response2.get("body"); // response 로 부터 body 찾아오기
	        JSONObject parse_items2 = (JSONObject) parse_body2.get("items"); // body 로 부터 items 받아오기
	        // items 로 부터 itemList : 뒤에 [ 로 시작하므로 jsonArray 이다.
	        JSONArray parse_item2 = (JSONArray) parse_items2.get("item");
	        
	        // 가는편 오브젝트 배열에 담아 출력
	        ArrayList<JSONObject> objDep = new ArrayList<JSONObject>();
	        ArrayList<JSONObject> objArv = new ArrayList<JSONObject>();
	        
	        if(parse_item.size() < parse_item2.size()) {
	        	for(int i = 0; i<parse_item.size(); i++) {
	        		objDep.add((JSONObject) parse_item.get(i));
	        		objArv.add((JSONObject) parse_item2.get(i));
	        	}
	        } else if (parse_item.size() > parse_item2.size()) {
	        	for(int i = 0; i<parse_item2.size(); i++) {
	        		objDep.add((JSONObject) parse_item.get(i));
	        		objArv.add((JSONObject) parse_item2.get(i));
	        	}
	        }
			
	        // 로그인한 상태로 검색 시 최근 검색 기록에 추가
	        String memId = (String) session.getAttribute("sid");
	        if(memId != null) {
	        	vo.setMemId(memId);
	            
	            int count = hService.checkInHistory(vo.getHistoryDep(), vo.getHistoryArr(), memId);
	            
	            if(count == 0) {
	            	hService.insertHistory(vo);
	            } else {
	            	hService.updateHistory(vo);
	            }
	        }
	        
	        mv.addObject("objDep", objDep);
	        mv.addObject("objArv", objArv);
			
			urlConnection.disconnect();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
        
        
        mv.addObject("depart_location", depart_location); // 출발지
        mv.addObject("arrive_location", arrive_location); // 도착지
		mv.addObject("shuttle", shuttle); // 왕복 편도 다구간
		mv.addObject("daterange", daterange); // 기간
		mv.addObject("personCount", personCount); // 인원수
		mv.addObject("classType",classType); // 좌석 타입
		 
        mv.setViewName("flight/flight_list");
		
		return mv;
	}
	
}

