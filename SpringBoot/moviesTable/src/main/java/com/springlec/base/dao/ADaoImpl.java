package com.springlec.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.ADto;

public class ADaoImpl implements ADao {
	
	SqlSession sqlSession;
	
	public static String nameSpace = "com.springlec.base.dao.ADao";

	@Override
	public List<ADto> listDao() throws Exception {
		return sqlSession.selectList(nameSpace + ".listDao");
	}
}
