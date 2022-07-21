package com.cooltimetrip.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.cooltimetrip.project.model.BookedFlightVO;

public interface IBookedService {
	
	public void insertFlight(BookedFlightVO booked);
	public ArrayList<BookedFlightVO> bookedList(String memId);
	public void deleteFlight(int bookedFlightNo);
	
}
