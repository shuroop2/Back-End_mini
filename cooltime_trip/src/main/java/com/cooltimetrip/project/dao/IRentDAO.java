package com.cooltimetrip.project.dao;

import java.util.ArrayList;

import com.cooltimetrip.project.model.CarVO;

public interface IRentDAO {
	public ArrayList<CarVO> listAllCar();	// 전체 차량 조회
}
