package com.cooltimetrip.project.service;

import java.util.ArrayList;

import com.cooltimetrip.project.model.BookedStayVO;

public interface IBookedStayService {
	public ArrayList<BookedStayVO> allBookedStayList(String memId);
	public void insertBookedStayInfo(BookedStayVO svo);
}
