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
	
	// 게시판 검색
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) throws Exception{
		List<ADto> listDao = service.listDao(request.getParameter("type"), request.getParameter("search"));
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
		service.writeDao(request.getParameter("name"), request.getParameter("tel"), request.getParameter("address"), 
				request.getParameter("email"), request.getParameter("relation"));
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) throws Exception {
		service.deleteDao(Integer.parseInt(request.getParameter("seq")));
		return "redirect:list";
	}
	
	// 게시판 개별 검색
	@RequestMapping("/content_view")
	public String contentView(HttpServletRequest request, Model model) throws Exception {
		ADto contentDto = service.viewDao(Integer.parseInt(request.getParameter("seq")));
		model.addAttribute("content_view", contentDto);
		return "content_view";
	}

	@RequestMapping("/modify")
	public String update(HttpServletRequest request, Model model) throws Exception {
		service.updateDao(Integer.parseInt(request.getParameter("seq")), request.getParameter("name"),
				request.getParameter("tel"), request.getParameter("address"), request.getParameter("email"), request.getParameter("relation"));
		return "redirect:list";
	}
} // ----
