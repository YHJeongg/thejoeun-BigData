package com.springlec.base.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.ADto;
import com.springlec.base.service.ADaoService;

@Controller
public class AController {

	@Autowired
	ADaoService service;
	
	@RequestMapping("/list")
	public String list(Model model) throws Exception{
		List<ADto> listDao = service.listDao();
		model.addAttribute("list", listDao);
		return "list";
	}
	
} // ----
