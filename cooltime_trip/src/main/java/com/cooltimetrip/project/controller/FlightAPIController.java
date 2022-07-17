package com.cooltimetrip.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cooltimetrip.project.model.KeyValue;

@RestController
public class FlightAPIController {
	
	@ResponseBody
	@RequestMapping(value="/flight_list", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView callapihttp(ModelAndView mv, KeyValue key) throws Exception {

		// 김포/제주
		String[] airports = {"NAARKSS", "NAARKPC"};
		
		// 가는편, 오는편의 String을 담을 result 선언
		StringBuffer resultDep = new StringBuffer();
		StringBuffer resultArv = new StringBuffer();
	
		try {
			// 가는편 요청 url 작성
			String urlDep = "http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getFlightOpratInfoList"
					+ "?serviceKey=" + key.getKey()		// 서비스 키
					+ "&depAirportId=" + airports[0]	// 출발 공항 입력 (김포로 지정)
					+ "&arrAirportId=" + airports[1]	// 도착 공항 입력 (제주로 지정)
					+ "&depPlandTime=20220701"			// 출발 날짜 지정
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
					+ "&depAirportId=" + airports[1]	// 출발 공항 입력 (제주로 지정)
					+ "&arrAirportId=" + airports[0]	// 도착 공항 입력 (김포로 지정)
					+ "&depPlandTime=20220703"			// 도착 날짜 지정
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
			
			urlConnection.disconnect();
		}catch(Exception e){
			e.printStackTrace();
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
        for(int i = 0; i<parse_item.size(); i++) {
        	objDep.add((JSONObject) parse_item.get(i));
        }
        
        ArrayList<JSONObject> objArv = new ArrayList<JSONObject>();
        for(int i = 0; i<parse_item2.size(); i++) {
        	objArv.add((JSONObject) parse_item2.get(i));
        }
        
        mv.addObject("objDep", objDep);
        mv.addObject("objArv", objArv);
        
        mv.setViewName("flight/flight_list");
		
		return mv;
	}
}
