package com.tis.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class HomeController {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		
		log.info("Welcome home!");
		return "index";
	}
	
}
