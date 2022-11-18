package com.springlec.base.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.BDto;
import com.springlec.base.service.BDaoService01;

@Controller
public class BController01 {

	@Autowired
	BDaoService01 service;
	
	// 게시판 검색
	@RequestMapping("/list")
	public String list(Model model) throws Exception{
		List<BDto> listDao = service.listDao();
		model.addAttribute("list", listDao);
		return "list";
	}
	
	// 게시판 입력 화면
	@RequestMapping("/write_view")
	public String writeview() {
		return "write_view";
	}
	
} // ----
