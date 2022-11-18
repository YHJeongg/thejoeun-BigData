package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.BDao;
import com.springlec.base.model.BDto;

@Service
public class BDaoServiceImpl implements BDaoService{
	
	@Autowired
	BDao dao;

	@Override
	public List<BDto> listDao() throws Exception {
		return dao.listDao();
	}
	
	@Override
	public void writeDao(String bName, String bTitle) throws Exception {
		dao.writeDao(bName, bTitle);
	}
	
	@Override
	public void deleteDao(int bId) throws Exception {
		dao.deleteDao(bId);
	}
	
}
