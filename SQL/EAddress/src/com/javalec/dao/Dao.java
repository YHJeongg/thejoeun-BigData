package com.javalec.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.javalec.dto.Dto;
import com.javalec.util.DBConnect;

public class Dao {
	
	int seqno;
	String name;
	String telno;
	String address;
	String email;
	String relation;
	
	String conname;
	String condata;
	
	public Dao() {
		// TODO Auto-generated constructor stub
	}
	
	public Dao(String name, String telno, String address, String email, String relation) {
		super();
		this.name = name;
		this.telno = telno;
		this.address = address;
		this.email = email;
		this.relation = relation;
	}


	// Select List
	public Dao(int seqno, String name, String telno, String relation) {
		super();
		this.seqno = seqno;
		this.name = name;
		this.telno = telno;
		this.relation = relation;
	}
	
	// Table Click
	public Dao(int seqno) {
		super();
		this.seqno = seqno;
	}

	public Dao(String conname, String condata) {
		super();
		this.conname = conname;
		this.condata = condata;
	}


	// 검색 결과를 Table
	public ArrayList<Dto> selectList() {
		
		ArrayList<Dto> dtoList = new ArrayList<Dto>();
		
		String whereStatement = "select seqno, name, telno, relation from userinfo";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(DBConnect.url_mysql, DBConnect.id_mysql, DBConnect.pw_mysql);
			Statement stmt_mysql = conn_mysql.createStatement();
			
			ResultSet rs = stmt_mysql.executeQuery(whereStatement);
			
			while(rs.next()) {
				int wkSeq = rs.getInt(1);
				String skName = rs.getString(2);
				String wkTelno = rs.getString(3);
				String wkRelation = rs.getString(4);
				
				Dto dto = new Dto(wkSeq, skName, wkTelno, wkRelation);
				dtoList.add(dto);
			}
			
			conn_mysql.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dtoList;
		
	}
	
	// Table을 Click하였을 경우
	public Dto tableClick() {
		Dto dto = null;
		
		String whereStatement = "select seqno, name, telno, address, email, relation from userinfo ";
		String whereStatement2 = "where seqno = " + seqno;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(DBConnect.url_mysql, DBConnect.id_mysql, DBConnect.pw_mysql);
			Statement stmt_mysql = conn_mysql.createStatement();
			
			ResultSet rs = stmt_mysql.executeQuery(whereStatement + whereStatement2);
			
			if(rs.next()) {
				int wkSeq = rs.getInt(1);
				String skName = rs.getString(2);
				String wkTelno = rs.getString(3);
				String wkAddress = rs.getString(4);
				String wkEmail = rs.getString(5);
				String wkRelation = rs.getString(6);
				
				dto = new Dto(wkSeq, skName, wkTelno, wkAddress, wkEmail, wkRelation);
			}
			
			conn_mysql.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// 조건 검색 결과를 Table로
	public ArrayList<Dto> conditionList() {
		
		ArrayList<Dto> dtoList = new ArrayList<Dto>();
		
		String whereStatement = "select seqno, name, telno, relation from userinfo ";
		String whereStatement2 = "where " + conname + " like '%" + condata + "%'";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(DBConnect.url_mysql, DBConnect.id_mysql, DBConnect.pw_mysql);
			Statement stmt_mysql = conn_mysql.createStatement();
			
			ResultSet rs = stmt_mysql.executeQuery(whereStatement + whereStatement2);
			
			while(rs.next()) {
				int wkSeq = rs.getInt(1);
				String skName = rs.getString(2);
				String wkTelno = rs.getString(3);
				String wkRelation = rs.getString(4);
				
				Dto dto = new Dto(wkSeq, skName, wkTelno, wkRelation);
				dtoList.add(dto);
			}
			
			conn_mysql.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dtoList;
		
	}
	
	// 삭제
	public boolean deleteAction() {
		PreparedStatement ps = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(DBConnect.url_mysql, DBConnect.id_mysql, DBConnect.pw_mysql);
			Statement stmt_mysql = conn_mysql.createStatement();
			
			String query = "delete from userinfo where seqno = ? ";
			
			ps = conn_mysql.prepareStatement(query);
			ps.setInt(1, seqno);
			ps.executeUpdate();
			
			conn_mysql.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	// 수정
	public boolean updateAction() {
		PreparedStatement ps = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(DBConnect.url_mysql, DBConnect.id_mysql, DBConnect.pw_mysql);
			Statement stmt_mysql = conn_mysql.createStatement();
			
			String query = "update userinfo set name = ?, telno = ?, address = ?, email = ?, relation = ? ";
			String query2 = "where seqno = ?";
			
			ps = conn_mysql.prepareStatement(query + query2);
			ps.setString(1, name.trim());
			ps.setString(2, telno.trim());
			ps.setString(3, address.trim());
			ps.setString(4, email.trim());
			ps.setString(5, relation.trim());
			ps.setInt(6, seqno);
			ps.executeUpdate();
			
			conn_mysql.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
		return false;
	}
	
	// 입력
	public ArrayList<Dto> insertAction() {
		
		ArrayList<Dto> dtoList = new ArrayList<Dto>();
		
		PreparedStatement ps = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(DBConnect.url_mysql, DBConnect.id_mysql, DBConnect.pw_mysql);
			Statement stmt_mysql = conn_mysql.createStatement();
			
			String query = "insert into userinfo (name, telno, address, email, relation) ";
			String query2 = "values (?, ?, ?, ?, ?)";
			
			ps = conn_mysql.prepareStatement(query + query2);
			ps.setString(1, name.trim());
			ps.setString(2, telno.trim());
			ps.setString(3, address.trim());
			ps.setString(4, email.trim());
			ps.setString(5, relation.trim());
			ps.executeUpdate();
			
			conn_mysql.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dtoList;
		
	}
	
} // End
