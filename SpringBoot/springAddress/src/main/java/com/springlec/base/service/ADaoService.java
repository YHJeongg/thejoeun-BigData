package com.springlec.base.service;

import java.util.List;

import com.springlec.base.model.ADto;

public interface ADaoService {
	
	public List<ADto> listDao(String type, String search) throws Exception;
	public void writeDao(String name, String tel, String address, String email, String relation) throws Exception;
	public ADto viewDao(int seq) throws Exception;
	public void deleteDao(int seq) throws Exception;
	public void updateDao(int seq, String name, String tel, String address, String email, String relation) throws Exception;

}
