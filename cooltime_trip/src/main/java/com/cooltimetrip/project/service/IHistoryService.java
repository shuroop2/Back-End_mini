package com.cooltimetrip.project.service;

import java.util.ArrayList;

import com.cooltimetrip.project.model.HistoryVO;

public interface IHistoryService {
	void insertHistory(HistoryVO vo);
	int checkInHistory(String historyDep, String historyArr , String memId);
	void updateHistory(HistoryVO vo);
	ArrayList<HistoryVO> historyList(String memId);
	void deleteHistory(int historyNo);
}
