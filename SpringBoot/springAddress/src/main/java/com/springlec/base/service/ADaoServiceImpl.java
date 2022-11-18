package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.ADao;
import com.springlec.base.model.ADto;

@Service
public class ADaoServiceImpl implements ADaoService{
	
	@Autowired
	ADao dao;

	@Override
	public List<ADto> listDao(String type, String search) throws Exception {
		return dao.listDao(type, search);
	}
	
	@Override
	public void writeDao(String name, String tel, String address, String email, String relation) throws Exception {
		dao.writeDao(name, tel, address, email, relation);
	}
	
	@Override
	public ADto viewDao(int seq) throws Exception {
		return dao.viewDao(seq);
	}
	
	@Override
	public void updateDao(int seq, String name, String tel, String address, String email, String relation)
			throws Exception {
		dao.updateDao(seq, name, tel, address, email, relation);
	}
	
	@Override
	public void deleteDao(int seq) throws Exception {
		dao.deleteDao(seq);
	}
}
