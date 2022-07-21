package com.cooltimetrip.project.dao;

import java.util.HashMap;

import com.cooltimetrip.project.model.MemberVO;

public interface IMemberDAO {
	public String loginCheck(HashMap<String, Object> map);
	void insertMember(MemberVO vo);
	public MemberVO getMemberInfo(String memId);
	public String mypageAuthentication(String memId);
	void updateMemName(String memId, String memName);  
	void updateMemPwd(String memId, String memPwd);
	void updateMemPhone(String memId, String memPhone);
	void deleteMember(String memId);
}
