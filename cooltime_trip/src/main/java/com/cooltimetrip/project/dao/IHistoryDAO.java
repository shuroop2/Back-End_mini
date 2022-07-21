package com.cooltimetrip.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.cooltimetrip.project.model.HistoryVO;

public interface IHistoryDAO {
	void insertHistory(HistoryVO vo);
	int checkInHistory(HashMap<String, Object> map);
	void updateHistory(HistoryVO vo);
	ArrayList<HistoryVO> historyList(String memId);
	void deleteHistory(int historyNo);
}
