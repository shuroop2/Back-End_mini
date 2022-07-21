package com.cooltimetrip.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.cooltimetrip.project.model.BookedFlightVO;

public interface IBookedFlightDAO {
	
	public void insertFlight(BookedFlightVO booked);
	public ArrayList<BookedFlightVO> bookedList(String memId);
	public void deleteFlight(int bookedFlightNo);
	
}

