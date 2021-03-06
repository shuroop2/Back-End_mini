package com.cooltimetrip.project.service;

import java.util.ArrayList;

import com.cooltimetrip.project.model.BookedRentVO;
import com.cooltimetrip.project.model.CarVO;

public interface IRentService {
	public ArrayList<CarVO> listAllCar();			// 전체 차량 조회
	public CarVO detailViewCar(int carNo);			// 상세 차량 정보 조회 (1개의 차량 정보와 렌터카 업체 정보)
	
	public void insertBookedRentInfo(BookedRentVO vo);				// 예약 내용 저장
	public ArrayList<BookedRentVO> listBookedCar(String memId);
}
