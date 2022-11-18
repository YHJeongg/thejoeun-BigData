package com.springlec.base.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.BDto;
import com.springlec.base.service.BDaoService02;

@Controller
public class BController02 {

	@Autowired
	BDaoService02 service;
	
	// 게시판 입력 실행
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) throws Exception {
		service.writeDao(request);
		return "redirect:list";
	}
	
	// 게시판 개별 검색
	@RequestMapping("/content_view")
	public String contentView(HttpServletRequest request, Model model) throws Exception {
		BDto contentDto = service.viewDao(Integer.parseInt(request.getParameter("bId")));
		model.addAttribute("content_view", contentDto);
		return "content_view";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) throws Exception {
		service.deleteDao(Integer.parseInt(request.getParameter("bId")));
		return "redirect:list";
	}
	
	@RequestMapping("/modify")
	public String update(HttpServletRequest request, Model model) throws Exception {
		service.updateDao(Integer.parseInt(request.getParameter("bId")), request.getParameter("bName"), 
				request.getParameter("bTitle"), request.getParameter("bContent"));
		return "redirect:list";
	}
	
} // ----
