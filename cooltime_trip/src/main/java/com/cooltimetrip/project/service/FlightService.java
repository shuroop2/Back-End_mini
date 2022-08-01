package com.cooltimetrip.project.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.cooltimetrip.project.model.FlightVO;

@Service
public class FlightService {
	public ArrayList<FlightVO> flight(String key, String airportDep, String airportArr, String daterange) throws Exception {
		ArrayList<FlightVO> fList = new ArrayList<FlightVO>();
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getFlightOpratInfoList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + key); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*데이터 타입(xml, json)*/
        urlBuilder.append("&" + URLEncoder.encode("depAirportId","UTF-8") + "=" + URLEncoder.encode(airportDep, "UTF-8")); /*출발공항ID*/
        urlBuilder.append("&" + URLEncoder.encode("arrAirportId","UTF-8") + "=" + URLEncoder.encode(airportArr, "UTF-8")); /*도착공항ID*/
        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(daterange, "UTF-8")); /*출발일(YYYYMMDD)*/
        URL url = new URL(urlBuilder.toString());
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        fList = jsonToVOList(sb.toString());
        
        return fList;
	}

	private ArrayList<FlightVO> jsonToVOList(String jsonResultStr) throws Exception {
		ArrayList<FlightVO> fList = new ArrayList<FlightVO>();
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonResultStr);
		JSONObject parse_response = (JSONObject) jsonObject.get("response");
		JSONObject parse_body = (JSONObject) parse_response.get("body");
        JSONObject parse_items = (JSONObject) parse_body.get("items");
        JSONArray parse_item = (JSONArray) parse_items.get("item");
        
        for(int i=0; i<parse_item.size(); i++) {
        	FlightVO vo = new FlightVO();
        	JSONObject tempObj = (JSONObject) parse_item.get(i);
        	if(tempObj.containsKey("economyCharge") == false) continue;
        	
        	vo.setVihicleId((String) tempObj.get("vihicleId"));
        	vo.setAirlineNm((String) tempObj.get("airlineNm"));
        	vo.setDepPlandTime((long) tempObj.get("depPlandTime"));
        	vo.setArrPlandTime((long) tempObj.get("arrPlandTime"));
        	vo.setEconomyCharge((long) tempObj.get("economyCharge"));
        	vo.setPrestigeCharge((long) tempObj.get("prestigeCharge"));
        	vo.setDepAirportNm((String) tempObj.get("depAirportNm"));
        	vo.setArrAirportNm((String) tempObj.get("arrAirportNm"));
        	
        	fList.add(vo);
        }
		
		return fList;
	}
}
