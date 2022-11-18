package com.springlec.base.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.springlec.base.model.BDto;
import com.springlec.base.service.BDaoService;

@Controller
public class BController {

	@Autowired
	BDaoService service;
	
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
	
	// 게시판 입력 실행
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) throws Exception {
		service.writeDao(request.getParameter("bName"), request.getParameter("bTitle"));
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) throws Exception {
		service.deleteDao(Integer.parseInt(request.getParameter("bId")));
		return "redirect:list";
	}
} // ----
