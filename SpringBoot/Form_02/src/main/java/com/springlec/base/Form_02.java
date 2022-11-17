package com.springlec.base;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Form_02 {

//	@RequestMapping("/student/{studentId}")
//	public String getStudent(@PathVariable String studentId, Model model) {
//		model.addAttribute("studentId", studentId);
//		return "student/studentView";
//	}
	
	@RequestMapping("/")
	public String view() {
		return "student/studentIdForm";
	}
	
	@RequestMapping(value = "/studentId")
	public String getStudent(@RequestParam String studentId,Model model) {
		model.addAttribute("studentId", studentId);
		return "student/studentView";
	}
}
