package com.cooltimetrip.project.dao;

import java.util.ArrayList;

import com.cooltimetrip.project.model.HotelVO;

public interface IHotelDAO {
	public ArrayList<HotelVO> listAllHotel();	// 전체 호텔 조회
	public HotelVO viewDetailRoom(String hotelNo);	// 호텔 룸 상세조회
}
