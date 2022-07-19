package com.cooltimetrip.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cooltimetrip.project.dao.IRentDAO;
import com.cooltimetrip.project.model.CarVO;

@Service
public class RentService implements IRentService {
	
	@Autowired
	@Qualifier("IRentDAO")
	IRentDAO dao;

	@Override
	public ArrayList<CarVO> listAllCar() {
		return dao.listAllCar();
	}

}
