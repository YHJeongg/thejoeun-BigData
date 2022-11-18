package com.springlec.base.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.BDao02;
import com.springlec.base.model.BDto;

@Service
public class BDaoServiceImpl02 implements BDaoService02{
	
	@Autowired
	BDao02 dao;

	@Override
	public void writeDao(HttpServletRequest request) throws Exception {
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		dao.writeDao(bName, bTitle, bContent);
	}
	
	@Override
	public BDto viewDao(int bId) throws Exception {
		return dao.viewDao(bId);
	}
	
	@Override
	public void deleteDao(int bId) throws Exception {
		dao.deleteDao(bId);
	}
	
	@Override
	public void updateDao(int bId, String bName, String bTitle, String bContent) throws Exception {
		dao.updateDao(bId, bName, bTitle, bContent);
	}
	
}
