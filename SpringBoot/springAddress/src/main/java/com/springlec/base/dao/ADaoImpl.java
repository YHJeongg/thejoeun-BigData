package com.springlec.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.ADto;

public class ADaoImpl implements ADao {
	
	SqlSession sqlSession;
	
	public static String nameSpace = "com.springlec.base.dao.ADao";

	@Override
	public List<ADto> listDao(String type, String search) throws Exception {
		return sqlSession.selectList(nameSpace + ".listDao");
	}
	
	@Override
	public void writeDao(String name, String tel, String address, String email, String relation) throws Exception {
		sqlSession.insert(nameSpace + ".writeDao");
		
	}
	
	@Override
	public ADto viewDao(int seq) throws Exception {
		return (ADto) sqlSession.selectList(nameSpace + ".viewDao");
	}
	
	@Override
	public void updateDao(int seq, String name, String tel, String address, String email, String relation)
			throws Exception {
		sqlSession.update(nameSpace + ".updateDao");
		
	}
	
	@Override
	public void deleteDao(int seq) throws Exception {
		sqlSession.delete(nameSpace + ".deleteDao");
	}
}
