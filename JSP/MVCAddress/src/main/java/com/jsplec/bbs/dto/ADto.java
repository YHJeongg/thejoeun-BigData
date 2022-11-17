package com.jsplec.bbs.dto;

public class ADto {
	
	int seq;
	String name;
	String tel;
	String address;
	String email;
	String relation;
	
	public ADto() {
		// TODO Auto-generated constructor stub
	}

	public ADto(int seq, String name, String tel, String address, String email, String relation) {
		super();
		this.seq = seq;
		this.name = name;
		this.tel = tel;
		this.address = address;
		this.email = email;
		this.relation = relation;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}
	

}
