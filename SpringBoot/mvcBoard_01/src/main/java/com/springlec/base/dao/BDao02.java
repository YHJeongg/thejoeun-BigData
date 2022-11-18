package com.springlec.base.dao;

import com.springlec.base.model.BDto;

public interface BDao02 {
	
	public void writeDao(String bName, String bTitle, String bContent) throws Exception;
	public BDto viewDao(int bId) throws Exception;
	public void deleteDao(int bId) throws Exception;
	public void updateDao(int bId, String bName, String bTitle, String bContent) throws Exception;

}
