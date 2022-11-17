package com.jsplec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.jsplec.dto.UserDTO;

public class UserDAO {
	
	DataSource dataSource;

	public UserDAO() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mvc");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int join(UserDTO user) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = dataSource.getConnection();
			
			String query = "insert into user values (?,?,?,?,false)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, user.getUserID());
			preparedStatement.setString(2, user.getUserPassword());
			preparedStatement.setString(3, user.getUserEmail());
			preparedStatement.setString(4, user.getUserEmailHash());
			
			return preparedStatement.executeUpdate();
			
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
		return -1;
	}
	
	public String getUserEmail(String userID) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		try {
			connection = dataSource.getConnection(); 
			
			String query = "select userEmail from user where userID = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userID);
			
			rs = preparedStatement.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
			
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
		return null;
	}
	
	public boolean getUserEmailChecked(String userID) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		try {
			connection = dataSource.getConnection(); 
			
			String query = "select userEmailChecked from user where userID = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userID);
			
			rs = preparedStatement.executeQuery();
			
			if(rs.next()) {
				return rs.getBoolean(1);
			}
			
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
		return false;
	}
	
	public boolean setUserEmailChecked(String userID) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		try {
			connection = dataSource.getConnection(); 
			
			String query = "update user set userEmailChecked = true where userID = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userID);
			preparedStatement.executeUpdate();
			
			return true;
			
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
		return false;
	}
}
