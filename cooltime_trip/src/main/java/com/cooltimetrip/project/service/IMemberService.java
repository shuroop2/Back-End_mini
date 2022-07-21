package com.cooltimetrip.project.service;

import java.util.HashMap;

import com.cooltimetrip.project.model.MemberVO;

public interface IMemberService {
	public String loginCheck(HashMap<String, Object> map);
	void insertMember(MemberVO vo);
	public MemberVO getMemberInfo(String memId);
	public String mypageAuthentication(String memId);
	void updateMemPwd(String memId, String memPwd);
	void updateMemName(String memId, String memName);
	void updateMemPhone(String memId, String memPhone);
	//public String mypageAuthentication(HashMap<String, Object> map);
	//public boolean mypageAuthentication(String memId, String memPwd);
}
