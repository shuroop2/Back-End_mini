package com.cooltimetrip.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StayController {
	
	@RequestMapping("/stay")
	public String viewStayMain() {
		return "stay/stay_main";
	}
}
