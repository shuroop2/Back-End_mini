package com.cooltimetrip.project.dao;

import java.util.ArrayList;

import com.cooltimetrip.project.model.HotelVO;

public interface IHotelDAO {
	public ArrayList<HotelVO> listAllHotel();	// 전체 호텔 조회
}
