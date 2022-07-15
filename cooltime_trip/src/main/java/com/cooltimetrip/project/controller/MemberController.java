package com.cooltimetrip.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@RequestMapping("/member/mypage")
	public String mypage() {
		return "member/mypage";
	}
	
	@RequestMapping("/member/mypage_authentication")
	public String mypageAuthentication() {
		return "member/mypage_authentication";
	}
	
	@RequestMapping("/member/mypage_update_main")
	public String mypageUpdateMain() {
		return "member/mypage_update_main";
	}
	
	@RequestMapping("/member/mypage_update_password")
	public String mypageUpdatePassword() {
		return "member/mypage_update_password";
	}
	
	@RequestMapping("/member/mypage_update_phone")
	public String mypageUpdatePhone() {
		return "member/mypage_update_phone";
	}
	
	@RequestMapping("/member/login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/member/signup")
	public String signup() {
		return "member/signup";
	}
}
