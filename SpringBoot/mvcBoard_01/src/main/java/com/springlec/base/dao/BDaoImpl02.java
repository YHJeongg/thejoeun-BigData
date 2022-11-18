package com.springlec.base.dao;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.BDto;

public class BDaoImpl02 implements BDao02 {
	
	SqlSession sqlSession;
	
	public static String nameSpace2 = "com.springlec.base.dao.BDao02";

	
	@Override
	public void writeDao(String bName, String bTitle, String bContent) throws Exception {
		sqlSession.insert(nameSpace2 + ".writeDao");
		
	}
	
	@Override
	public BDto viewDao(int bId) throws Exception {
		return (BDto) sqlSession.selectList(nameSpace2 + ".viewDao");
	}
	
	@Override
	public void deleteDao(int bId) throws Exception {
		sqlSession.delete(nameSpace2 + ".deleteDao");
	}
	
	@Override
	public void updateDao(int bId, String bName, String bTitle, String bContent) throws Exception {
		sqlSession.update(nameSpace2 + ".updateDao");
	}
}
