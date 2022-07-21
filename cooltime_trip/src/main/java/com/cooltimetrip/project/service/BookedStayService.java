package com.cooltimetrip.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cooltimetrip.project.dao.IBookedStayDAO;
import com.cooltimetrip.project.model.BookedStayVO;

@Service
public class BookedStayService implements IBookedStayService {
	@Autowired
	@Qualifier("IBookedStayDAO")
	IBookedStayDAO dao;

	@Override
	public ArrayList<BookedStayVO> allBookedStayList(String memId) {
		return dao.allBookedStayList(memId);
	}

	@Override
	public void insertBookedStayInfo(BookedStayVO svo) {
		dao.insertBookedStayInfo(svo);
	}

}
