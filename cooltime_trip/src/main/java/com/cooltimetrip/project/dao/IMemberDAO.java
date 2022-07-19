package com.cooltimetrip.project.dao;

import java.util.HashMap;

import com.cooltimetrip.project.model.MemberVO;

public interface IMemberDAO {
	public String loginCheck(HashMap<String, Object> map);
	public MemberVO getMemberInfo(String memId);
}
