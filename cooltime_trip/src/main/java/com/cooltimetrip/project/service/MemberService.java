package com.cooltimetrip.project.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cooltimetrip.project.dao.IMemberDAO;
import com.cooltimetrip.project.model.MemberVO;

@Service
public class MemberService implements IMemberService {
	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO dao;
	
	@Override
	public String loginCheck(HashMap<String, Object> map) {
		return dao.loginCheck(map);
	}
	
	@Override
	public void insertMember(MemberVO vo) {
		dao.insertMember(vo);
	}
	
	@Override
	public MemberVO getMemberInfo(String memId) {
		return dao.getMemberInfo(memId);
	}
	
	@Override
	public String mypageAuthentication(String memId) {
		return dao.mypageAuthentication(memId);
	}
	
	@Override
	public void updateMemName(String memId, String memName) {
		dao.updateMemName(memId, memName);
	}

	@Override
	public void updateMemPwd(String memId, String memPwd) {
		dao.updateMemPwd(memId, memPwd);
	}

	@Override
	public void updateMemPhone(String memId, String memPhone) {
		dao.updateMemPhone(memId, memPhone);
	}

	@Override
	public void deleteMember(String memId) {
		dao.deleteMember(memId);
	}

	@Override
	public String checkMemId(String memId) {
		return dao.checkMemId(memId);
	}

//	@Override
//	public int checkMemId(MemberVO vo) {
//		int result = dao.checkMemId(vo);
//		return result;
//	}
}
 