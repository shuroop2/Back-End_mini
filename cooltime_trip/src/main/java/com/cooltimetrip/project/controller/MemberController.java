package com.cooltimetrip.project.controller; 

import java.util.HashMap;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 회원가입 - 아이디 중복 체크
	@ResponseBody
	@RequestMapping("/checkMemId")
	public String checkMemId(@RequestParam("memId") String memId) {
		String memId_result = memService.checkMemId(memId);
		
		String result = "use";
		if(memId_result != null)
			result = "no_use";
		
		return result;
	}
	
	// 회원가입 - 비밀번호 확인
	@ResponseBody
	@RequestMapping("/checkMemPwd")
	public String checkMemPwd(@RequestParam("memPwd") String memPwd) {
		String result = "fail";
		if(memPwd.length() < 8 ||memPwd.length() > 16) {
			result = "success";
		}
		return result;
	}
	
	// 회원가입 - 휴대폰번호 인증
	@ResponseBody
	@RequestMapping("/checkMemPhone")
	public String checkMemPhone(@RequestParam("memPhoneSerial") String memPhoneSerial
								, @RequestParam("memPhoneCheck") String memPhoneCheck) {
		String result = "fail";
		if(memPhoneCheck.equals(memPhoneSerial)) {
			result = "success";
		}
		return result;
	}
	
	// 회원가입 요청
	@RequestMapping("/signupMember") 
	public String signupMember(MemberVO vo
	
	  ,@RequestParam("resultId") String resultId 
	  ,@RequestParam("resultPwd") String resultPwd 
	  ,@RequestParam("resultName") String resultName
	  ,@RequestParam("resultPhone") String resultPhone
	  ,@RequestParam("resultEmail") String resultEmail
	 ) {
		vo.setMemId(resultId);
		vo.setMemPwd(resultPwd);
		vo.setMemName(resultName);
		vo.setMemPhone(resultPhone);
		vo.setMemEmail(resultEmail);
		memService.insertMember(vo); 
		return "/member/login";
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
//		@ResponseBody
//		@RequestMapping("/loginCheck")
//		public String loginCheck(@RequestParam HashMap<String, Object> param, HttpSession session) {
//			String result = memService.loginCheck(param);
//			
//			// 아이디/비밀번호 일치하면
//			if(result.equals("success")) {
//				// 로그인 성공 시 세션 변수 지정
//				session.setAttribute("sid", param.get("id"));
//			}
//			return result;  
//		}  
	
	// 내 정보 비밀번호 인증 페이지
	@RequestMapping("/mypage_authentication")
	public String mypageAuthentication() {
		return "member/mypage_authentication";
	}  
	
	// 내 정보 비밀번호 인증 확인 
	@ResponseBody
	@RequestMapping("/mypageCheck") 
	public String mypageCheck(String input_pwd, HttpSession session) {
		String memId = (String) session.getAttribute("sid");
		MemberVO mem = memService.getMemberInfo(memId);
		String inputPwd = input_pwd;
		String memPwd = mem.getMemPwd(); 
		 
		String result = "fail";
		
		if(inputPwd.length() > 0) {
			if(inputPwd.equals(memPwd)) { 
				result="success";
			} else {	
				result = "fail";
			}	
		}  
		return result; 
	}
	 
	// 내 정보 수정 메인
	@RequestMapping("/mypage_update_main")
	public String mypageUpdateMain(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) {
		String memId = (String) session.getAttribute("sid");
		MemberVO mem = memService.getMemberInfo(memId);
		
		model.addAttribute("mem", mem); 
		return "member/mypage_update_main";
	}
	
	// 내 정보 수정 - memName
	@ResponseBody 
	@RequestMapping("/mypageUpdateMemName")  
	public String mypageUpdateMemName(String input_name, HttpSession session) {
		String memId = (String) session.getAttribute("sid");
		String result = "fail";
		
		if(input_name.length()!=0) {
			//System.out.println("value:"+input_name+"length:"+input_name.length());
			memService.updateMemName(memId, input_name);
			result = "success";  
		}
		return result;
	} 
	 
	// 비밀변호 변경 페이지
	@RequestMapping("/mypage_update_password")
	public String mypageUpdatePassword() {
		return "member/mypage_update_password";
	}
	  
	// 비밀번호 변경 처리   
	@ResponseBody
	@RequestMapping("/updatePassword") 
	public String updatePassword(HttpSession session
								,@RequestParam("input_pwd") String input_pwd
								,@RequestParam("check_pwd") String check_pwd
								) {
		String memId = (String) session.getAttribute("sid");
		MemberVO mem = memService.getMemberInfo(memId);
		String memPwd = mem.getMemPwd();
		 
		String result = "fail";
		if((input_pwd.length()<8 || input_pwd.length()>15)
			|| (input_pwd.equals(memPwd))
			|| !(input_pwd.equals(check_pwd))) {
		}else {
			result = "success";	
			memService.updateMemPwd(memId, input_pwd);
		}
		return result;
	}
	
	// 전화번호 변경 페이지
	@RequestMapping("/mypage_update_phone") 
	public String mypageUpdatePhone() {
		return "member/mypage_update_phone";
	} 
	
	// 전화번호 변경 처리   
	@ResponseBody
	@RequestMapping("/updatePhone") 
	public String updatePhone(HttpSession session
								,@RequestParam("input_phone") String input_phone
								,@RequestParam("input_serial") String input_serial
								,@RequestParam("input_check") String input_check
								) {
		String memId = (String) session.getAttribute("sid");
		String result = "fail";
		
		if(input_check.equals(input_serial)) {
			memService.updateMemPhone(memId, input_phone);
			result = "success";
		}
		return result;
	}
	
	// 회원탈퇴
	@RequestMapping("/deleteMember")
	public String deleteMember(HttpSession session) {
		String memId = (String) session.getAttribute("sid");
		memService.deleteMember(memId);
		session.invalidate();
		return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	} 

	// 예약 완료 요청
	@RequestMapping("/rsv_complete") 
	public String rsvComplete() {
		return "/member/mypage_rsv_complete";
	}
}
