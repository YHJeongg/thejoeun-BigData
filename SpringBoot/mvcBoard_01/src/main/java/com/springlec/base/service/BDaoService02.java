package com.springlec.base.service;

import javax.servlet.http.HttpServletRequest;

import com.springlec.base.model.BDto;

public interface BDaoService02 {
	
	public void writeDao(HttpServletRequest request) throws Exception;
	public BDto viewDao(int bId) throws Exception;
	public void deleteDao(int bId) throws Exception;
	public void updateDao(int bId, String bName, String bTitle, String bContent) throws Exception;

}
