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
	public List<ADto> listDao() throws Exception {
		return dao.listDao();
	}
	
}
