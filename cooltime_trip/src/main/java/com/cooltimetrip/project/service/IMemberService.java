package com.cooltimetrip.project.service;

import java.util.HashMap;

import com.cooltimetrip.project.model.MemberVO;

public interface IMemberService {
	public String loginCheck(HashMap<String, Object> map);
	public MemberVO getMemberInfo(String memId);
}
