package com.springlec.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.BDto;

public class BDaoImpl01 implements BDao01 {
	
	SqlSession sqlSession;
	
	public static String nameSpace1 = "com.springlec.base.dao.BDao01";

	@Override
	public List<BDto> listDao() throws Exception {
		return sqlSession.selectList(nameSpace1 + ".listDao");
	}
}
