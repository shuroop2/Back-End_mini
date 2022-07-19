package com.cooltimetrip.project.controller; 

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cooltimetrip.project.model.MemberVO;
import com.cooltimetrip.project.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memService;
	
	@RequestMapping("/login") 
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/signup")
	public String signup() {
		return "member/signup";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "member/mypage";
	}
	
	@RequestMapping("/mypage_authentication")
	public String mypageAuthentication() {
		return "member/mypage_authentication";
	}
	 
	@RequestMapping("/mypage_update_main")
	public String mypageUpdateMain() {
		return "member/mypage_update_main";
	}
	
	@RequestMapping("/mypage_update_password")
	public String mypageUpdatePassword() {
		return "member/mypage_update_password";
	}
	
	@RequestMapping("/mypage_update_phone")
	public String mypageUpdatePhone() {
		return "member/mypage_update_phone";
	} 
	
	// 로그인 처리     
	@ResponseBody
	@RequestMapping("/loginCheck") 
	public String loginCheck(@RequestParam HashMap<String, Object> param, HttpSession session) { 
		String memId = memService.loginCheck(param); 
		String result = "fail";
 
		// 아이디/비밀번호 일치하면 
		if(memId!=null) { // 로그인 성공 시 세션 변수 지정
			session.setAttribute("sid", memId); 
			result = "success"; 
		}
  		return result; 
	}
	 
	// 로그인 처리 (비밀번호 암호화)   
//	@ResponseBody
//	@RequestMapping("/loginCheck")
//	public String loginCheck(@RequestParam HashMap<String, Object> param, HttpSession session) {
//		String result = memService.loginCheck(param);
//		
//		// 아이디/비밀번호 일치하면
//		if(result.equals("success")) {
//			// 로그인 성공 시 세션 변수 지정
//			session.setAttribute("sid", param.get("id"));
//		}
//		return result;  
//	}  
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원가입 요청

	@RequestMapping("/signupMember") 
	public String signupMember(MemberVO vo) {
		memService.insertMember(vo); 
		return "/member/login";
	}

	
	
}
