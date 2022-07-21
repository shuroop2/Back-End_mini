package com.cooltimetrip.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cooltimetrip.project.dao.IHistoryDAO;
import com.cooltimetrip.project.model.HistoryVO;

@Service
public class HistoryService implements IHistoryService {
	@Autowired
	@Qualifier("IHistoryDAO")
	IHistoryDAO dao;
	
	@Override
	public void insertHistory(HistoryVO vo) {
		dao.insertHistory(vo);
	}

	@Override
	public int checkInHistory(String historyDep, String historyArr, String memId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("historyDep", historyDep);
		map.put("historyArr", historyArr);
		map.put("memId", memId);
		return dao.checkInHistory(map);
	}

	@Override
	public void updateHistory(HistoryVO vo) {
		dao.updateHistory(vo);
	}

	@Override
	public ArrayList<HistoryVO> historyList(String memId) {
		return dao.historyList(memId);
	}

	@Override
	public void deleteHistory(int historyNo) {
		dao.deleteHistory(historyNo);
	}

}
