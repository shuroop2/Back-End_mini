package com.cooltimetrip.project.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cooltimetrip.project.dao.IRoomDAO;

@Service
public class RoomService implements IRoomService {
	
	@Autowired
	@Qualifier("IRoomDAO")
	IRoomDAO dao;

	@Override
	public HashMap<String, Object> getRoomprice(String hotelNo) {
		return dao.getRoomprice(hotelNo);
	}


}
