package com.cooltimetrip.project.dao;

import java.util.ArrayList;

import com.cooltimetrip.project.model.BookedStayVO;

public interface IBookedStayDAO {
	public ArrayList<BookedStayVO> allBookedStayList(String memId);
	public void insertBookedStayInfo(BookedStayVO svo);
}
