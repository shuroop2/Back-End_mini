package com.cooltimetrip.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cooltimetrip.project.dao.IBookedFlightDAO;
import com.cooltimetrip.project.model.BookedFlightVO;

@Service
public class BookedService implements IBookedService {
	@Autowired
	@Qualifier("IBookedFlightDAO")
	IBookedFlightDAO dao;

	@Override
	public void insertFlight(BookedFlightVO booked) {
		dao.insertFlight(booked);

	}

	@Override
	public ArrayList<BookedFlightVO> bookedList(String memId) {
		
		return dao.bookedList(memId);
	}

	@Override
	public void deleteFlight(int bookedFlightNo) {
		dao.deleteFlight(bookedFlightNo);

	}

}
