package com.tis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class EventController {
	
	@GetMapping("/event")
	public String event() {
		log.info("get event .............................");
		return "event/event";
	}
}
