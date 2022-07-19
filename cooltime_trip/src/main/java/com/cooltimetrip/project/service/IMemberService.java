package com.cooltimetrip.project.service;

import java.util.HashMap;

import com.cooltimetrip.project.model.MemberVO;

public interface IMemberService {
	public String loginCheck(HashMap<String, Object> map);
	void insertMember(MemberVO vo);
	public MemberVO getMemberInfo(String memId);
	String updatePassword(HashMap<String, Object> map); 
}
