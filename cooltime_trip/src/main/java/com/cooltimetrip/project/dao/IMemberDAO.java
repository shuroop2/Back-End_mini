package com.cooltimetrip.project.dao;

import java.util.HashMap;

import com.cooltimetrip.project.model.MemberVO;

public interface IMemberDAO {
	public String loginCheck(HashMap<String, Object> map);
	void insertMember(MemberVO vo);
	public MemberVO getMemberInfo(String memId);
}
