package com.cooltimetrip.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RentController {
	@RequestMapping("/rent/rent_detail")
	public String rentDetail() {
		return "rent/rent_detail";
	}
}
