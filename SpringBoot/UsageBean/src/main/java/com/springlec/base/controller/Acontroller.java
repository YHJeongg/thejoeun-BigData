package com.springlec.base.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.service.CalcService;

@Controller
public class Acontroller {
	
	@Autowired
	CalcService service;
	
	@RequestMapping("/")
	public String input() {
		return "input";
	}
	
	@RequestMapping("/addCalc")
	public String calc(HttpServletRequest request, Model model) throws Exception {
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		int addResult = service.addAction(num1, num2);
		int multiResult = service.multiAction(num1, num2);
		
		model.addAttribute("num1", num1);
		model.addAttribute("num2", num2);
		model.addAttribute("addition", addResult);
		model.addAttribute("multiply", multiResult);
		
		return "calcResult";
	}
	
}
