package com.cooltimetrip.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
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
}
