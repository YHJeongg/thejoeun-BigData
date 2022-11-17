package com.jsplec.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.jsplec.bbs.dto.ADto;

public class ADao {
	
DataSource dataSource;
	
	public ADao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mvc");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 전체 검색
	public ArrayList<ADto> list() {
		ArrayList<ADto> dtos = new ArrayList<ADto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String query = "select seq, name, tel, address, email, relation from ABQuery";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int seq = resultSet.getInt("seq");
				String name = resultSet.getString("name");
				String tel = resultSet.getString("tel");
				String address = resultSet.getString("address");
				String email = resultSet.getString("email");
				String relation = resultSet.getString("relation");
				
				ADto dto = new ADto(seq, name, tel, address, email, relation);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	} // list_view
	
	public void write(String name, String tel, String address, String email, String relation) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = dataSource.getConnection();
			
			String query = "insert into ABQuery (name, tel, address, email, relation) values (?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, tel);
			preparedStatement.setString(3, address);
			preparedStatement.setString(4, email);
			preparedStatement.setString(5, relation);
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // write_view
	
	public ADto contentView(String sSeq) {
		ADto dto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String query = "select * from ABQuery where seq = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(sSeq));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				int seq = resultSet.getInt("seq");
				String name = resultSet.getString("name");
				String tel = resultSet.getString("tel");
				String address = resultSet.getString("address");
				String email = resultSet.getString("email");
				String relation = resultSet.getString("relation");
				
				dto = new ADto(seq, name, tel, address, email, relation);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	} // content_view
	
	public void modify(int seq, String name, String tel, String address, String email, String relation) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = dataSource.getConnection();
			
			String query = "update ABQuery set name = ?, tel = ?, address = ?, email = ?, relation = ? where seq = ?";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, tel);
			preparedStatement.setString(3, address);
			preparedStatement.setString(4, email);
			preparedStatement.setString(5, relation);
			preparedStatement.setInt(6, seq);
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void delete(int seq) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = dataSource.getConnection();
			
			String query = "delete from ABQuery where seq = ?";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setInt(1, seq);
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
