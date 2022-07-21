package com.cooltimetrip.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cooltimetrip.project.dao.IHotelDAO;
import com.cooltimetrip.project.model.HotelVO;
import com.cooltimetrip.project.model.RoomVO;

@Service
public class HotelService implements IHotelService {
	
	@Autowired
	@Qualifier("IHotelDAO")
	IHotelDAO dao;

	@Override
	public ArrayList<HotelVO> listAllHotel() {
		return dao.listAllHotel();
	}

	@Override
	public HotelVO viewDetailRoom(String hotelNo) {
		return dao.viewDetailRoom(hotelNo);
	}

	
}
