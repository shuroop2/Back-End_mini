package com.cooltimetrip.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String viewIndex() {
		return "flight/flight_main";
	}
}
